# TFLite Flutter - keep TensorFlow Lite classes
-keep class org.tensorflow.** { *; }
-dontwarn org.tensorflow.**

# Keep GPU delegate factory
-keep class org.tensorflow.lite.gpu.** { *; }
-dontwarn org.tensorflow.lite.gpu.**
