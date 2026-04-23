import 'dart:async';
import 'dart:convert';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../config/ble_config.dart';

class BleUpdate {
  final Guid characteristicUuid;
  final List<int> value;

  const BleUpdate({required this.characteristicUuid, required this.value});
}

class BleService {
  final StreamController<List<ScanResult>> _scanResultsController =
      StreamController<List<ScanResult>>.broadcast();
  final StreamController<BleUpdate> _updatesController =
      StreamController<BleUpdate>.broadcast();
  final StreamController<bool> _connectionController =
      StreamController<bool>.broadcast();

  StreamSubscription<List<ScanResult>>? _scanSubscription;
  StreamSubscription<BluetoothConnectionState>? _connectionSubscription;
  final List<StreamSubscription<List<int>>> _characteristicSubscriptions = [];

  final Map<Guid, BluetoothCharacteristic> _characteristics = {};

  BluetoothDevice? _connectedDevice;
  bool _isConnected = false;

  Stream<List<ScanResult>> get scanResultsStream =>
      _scanResultsController.stream;
  Stream<BleUpdate> get updates => _updatesController.stream;
  Stream<bool> get connectionState => _connectionController.stream;

  BluetoothDevice? get connectedDevice => _connectedDevice;
  bool get isConnected => _isConnected;

  Future<void> startScan() async {
    await _scanSubscription?.cancel();
    _scanSubscription = FlutterBluePlus.scanResults.listen((results) {
      final filtered = results.where(_looksLikeHemePulse).toList();
      _scanResultsController.add(filtered);
    });

    await FlutterBluePlus.stopScan();
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));
  }

  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
  }

  Future<void> connect(BluetoothDevice device) async {
    await disconnect();

    _connectedDevice = device;
    await device.connect(timeout: const Duration(seconds: 8));

    _connectionSubscription = device.connectionState.listen((state) {
      _isConnected = state == BluetoothConnectionState.connected;
      _connectionController.add(_isConnected);
    });

    final services = await device.discoverServices();
    BluetoothService? targetService;
    for (final service in services) {
      if (service.serviceUuid == BleConfig.serviceUuid) {
        targetService = service;
        break;
      }
    }

    if (targetService == null) {
      throw StateError('HemePulse BLE service not found on device.');
    }

    _characteristics.clear();
    for (final characteristic in targetService.characteristics) {
      _characteristics[characteristic.characteristicUuid] = characteristic;
    }

    final notifyUuids = <Guid>[
      BleConfig.packetUuid,
      BleConfig.liveStatusUuid,
      BleConfig.bpmUuid,
      BleConfig.ratioUuid,
      BleConfig.confidenceUuid,
      BleConfig.warningUuid,
      BleConfig.waveformUuid,
      BleConfig.baselineUuid,
    ];

    for (final uuid in notifyUuids) {
      final characteristic = _characteristics[uuid];
      if (characteristic == null) {
        continue;
      }

      if (characteristic.properties.notify) {
        await characteristic.setNotifyValue(true);
      }

      final sub = characteristic.lastValueStream.listen((value) {
        if (value.isEmpty) {
          return;
        }
        _updatesController.add(
          BleUpdate(characteristicUuid: uuid, value: List<int>.from(value)),
        );
      });
      _characteristicSubscriptions.add(sub);
    }

    _isConnected = true;
    _connectionController.add(true);
  }

  Future<void> disconnect() async {
    for (final sub in _characteristicSubscriptions) {
      await sub.cancel();
    }
    _characteristicSubscriptions.clear();

    await _connectionSubscription?.cancel();
    _connectionSubscription = null;

    if (_connectedDevice != null) {
      try {
        await _connectedDevice!.disconnect();
      } catch (_) {
        // Ignore disconnect errors from already-disconnected states.
      }
    }

    _isConnected = false;
    _connectedDevice = null;
    _characteristics.clear();
    _connectionController.add(false);
  }

  Future<void> writeControlCommand(String command) async {
    final control = _characteristics[BleConfig.controlUuid];
    if (control == null) {
      throw StateError('Control characteristic is unavailable.');
    }

    final bytes = utf8.encode(command);
    await control.write(bytes, withoutResponse: !control.properties.write);
  }

  Future<void> requestSnapshot() => writeControlCommand('SNAP');
  Future<void> startBaselineCapture() => writeControlCommand('BASE_START');
  Future<void> clearBaseline() => writeControlCommand('BASE_CLEAR');
  Future<void> startBpmMode() => writeControlCommand('BPM_START');
  Future<void> stopBpmMode() => writeControlCommand('BPM_STOP');
  Future<void> enterPulseMode() => writeControlCommand('MODE_PULSE');
  Future<void> enterIdleMode() => writeControlCommand('MODE_IDLE');

  Future<void> dispose() async {
    await stopScan();
    await _scanSubscription?.cancel();
    await disconnect();
    await _scanResultsController.close();
    await _updatesController.close();
    await _connectionController.close();
  }

  bool _looksLikeHemePulse(ScanResult result) {
    final advName = result.advertisementData.advName;
    final platformName = result.device.platformName;

    return advName.startsWith(BleConfig.deviceNamePrefix) ||
        platformName.startsWith(BleConfig.deviceNamePrefix);
  }
}
