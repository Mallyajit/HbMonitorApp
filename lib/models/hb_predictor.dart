import 'dart:math';

class HbPredictor {

  static double predict(double lnRatio, int genderInt, double age) {
    double gender = genderInt.toDouble();
    double ln2 = lnRatio * lnRatio;
    double ln3 = lnRatio * lnRatio * lnRatio;
    double age2 = age * age;
    double ln_age = lnRatio * age;
    double ln_gender = lnRatio * gender;
    double age_gender = age * gender;

    double score = 12.796249389648438;

    score += tree0(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree1(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree2(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree3(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree4(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree5(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree6(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree7(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree8(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree9(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree10(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree11(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree12(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree13(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree14(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree15(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree16(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree17(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree18(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree19(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree20(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree21(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree22(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree23(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree24(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree25(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree26(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree27(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree28(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree29(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree30(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree31(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree32(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree33(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree34(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree35(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree36(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree37(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree38(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree39(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree40(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree41(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree42(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree43(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree44(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree45(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree46(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree47(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree48(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree49(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree50(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree51(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree52(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree53(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree54(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree55(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree56(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree57(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree58(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree59(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree60(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree61(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree62(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree63(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree64(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree65(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree66(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree67(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree68(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree69(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree70(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree71(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree72(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree73(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree74(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree75(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree76(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree77(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree78(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree79(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree80(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree81(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree82(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree83(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree84(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree85(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree86(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree87(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree88(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree89(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree90(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree91(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree92(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree93(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree94(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree95(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree96(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree97(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree98(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree99(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree100(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree101(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree102(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree103(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree104(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree105(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree106(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree107(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree108(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree109(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree110(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree111(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree112(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree113(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree114(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree115(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree116(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree117(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree118(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);
    score += tree119(lnRatio, gender, age, age2, ln2, ln3, ln_age, ln_gender, age_gender);

    return score;
  }

  static double tree0(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 4.51623869) {
        if (lnRatio < 0.0596177615) {
          if (ln2 < 0.000103943385) {
            return 0.00455201743;
          } else {
            return -0.0477380082;
          }
        } else {
          if (age < 41) {
            return -0.103824019;
          } else {
            return -0.0622152388;
          }
        }
      } else {
        if (age < 30) {
          return 0.111117557;
        } else {
          if (age < 48) {
            return -0.0602595285;
          } else {
            return -0.00161048479;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (age < 23) {
          if (age < 21) {
            return 0.125796303;
          } else {
            return 0.193221256;
          }
        } else {
          if (ln_age < 9.39110851) {
            return 0.0601605736;
          } else {
            return 0.157506481;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          return -0.103326358;
        } else {
          if (ln_age < 19.2809601) {
            return -0.0187431183;
          } else {
            return -0.0636297986;
          }
        }
      }
    }
  }

  static double tree1(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (lnRatio < 0.1502859) {
          if (lnRatio < 0.0596177615) {
            return -0.0329355299;
          } else {
            return -0.0821440443;
          }
        } else {
          if (age < 30) {
            return 0.106178999;
          } else {
            return -0.0483968668;
          }
        }
      } else {
        if (lnRatio < 0.0896396264) {
          if (lnRatio < 0.0402697846) {
            return -0.0391277634;
          } else {
            return -0.0576515011;
          }
        } else {
          if (lnRatio < 0.129868165) {
            return 0.0305618737;
          } else {
            return -0.0231196079;
          }
        }
      }
    } else {
      if (age < 23) {
        if (age < 21) {
          if (lnRatio < 0.0624650642) {
            return 0.064502731;
          } else {
            return 0.15337944;
          }
        } else {
          return 0.18343769;
        }
      } else {
        if (lnRatio < 0.215254933) {
          if (lnRatio < 0.18658562) {
            return 0.0458183922;
          } else {
            return 0.153535768;
          }
        } else {
          if (age < 33) {
            return 0.0539992414;
          } else {
            return -0.0577582605;
          }
        }
      }
    }
  }

  static double tree2(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 4.51623869) {
        if (lnRatio < 0.0596177615) {
          if (ln2 < 0.000103943385) {
            return 0.00584216556;
          } else {
            return -0.0401031338;
          }
        } else {
          if (age < 41) {
            return -0.0979802012;
          } else {
            return -0.0552583002;
          }
        }
      } else {
        if (age < 30) {
          return 0.102728181;
        } else {
          if (age < 48) {
            return -0.0547154248;
          } else {
            return -0.000803668692;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (age < 23) {
          if (age < 21) {
            return 0.112245731;
          } else {
            return 0.171942875;
          }
        } else {
          if (ln_age < 9.39110851) {
            return 0.0545198098;
          } else {
            return 0.141737834;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          return -0.0945193097;
        } else {
          if (ln_age < 19.2809601) {
            return -0.0151092811;
          } else {
            return -0.0568207614;
          }
        }
      }
    }
  }

  static double tree3(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 5.03944635) {
        if (lnRatio < 0.0402697846) {
          if (ln2 < 0.000103943385) {
            return 0.00562308263;
          } else {
            return -0.0353348367;
          }
        } else {
          if (age < 41) {
            return -0.0928181186;
          } else {
            return -0.0405209213;
          }
        }
      } else {
        if (lnRatio < 0.129868165) {
          if (ln_age < 6.33836126) {
            return 0.00801949669;
          } else {
            return 0.0572999083;
          }
        } else {
          if (age < 30) {
            return 0.0968942419;
          } else {
            return -0.0427159183;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (age < 23) {
          if (lnRatio < 0.0624650642) {
            return 0.1099962;
          } else {
            return 0.167608812;
          }
        } else {
          if (lnRatio < 0.180740014) {
            return 0.0465004258;
          } else {
            return 0.0972351283;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0748152509;
          } else {
            return -0.111102283;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.0146782966;
          } else {
            return -0.0549740866;
          }
        }
      }
    }
  }

  static double tree4(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age_gender < 18) {
      if (ln_age < 4.51623869) {
        if (lnRatio < 0.078610085) {
          if (ln2 < 0.000103943385) {
            return 0.00532102585;
          } else {
            return -0.0411182456;
          }
        } else {
          if (age < 41) {
            return -0.0931722224;
          } else {
            return -0.0428876318;
          }
        }
      } else {
        if (age < 30) {
          return 0.0925878286;
        } else {
          if (lnRatio < 0.132279173) {
            return 0.00930720475;
          } else {
            return -0.0435662195;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (age < 23) {
          if (age < 21) {
            return 0.097146295;
          } else {
            return 0.159587041;
          }
        } else {
          if (lnRatio < 0.180740014) {
            return 0.0443450399;
          } else {
            return 0.0958729908;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0711584836;
          } else {
            return -0.106052183;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.0146943955;
          } else {
            return -0.0500002205;
          }
        }
      }
    }
  }

  static double tree5(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 5.03944635) {
        if (lnRatio < 0.0590290427) {
          if (ln_age < 1.7323997) {
            return -0.0389209799;
          } else {
            return -0.00097066036;
          }
        } else {
          if (age2 < 1681) {
            return -0.0838161632;
          } else {
            return -0.0442302115;
          }
        }
      } else {
        if (lnRatio < 0.129868165) {
          if (ln_age < 6.33836126) {
            return 0.00653711427;
          } else {
            return 0.0530060939;
          }
        } else {
          if (age2 < 900) {
            return 0.0884728357;
          } else {
            return -0.0403714627;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (age2 < 529) {
          if (lnRatio < 0.0624650642) {
            return 0.102541827;
          } else {
            return 0.150857851;
          }
        } else {
          if (ln_age < 9.39110851) {
            return 0.0456753783;
          } else {
            return 0.129738897;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          return -0.083494395;
        } else {
          if (ln_age < 19.2809601) {
            return -0.0133373579;
          } else {
            return -0.050250221;
          }
        }
      }
    }
  }

  static double tree6(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age_gender < 18) {
      if (ln_age < 4.51623869) {
        if (lnRatio < 0.078610085) {
          if (ln2 < 0.000103943385) {
            return 0.00669614971;
          } else {
            return -0.0376667976;
          }
        } else {
          if (lnRatio < 0.10043025) {
            return -0.0958258584;
          } else {
            return -0.0521171764;
          }
        }
      } else {
        if (age < 30) {
          return 0.0855974853;
        } else {
          if (lnRatio < 0.132279173) {
            return 0.00748668471;
          } else {
            return -0.0394356288;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (age < 23) {
          if (age < 21) {
            return 0.0938188359;
          } else {
            return 0.145034567;
          }
        } else {
          if (ln_age < 9.39110851) {
            return 0.0442966968;
          } else {
            return 0.12260326;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0642328188;
          } else {
            return -0.0974364281;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.0124459835;
          } else {
            return -0.0466559418;
          }
        }
      }
    }
  }

  static double tree7(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (lnRatio < 0.162283376) {
          if (lnRatio < 0.0596177615) {
            return -0.0246395599;
          } else {
            return -0.0636113957;
          }
        } else {
          if (age < 30) {
            return 0.080736421;
          } else {
            return -0.0359997191;
          }
        }
      } else {
        if (lnRatio < 0.0883558467) {
          if (lnRatio < 0.0402697846) {
            return -0.028947955;
          } else {
            return -0.0455121435;
          }
        } else {
          if (lnRatio < 0.129868165) {
            return 0.0274915602;
          } else {
            return -0.0134503236;
          }
        }
      }
    } else {
      if (lnRatio < 0.215254933) {
        if (age < 23) {
          if (lnRatio < 0.0624650642) {
            return 0.0854945183;
          } else {
            return 0.13585113;
          }
        } else {
          if (ln_gender < 0.196498007) {
            return 0.0325996093;
          } else {
            return 0.124646954;
          }
        }
      } else {
        if (age < 33) {
          if (lnRatio < 0.244449407) {
            return 0.0521993637;
          } else {
            return 0.0111773871;
          }
        } else {
          if (lnRatio < 0.253534466) {
            return -0.0773024783;
          } else {
            return -0.0240661036;
          }
        }
      }
    }
  }

  static double tree8(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 5.03944635) {
        if (lnRatio < 0.0596177615) {
          if (ln_age < 1.7323997) {
            return -0.0334656686;
          } else {
            return 0.00176536664;
          }
        } else {
          if (age2 < 1681) {
            return -0.0756890997;
          } else {
            return -0.0371921398;
          }
        }
      } else {
        if (lnRatio < 0.129868165) {
          if (ln_age < 6.33415747) {
            return 0.00522948336;
          } else {
            return 0.0499217175;
          }
        } else {
          if (age2 < 900) {
            return 0.0759427026;
          } else {
            return -0.0306821149;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (age2 < 529) {
          if (age2 < 441) {
            return 0.0797795728;
          } else {
            return 0.131165847;
          }
        } else {
          if (ln_age < 9.39110851) {
            return 0.0404281579;
          } else {
            return 0.11147698;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0593353175;
          } else {
            return -0.0894937515;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.0111578917;
          } else {
            return -0.0435618721;
          }
        }
      }
    }
  }

  static double tree9(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age2 < 2500) {
        if (age2 < 1849) {
          if (ln_age < 4.1588645) {
            return -0.0515286513;
          } else {
            return -0.00393270329;
          }
        } else {
          if (lnRatio < 0.132279173) {
            return -0.0300353467;
          } else {
            return -0.108623855;
          }
        }
      } else {
        if (lnRatio < 0.0905797631) {
          if (lnRatio < 0.0402697846) {
            return -0.0256011076;
          } else {
            return -0.0417517573;
          }
        } else {
          if (lnRatio < 0.129868165) {
            return 0.026460452;
          } else {
            return -0.0125942668;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.13271689) {
          if (lnRatio < 0.0629976168) {
            return 0.0756221637;
          } else {
            return 0.128143325;
          }
        } else {
          if (lnRatio < 0.172468707) {
            return 0.0297235157;
          } else {
            return 0.0714550763;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          return -0.0704501271;
        } else {
          if (ln_age < 19.2809601) {
            return -0.0106253512;
          } else {
            return -0.0423172414;
          }
        }
      }
    }
  }

  static double tree10(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 5.03944635) {
        if (lnRatio < 0.0596177615) {
          if (ln_age < 1.59981668) {
            return -0.0310387462;
          } else {
            return 0.00393691566;
          }
        } else {
          if (age < 41) {
            return -0.0650432333;
          } else {
            return -0.0329140835;
          }
        }
      } else {
        if (lnRatio < 0.129868165) {
          if (ln_age < 6.33836126) {
            return 0.00503989868;
          } else {
            return 0.0467154644;
          }
        } else {
          if (age < 30) {
            return 0.0739476904;
          } else {
            return -0.0317657366;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (age < 23) {
          if (age < 21) {
            return 0.0753543898;
          } else {
            return 0.119264066;
          }
        } else {
          if (lnRatio < 0.172468707) {
            return 0.0318717547;
          } else {
            return 0.06787505;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0539187454;
          } else {
            return -0.0814013556;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.0099114608;
          } else {
            return -0.0413554795;
          }
        }
      }
    }
  }

  static double tree11(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 5.03944635) {
        if (ln2 < 0.00355427735) {
          if (ln2 < 0.000103943385) {
            return 0.0129381521;
          } else {
            return -0.0266456362;
          }
        } else {
          if (ln2 < 0.0100862347) {
            return -0.0620269179;
          } else {
            return -0.0296575725;
          }
        }
      } else {
        if (ln2 < 0.09365125) {
          if (age < 30) {
            return 0.0715443864;
          } else {
            return -0.00505021308;
          }
        } else {
          if (ln2 < 0.0983246192) {
            return -0.0349096805;
          } else {
            return -0.0801510438;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.13271689) {
          if (ln2 < 0.0039687003) {
            return 0.0723787397;
          } else {
            return 0.114836812;
          }
        } else {
          if (ln2 < 0.0326669514) {
            return 0.0269336533;
          } else {
            return 0.072040908;
          }
        }
      } else {
        if (ln2 < 0.0642797202) {
          if (ln2 < 0.0548371039) {
            return -0.0515189059;
          } else {
            return -0.0785235092;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.00939657539;
          } else {
            return -0.0394757017;
          }
        }
      }
    }
  }

  static double tree12(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (lnRatio < 0.139460221) {
          if (lnRatio < 0.078321375) {
            return -0.0219878554;
          } else {
            return -0.0562819541;
          }
        } else {
          if (lnRatio < 0.266307622) {
            return -0.000973441114;
          } else {
            return -0.0552683137;
          }
        }
      } else {
        if (lnRatio < 0.0905797631) {
          if (lnRatio < 0.0841774344) {
            return -0.0264234375;
          } else {
            return -0.0440306142;
          }
        } else {
          if (lnRatio < 0.129868165) {
            return 0.0264952872;
          } else {
            return -0.00827965513;
          }
        }
      }
    } else {
      if (lnRatio < 0.215254933) {
        if (age < 23) {
          if (age < 21) {
            return 0.0671986938;
          } else {
            return 0.10732843;
          }
        } else {
          if (ln_gender < 0.196498007) {
            return 0.0248219799;
          } else {
            return 0.104686074;
          }
        }
      } else {
        if (age < 33) {
          if (lnRatio < 0.244449407) {
            return 0.038701117;
          } else {
            return -0.000648413785;
          }
        } else {
          if (lnRatio < 0.253534466) {
            return -0.0605529658;
          } else {
            return -0.018117819;
          }
        }
      }
    }
  }

  static double tree13(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 4.51623869) {
        if (lnRatio < 0.078321375) {
          if (ln2 < 0.000103943385) {
            return 0.0134607358;
          } else {
            return -0.027535487;
          }
        } else {
          if (lnRatio < 0.10043025) {
            return -0.0745632574;
          } else {
            return -0.0362626724;
          }
        }
      } else {
        if (age2 < 900) {
          return 0.0683686957;
        } else {
          if (age2 < 2304) {
            return -0.0327353813;
          } else {
            return 0.00511967717;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.13271689) {
          if (lnRatio < 0.0629976168) {
            return 0.0617914796;
          } else {
            return 0.105922177;
          }
        } else {
          if (lnRatio < 0.172468707) {
            return 0.0238460936;
          } else {
            return 0.0609938093;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.218304977) {
            return -0.0480055436;
          } else {
            return -0.0722018629;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.00831614714;
          } else {
            return -0.0368578248;
          }
        }
      }
    }
  }

  static double tree14(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age_gender < 18) {
      if (age < 50) {
        if (age < 43) {
          if (ln_age < 4.1588645) {
            return -0.0408533625;
          } else {
            return 0.00141444139;
          }
        } else {
          if (lnRatio < 0.132279173) {
            return -0.0227613077;
          } else {
            return -0.0981167406;
          }
        }
      } else {
        if (lnRatio < 0.0905797631) {
          if (lnRatio < 0.0841774344) {
            return -0.022104416;
          } else {
            return -0.0425883979;
          }
        } else {
          if (lnRatio < 0.129868165) {
            return 0.0210332088;
          } else {
            return -0.0106992349;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.13271689) {
          if (lnRatio < 0.0629976168) {
            return 0.0574421585;
          } else {
            return 0.0942403004;
          }
        } else {
          if (ln_age < 9.39110851) {
            return 0.0270590093;
          } else {
            return 0.0903972313;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0453610905;
          } else {
            return -0.0682307631;
          }
        } else {
          if (lnRatio < 0.31575644) {
            return -0.00764988596;
          } else {
            return -0.0348306522;
          }
        }
      }
    }
  }

  static double tree15(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (age < 43) {
          if (ln_age < 4.1588645) {
            return -0.0371677503;
          } else {
            return 0.00224030367;
          }
        } else {
          if (lnRatio < 0.131787285) {
            return -0.0222373772;
          } else {
            return -0.0921939835;
          }
        }
      } else {
        if (lnRatio < 0.0905797631) {
          if (lnRatio < 0.0841774344) {
            return -0.0221063253;
          } else {
            return -0.0399981365;
          }
        } else {
          if (lnRatio < 0.129868165) {
            return 0.0234692656;
          } else {
            return -0.00920690969;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.13271689) {
          if (lnRatio < 0.0629976168) {
            return 0.0535964333;
          } else {
            return 0.0966350585;
          }
        } else {
          if (ln_age < 9.39110851) {
            return 0.0258943979;
          } else {
            return 0.0862882808;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0416099168;
          } else {
            return -0.0658185706;
          }
        } else {
          if (lnRatio < 0.351743609) {
            return -0.00657173339;
          } else {
            return -0.0332632549;
          }
        }
      }
    }
  }

  static double tree16(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (age < 43) {
          if (ln_age < 4.1588645) {
            return -0.0358882807;
          } else {
            return 0.00149309973;
          }
        } else {
          if (lnRatio < 0.132279173) {
            return -0.0204405095;
          } else {
            return -0.0898682103;
          }
        }
      } else {
        if (lnRatio < 0.0963140205) {
          if (lnRatio < 0.0905797631) {
            return -0.0275082737;
          } else {
            return -0.00729900599;
          }
        } else {
          if (lnRatio < 0.129868165) {
            return 0.022000229;
          } else {
            return -0.00723158428;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.13271689) {
          if (lnRatio < 0.0624650642) {
            return 0.0506972671;
          } else {
            return 0.089316003;
          }
        } else {
          if (ln_age < 9.39110851) {
            return 0.025226159;
          } else {
            return 0.0815424174;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0394693799;
          } else {
            return -0.0628268048;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.00660143746;
          } else {
            return -0.0318998657;
          }
        }
      }
    }
  }

  static double tree17(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 4.51623869) {
        if (lnRatio < 0.078610085) {
          if (ln2 < 0.000103943385) {
            return 0.0179153364;
          } else {
            return -0.0196731798;
          }
        } else {
          if (lnRatio < 0.10043025) {
            return -0.0637658536;
          } else {
            return -0.0271894764;
          }
        }
      } else {
        if (age < 30) {
          return 0.0642572194;
        } else {
          if (lnRatio < 0.132279173) {
            return 0.00879350211;
          } else {
            return -0.0240918398;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.13271689) {
          if (lnRatio < 0.0629976168) {
            return 0.055767756;
          } else {
            return 0.0852261707;
          }
        } else {
          if (lnRatio < 0.172468707) {
            return 0.0189612936;
          } else {
            return 0.0505130552;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0382151268;
          } else {
            return -0.0593713187;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.00704556657;
          } else {
            return -0.0307586323;
          }
        }
      }
    }
  }

  static double tree18(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 5.03944635) {
        if (lnRatio < 0.0596177615) {
          if (ln_age < 1.7323997) {
            return -0.0178435966;
          } else {
            return 0.0129580423;
          }
        } else {
          if (age < 41) {
            return -0.0486926176;
          } else {
            return -0.0202350318;
          }
        }
      } else {
        if (age < 30) {
          return 0.0614013262;
        } else {
          if (age < 48) {
            return -0.0287508871;
          } else {
            return 0.00765643362;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.13271689) {
          if (age < 21) {
            return 0.0356419943;
          } else {
            return 0.0736922175;
          }
        } else {
          if (lnRatio < 0.172468707) {
            return 0.0177161004;
          } else {
            return 0.0494604222;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0370275341;
          } else {
            return -0.0566996224;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.00648148311;
          } else {
            return -0.0290802419;
          }
        }
      }
    }
  }

  static double tree19(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (age < 43) {
          if (ln_age < 3.98975039) {
            return -0.0287302919;
          } else {
            return 0.00145749084;
          }
        } else {
          if (lnRatio < 0.132279173) {
            return -0.0162100438;
          } else {
            return -0.0818338394;
          }
        }
      } else {
        if (lnRatio < 0.0963140205) {
          if (lnRatio < 0.0246397629) {
            return -0.031992875;
          } else {
            return -0.0182255041;
          }
        } else {
          if (lnRatio < 0.129868165) {
            return 0.0240168367;
          } else {
            return -0.00760886306;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.13271689) {
          if (lnRatio < 0.0629976168) {
            return 0.0410103276;
          } else {
            return 0.0791208073;
          }
        } else {
          if (ln_age < 9.39110851) {
            return 0.0203946698;
          } else {
            return 0.0724683553;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0358701237;
          } else {
            return -0.0546950884;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.0061721541;
          } else {
            return -0.0280386657;
          }
        }
      }
    }
  }

  static double tree20(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (ln2 < 0.00119172921) {
          if (ln3 < -5.99021917e-07) {
            return -0.0196643304;
          } else {
            return 0.0112868948;
          }
        } else {
          if (ln_age < 1.79667366) {
            return -0.0715563297;
          } else {
            return -0.0233936049;
          }
        }
      } else {
        if (ln2 < 0.00927639101) {
          if (ln2 < 0.00708584068) {
            return -0.0154223023;
          } else {
            return -0.0298260096;
          }
        } else {
          if (age < 62) {
            return 0.0153350011;
          } else {
            return -0.0143663976;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.13271689) {
          if (ln2 < 0.0039687003) {
            return 0.0452620983;
          } else {
            return 0.0762518868;
          }
        } else {
          if (ln_age < 9.39110851) {
            return 0.0199839324;
          } else {
            return 0.07082133;
          }
        }
      } else {
        if (ln2 < 0.0642797202) {
          if (ln2 < 0.0548371039) {
            return -0.0339272954;
          } else {
            return -0.0522089414;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.00563132437;
          } else {
            return -0.0265098717;
          }
        }
      }
    }
  }

  static double tree21(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (lnRatio < 0.18387787) {
          if (lnRatio < 0.0345214307) {
            return 0.000406613486;
          } else {
            return -0.0322784036;
          }
        } else {
          if (age < 30) {
            return 0.0603929162;
          } else {
            return -0.0184604824;
          }
        }
      } else {
        if (lnRatio < 0.0963140205) {
          if (lnRatio < 0.0841774344) {
            return -0.0155585352;
          } else {
            return -0.0290742256;
          }
        } else {
          if (age < 62) {
            return 0.0149999904;
          } else {
            return -0.0138561456;
          }
        }
      }
    } else {
      if (lnRatio < 0.215254933) {
        if (age < 37) {
          if (lnRatio < 0.180740014) {
            return 0.0489384346;
          } else {
            return 0.0849686489;
          }
        } else {
          if (lnRatio < 0.18658562) {
            return 0.0123461708;
          } else {
            return 0.0676021576;
          }
        }
      } else {
        if (age < 33) {
          if (lnRatio < 0.244449407) {
            return 0.0239164177;
          } else {
            return -0.01333939;
          }
        } else {
          if (age < 51) {
            return -0.0493374541;
          } else {
            return -0.016330054;
          }
        }
      }
    }
  }

  static double tree22(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (age < 43) {
          if (ln_age < 4.1588645) {
            return -0.0285724457;
          } else {
            return 0.00467981864;
          }
        } else {
          if (lnRatio < 0.132279173) {
            return -0.0132356528;
          } else {
            return -0.0756149516;
          }
        }
      } else {
        if (lnRatio < 0.0963140205) {
          if (lnRatio < 0.0246397629) {
            return -0.0291590877;
          } else {
            return -0.0142002245;
          }
        } else {
          if (lnRatio < 0.129868165) {
            return 0.0195610579;
          } else {
            return -0.00568368984;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.13271689) {
          if (age < 21) {
            return 0.033613991;
          } else {
            return 0.0654646084;
          }
        } else {
          if (lnRatio < 0.172468707) {
            return 0.0147409132;
          } else {
            return 0.040962752;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          return -0.0398137532;
        } else {
          if (ln_age < 19.2809601) {
            return -0.00437487941;
          } else {
            return -0.0242950656;
          }
        }
      }
    }
  }

  static double tree23(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (lnRatio < 0.10043025) {
        if (lnRatio < 0.0896396264) {
          if (ln2 < 0.000103943385) {
            return 0.019985199;
          } else {
            return -0.0194188971;
          }
        } else {
          if (age < 41) {
            return -0.0856522396;
          } else {
            return -0.00103378296;
          }
        }
      } else {
        if (lnRatio < 0.306024909) {
          if (lnRatio < 0.18658562) {
            return -0.00898534525;
          } else {
            return 0.0190480761;
          }
        } else {
          if (lnRatio < 0.313567579) {
            return -0.0257440545;
          } else {
            return -0.0478279926;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.15465474) {
          if (ln_gender < 0.0626543388) {
            return 0.0342347771;
          } else {
            return 0.0634057447;
          }
        } else {
          if (ln_age < 9.39110851) {
            return 0.0168317091;
          } else {
            return 0.0612747632;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0292600822;
          } else {
            return -0.045783475;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.00417745812;
          } else {
            return -0.0234888028;
          }
        }
      }
    }
  }

  static double tree24(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 4.1588645) {
        if (ln_age < 3.03256512) {
          if (ln_age < 1.79667366) {
            return -0.023264274;
          } else {
            return 0.0107992329;
          }
        } else {
          if (lnRatio < 0.0841774344) {
            return -0.0185916778;
          } else {
            return -0.0519687608;
          }
        }
      } else {
        if (age < 30) {
          return 0.0566074848;
        } else {
          if (lnRatio < 0.132279173) {
            return 0.00453667855;
          } else {
            return -0.0185622815;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.15465474) {
          if (age < 21) {
            return 0.0279514827;
          } else {
            return 0.0582218468;
          }
        } else {
          if (lnRatio < 0.172468707) {
            return 0.0121683851;
          } else {
            return 0.0365662985;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          return -0.0358109549;
        } else {
          if (ln_age < 19.2809601) {
            return -0.00417833356;
          } else {
            return -0.0224317983;
          }
        }
      }
    }
  }

  static double tree25(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (age < 43) {
          if (ln_age < 4.1588645) {
            return -0.0230625179;
          } else {
            return 0.00323090563;
          }
        } else {
          if (lnRatio < 0.132279173) {
            return -0.0104959309;
          } else {
            return -0.0688705891;
          }
        }
      } else {
        if (age < 54) {
          if (lnRatio < 0.10877645) {
            return 0.0134840971;
          } else {
            return 0.0222658403;
          }
        } else {
          if (lnRatio < 0.0905797631) {
            return -0.0174169168;
          } else {
            return 4.77305475e-05;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.13271689) {
          if (lnRatio < 0.0629976168) {
            return 0.0312092341;
          } else {
            return 0.0609422997;
          }
        } else {
          if (ln_age < 9.39110851) {
            return 0.0150149409;
          } else {
            return 0.0582200401;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0276342127;
          } else {
            return -0.0416538902;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.00400849851;
          } else {
            return -0.0216252934;
          }
        }
      }
    }
  }

  static double tree26(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 5.03944635) {
        if (ln_age < 3.03256512) {
          if (ln_age < 1.75814581) {
            return -0.0188299678;
          } else {
            return 0.0118226288;
          }
        } else {
          if (age < 41) {
            return -0.0462768264;
          } else {
            return -0.0135646211;
          }
        }
      } else {
        if (age < 30) {
          return 0.053914763;
        } else {
          if (ln2 < 0.0174977779) {
            return 0.0131960576;
          } else {
            return -0.0160573665;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.15465474) {
          if (ln_gender < 0.0626543388) {
            return 0.0298043825;
          } else {
            return 0.0526344664;
          }
        } else {
          if (ln2 < 0.0326669514) {
            return 0.0109650176;
          } else {
            return 0.0372151323;
          }
        }
      } else {
        if (ln2 < 0.0642797202) {
          if (ln2 < 0.0548371039) {
            return -0.0241447128;
          } else {
            return -0.0397794805;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.00452224026;
          } else {
            return -0.0204492379;
          }
        }
      }
    }
  }

  static double tree27(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (lnRatio < 0.10043025) {
        if (lnRatio < 0.0841774344) {
          if (ln2 < 0.000103943385) {
            return 0.0222221147;
          } else {
            return -0.0145231411;
          }
        } else {
          if (age < 41) {
            return -0.0745375678;
          } else {
            return -0.0184769481;
          }
        }
      } else {
        if (lnRatio < 0.306024909) {
          if (lnRatio < 0.18658562) {
            return -0.00538782123;
          } else {
            return 0.0156245409;
          }
        } else {
          if (lnRatio < 0.313567579) {
            return -0.0231254697;
          } else {
            return -0.0410187021;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.15465474) {
          if (lnRatio < 0.0629976168) {
            return 0.029096121;
          } else {
            return 0.0544407926;
          }
        } else {
          if (lnRatio < 0.244449407) {
            return 0.017672807;
          } else {
            return -0.0193963051;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0248670764;
          } else {
            return -0.0383731239;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.0033184581;
          } else {
            return -0.0190236028;
          }
        }
      }
    }
  }

  static double tree28(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (lnRatio < 0.0345214307) {
          if (lnRatio < -0.00842974056) {
            return -0.0126949595;
          } else {
            return 0.0141881881;
          }
        } else {
          if (ln_age < 1.79667366) {
            return -0.0611024275;
          } else {
            return -0.0154123446;
          }
        }
      } else {
        if (lnRatio < 0.0993297696) {
          if (lnRatio < 0.0841774344) {
            return -0.0101977121;
          } else {
            return -0.0228981879;
          }
        } else {
          if (lnRatio < 0.129868165) {
            return 0.0194213837;
          } else {
            return -0.00368964789;
          }
        }
      }
    } else {
      if (ln_age < 10.325407) {
        if (ln_age < 3.13271689) {
          if (lnRatio < 0.0629976168) {
            return 0.0270313602;
          } else {
            return 0.0516018569;
          }
        } else {
          if (lnRatio < 0.244449407) {
            return 0.0180074181;
          } else {
            return -0.0185146332;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          return -0.0294960644;
        } else {
          if (ln_age < 19.2809601) {
            return -0.00371774216;
          } else {
            return -0.0188480634;
          }
        }
      }
    }
  }

  static double tree29(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (lnRatio < 0.10043025) {
        if (lnRatio < 0.0841774344) {
          if (ln_age < 1.79667366) {
            return -0.0204595234;
          } else {
            return -7.26101644e-05;
          }
        } else {
          if (age < 41) {
            return -0.0710662678;
          } else {
            return -0.0158997569;
          }
        }
      } else {
        if (lnRatio < 0.306024909) {
          if (lnRatio < 0.18658562) {
            return -0.00583949545;
          } else {
            return 0.0185369123;
          }
        } else {
          if (lnRatio < 0.313567579) {
            return -0.0215085112;
          } else {
            return -0.0391918942;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.13387299) {
          if (age < 21) {
            return 0.0198602807;
          } else {
            return 0.0467480682;
          }
        } else {
          if (lnRatio < 0.180740014) {
            return 0.00929607078;
          } else {
            return 0.0343790539;
          }
        }
      } else {
        if (lnRatio < 0.249493942) {
          if (lnRatio < 0.234173238) {
            return -0.0219974555;
          } else {
            return -0.034935277;
          }
        } else {
          if (age < 59) {
            return -0.012488368;
          } else {
            return 0.00133098254;
          }
        }
      }
    }
  }

  static double tree30(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age_gender < 18) {
      if (age < 50) {
        if (age < 43) {
          if (age < 42) {
            return -0.0142480973;
          } else {
            return 0.021618804;
          }
        } else {
          if (age < 46) {
            return -0.0835376009;
          } else {
            return -0.0170617905;
          }
        }
      } else {
        if (age < 54) {
          if (lnRatio < 0.10877645) {
            return 0.0116698369;
          } else {
            return 0.0199275743;
          }
        } else {
          if (age < 58) {
            return -0.0170818623;
          } else {
            return -0.00226736581;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 3.15465474) {
          if (age < 21) {
            return 0.0191221237;
          } else {
            return 0.0431070887;
          }
        } else {
          if (lnRatio < 0.172468707) {
            return 0.0070459554;
          } else {
            return 0.0303850528;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0206407495;
          } else {
            return -0.03347544;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.00294250692;
          } else {
            return -0.0172627736;
          }
        }
      }
    }
  }

  static double tree31(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (lnRatio < 0.0345214307) {
          if (lnRatio < -0.00842974056) {
            return -0.0106685376;
          } else {
            return 0.0167935155;
          }
        } else {
          if (lnRatio < 0.10043025) {
            return -0.0321973674;
          } else {
            return -0.0116726384;
          }
        }
      } else {
        if (lnRatio < 0.0905797631) {
          if (lnRatio < 0.0841774344) {
            return -0.0095352158;
          } else {
            return -0.0270177908;
          }
        } else {
          if (lnRatio < 0.129868165) {
            return 0.0162801277;
          } else {
            return -0.00490805274;
          }
        }
      }
    } else {
      if (lnRatio < 0.215254933) {
        if (ln_gender < 0.196498007) {
          if (age < 27) {
            return 0.0361238569;
          } else {
            return 0.0070791319;
          }
        } else {
          return 0.0622570515;
        }
      } else {
        if (age < 59) {
          if (lnRatio < 0.244449407) {
            return -0.00387499738;
          } else {
            return -0.0184853803;
          }
        } else {
          return 0.00141590042;
        }
      }
    }
  }

  static double tree32(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (lnRatio < 0.10043025) {
        if (lnRatio < 0.078610085) {
          if (ln2 < 0.000103943385) {
            return 0.0209857319;
          } else {
            return -0.0084176017;
          }
        } else {
          if (age < 41) {
            return -0.0636206418;
          } else {
            return -0.0102965636;
          }
        }
      } else {
        if (lnRatio < 0.306024909) {
          if (lnRatio < 0.18658562) {
            return -0.00499948859;
          } else {
            return 0.0138180749;
          }
        } else {
          if (lnRatio < 0.313567579) {
            return -0.0193194766;
          } else {
            return -0.0360785574;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (age < 23) {
          if (age < 21) {
            return 0.0149301169;
          } else {
            return 0.0517829545;
          }
        } else {
          if (ln_age < 9.39110851) {
            return 0.0107213194;
          } else {
            return 0.0462592468;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          return -0.0250351969;
        } else {
          if (ln_age < 19.2809601) {
            return -0.00224869489;
          } else {
            return -0.0154773509;
          }
        }
      }
    }
  }

  static double tree33(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (lnRatio < 0.0596177615) {
          if (age < 33) {
            return -0.00484799827;
          } else {
            return 0.0272354688;
          }
        } else {
          if (lnRatio < 0.10043025) {
            return -0.0353385955;
          } else {
            return -0.0102180978;
          }
        }
      } else {
        if (lnRatio < 0.0905797631) {
          if (lnRatio < 0.0841774344) {
            return -0.0074944431;
          } else {
            return -0.0258357134;
          }
        } else {
          if (lnRatio < 0.129868165) {
            return 0.0159670822;
          } else {
            return -0.00422565453;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 2.50761509) {
          if (age < 21) {
            return 0.014220953;
          } else {
            return 0.0423944853;
          }
        } else {
          if (lnRatio < 0.172468707) {
            return 0.00702882279;
          } else {
            return 0.0267562512;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0194978267;
          } else {
            return -0.0298974849;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.00272993813;
          } else {
            return -0.0147894761;
          }
        }
      }
    }
  }

  static double tree34(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_gender < 0.00512621086) {
      if (age < 50) {
        if (age < 43) {
          if (ln_age < 4.1588645) {
            return -0.016240675;
          } else {
            return 0.00602172175;
          }
        } else {
          if (age < 46) {
            return -0.0784763247;
          } else {
            return -0.0126179187;
          }
        }
      } else {
        if (age < 54) {
          if (lnRatio < 0.10877645) {
            return 0.0102591952;
          } else {
            return 0.0182993505;
          }
        } else {
          if (age < 58) {
            return -0.0150684044;
          } else {
            return 0.00116778596;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 2.50761509) {
          if (age < 21) {
            return 0.0136368573;
          } else {
            return 0.042852357;
          }
        } else {
          if (lnRatio < 0.244449407) {
            return 0.0147259412;
          } else {
            return -0.0212653689;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0175847393;
          } else {
            return -0.0291426685;
          }
        } else {
          if (age < 59) {
            return -0.0104250126;
          } else {
            return 0.00156615011;
          }
        }
      }
    }
  }

  static double tree35(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (lnRatio < 0.0345214307) {
          if (lnRatio < -0.00842974056) {
            return -0.00884242542;
          } else {
            return 0.0164192375;
          }
        } else {
          if (ln_age < 1.79667366) {
            return -0.0512440205;
          } else {
            return -0.0108213089;
          }
        }
      } else {
        if (lnRatio < 0.0993297696) {
          if (lnRatio < 0.0246397629) {
            return -0.0210674014;
          } else {
            return -0.00827535521;
          }
        } else {
          if (lnRatio < 0.129868165) {
            return 0.0151631115;
          } else {
            return -0.00396024343;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (age < 23) {
          if (age < 21) {
            return 0.0114071919;
          } else {
            return 0.0436002836;
          }
        } else {
          if (lnRatio < 0.180740014) {
            return 0.00779353594;
          } else {
            return 0.0280996747;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          return -0.0223399308;
        } else {
          if (ln_age < 19.2809601) {
            return -0.00199835189;
          } else {
            return -0.013823024;
          }
        }
      }
    }
  }

  static double tree36(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age2 < 2500) {
        if (age2 < 1849) {
          if (age2 < 1764) {
            return -0.010616309;
          } else {
            return 0.0223182533;
          }
        } else {
          if (age2 < 2116) {
            return -0.074383527;
          } else {
            return -0.0125663271;
          }
        }
      } else {
        if (age2 < 3844) {
          if (lnRatio < 0.111303374) {
            return -0.00459431391;
          } else {
            return 0.0180140268;
          }
        } else {
          if (lnRatio < 0.0246397629) {
            return -0.0201193579;
          } else {
            return -0.00914593693;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (age2 < 529) {
          if (age2 < 441) {
            return 0.0170093067;
          } else {
            return 0.0405652784;
          }
        } else {
          if (lnRatio < 0.180740014) {
            return 0.00717115402;
          } else {
            return 0.0274074022;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0160064138;
          } else {
            return -0.0261994302;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.00129271031;
          } else {
            return -0.0133208707;
          }
        }
      }
    }
  }

  static double tree37(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (ln2 < 0.000103943385) {
          return 0.0209386125;
        } else {
          if (age < 30) {
            return -0.00222990289;
          } else {
            return -0.0179491267;
          }
        }
      } else {
        if (lnRatio < 0.0905797631) {
          if (lnRatio < 0.0841774344) {
            return -0.00702369818;
          } else {
            return -0.0227467753;
          }
        } else {
          if (lnRatio < 0.129868165) {
            return 0.0128000975;
          } else {
            return -0.00486823125;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 2.50761509) {
          if (lnRatio < 0.0624650642) {
            return 0.0186920296;
          } else {
            return 0.0432005115;
          }
        } else {
          if (ln_age < 9.39110851) {
            return 0.00735329557;
          } else {
            return 0.040191222;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.0159482285;
          } else {
            return -0.0256116893;
          }
        } else {
          if (age < 59) {
            return -0.00918682944;
          } else {
            return 0.00165827281;
          }
        }
      }
    }
  }

  static double tree38(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (lnRatio < 0.10043025) {
        if (lnRatio < 0.0883558467) {
          if (ln_age < 0.758106112) {
            return 0.00797392335;
          } else {
            return -0.0122734187;
          }
        } else {
          if (age < 41) {
            return -0.0589669049;
          } else {
            return -0.0057406663;
          }
        }
      } else {
        if (lnRatio < 0.132279173) {
          if (ln_age < 6.33836126) {
            return 0.000580836728;
          } else {
            return 0.0279840529;
          }
        } else {
          if (lnRatio < 0.139460221) {
            return -0.0464867428;
          } else {
            return -0.00237867516;
          }
        }
      }
    } else {
      if (ln_age < 3.68255305) {
        if (lnRatio < 0.0931609645) {
          if (age < 21) {
            return -0.0173254218;
          } else {
            return 0.0384535305;
          }
        } else {
          if (lnRatio < 0.120209746) {
            return 0.00254317466;
          } else {
            return 0.031038126;
          }
        }
      } else {
        if (ln_age < 10.4673834) {
          if (ln_age < 7.12350416) {
            return -0.000207737306;
          } else {
            return 0.0200150795;
          }
        } else {
          if (lnRatio < 0.249493942) {
            return -0.0179035533;
          } else {
            return -0.00525089633;
          }
        }
      }
    }
  }

  static double tree39(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (lnRatio < 0.10043025) {
        if (lnRatio < 0.0841774344) {
          if (ln_age < 1.79667366) {
            return -0.0173158199;
          } else {
            return 0.00511724968;
          }
        } else {
          if (age < 41) {
            return -0.0547550321;
          } else {
            return -0.0125787733;
          }
        }
      } else {
        if (lnRatio < 0.132279173) {
          if (ln_age < 6.36393166) {
            return 0.00134573691;
          } else {
            return 0.0272275805;
          }
        } else {
          if (lnRatio < 0.138887897) {
            return -0.0463174991;
          } else {
            return -0.00237175752;
          }
        }
      }
    } else {
      if (lnRatio < 0.215254933) {
        if (ln_gender < 0.196498007) {
          if (ln_age < 3.92414355) {
            return 0.0185324363;
          } else {
            return -0.00536257587;
          }
        } else {
          if (age < 37) {
            return 0.0618579797;
          } else {
            return 0.0364111178;
          }
        }
      } else {
        if (age < 27) {
          return -0.0231278092;
        } else {
          if (age < 33) {
            return 0.00563664874;
          } else {
            return -0.00959053449;
          }
        }
      }
    }
  }

  static double tree40(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (lnRatio < 0.10043025) {
        if (lnRatio < 0.0841774344) {
          if (ln_age < 1.79667366) {
            return -0.0148875667;
          } else {
            return 0.00442517968;
          }
        } else {
          if (age2 < 1681) {
            return -0.0531413034;
          } else {
            return -0.0120016327;
          }
        }
      } else {
        if (lnRatio < 0.306024909) {
          if (lnRatio < 0.18658562) {
            return -0.00270889979;
          } else {
            return 0.0200891681;
          }
        } else {
          if (lnRatio < 0.313567579) {
            return -0.0161970444;
          } else {
            return -0.030697519;
          }
        }
      }
    } else {
      if (lnRatio < 0.215254933) {
        if (ln_gender < 0.196498007) {
          if (ln_age < 3.68255305) {
            return 0.0207322668;
          } else {
            return -0.00115555711;
          }
        } else {
          if (age2 < 1369) {
            return 0.0590462461;
          } else {
            return 0.0352277458;
          }
        }
      } else {
        if (age2 < 729) {
          return -0.0220870692;
        } else {
          if (age2 < 1089) {
            return 0.00538045727;
          } else {
            return -0.00849927031;
          }
        }
      }
    }
  }

  static double tree41(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age_gender < 18) {
      if (ln2 < 0.000103943385) {
        return 0.0212639458;
      } else {
        if (lnRatio < 0.0996003523) {
          if (lnRatio < 0.0883558467) {
            return -0.00888700876;
          } else {
            return -0.0376016907;
          }
        } else {
          if (lnRatio < 0.119212203) {
            return 0.0106579214;
          } else {
            return -0.00630057231;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (lnRatio < 0.244449407) {
          if (lnRatio < 0.180740014) {
            return 0.0101830177;
          } else {
            return 0.0319677554;
          }
        } else {
          return -0.0210931506;
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.013813341;
          } else {
            return -0.0226797741;
          }
        } else {
          if (ln_age < 19.2809601) {
            return -0.000890912488;
          } else {
            return -0.0111378534;
          }
        }
      }
    }
  }

  static double tree42(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age2 < 484) {
      if (lnRatio < 0.0624650642) {
        return -0.0187530946;
      } else {
        if (lnRatio < 0.0931609645) {
          return 0.0530536249;
        } else {
          if (lnRatio < 0.120209746) {
            return 0.00532996655;
          } else {
            return 0.0308113191;
          }
        }
      }
    } else {
      if (ln_age < 0.990175545) {
        if (lnRatio < -0.00842974056) {
          return -0.00635125441;
        } else {
          if (lnRatio < 0.0345214307) {
            return 0.0144383404;
          } else {
            return 0.0332796685;
          }
        }
      } else {
        if (ln_age < 1.79667366) {
          if (lnRatio < 0.0246397629) {
            return -0.016038252;
          } else {
            return -0.045350682;
          }
        } else {
          if (ln_age < 2.65175748) {
            return 0.0200493392;
          } else {
            return -0.00257182634;
          }
        }
      }
    }
  }

  static double tree43(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln2 < 0.000103943385) {
        return 0.0196275711;
      } else {
        if (ln_age < 3.97484779) {
          if (ln_age < 3.03256512) {
            return -0.00278105796;
          } else {
            return -0.0263043083;
          }
        } else {
          if (age2 < 900) {
            return 0.0311684255;
          } else {
            return -0.00385977956;
          }
        }
      }
    } else {
      if (lnRatio < 0.215254933) {
        if (ln_gender < 0.196498007) {
          if (ln_age < 3.92414355) {
            return 0.0152175119;
          } else {
            return -0.00470967311;
          }
        } else {
          if (age2 < 1369) {
            return 0.0544860139;
          } else {
            return 0.0325571932;
          }
        }
      } else {
        if (age2 < 2601) {
          if (lnRatio < 0.244449407) {
            return -0.00269773579;
          } else {
            return -0.0215989631;
          }
        } else {
          if (age2 < 3481) {
            return -0.00601419387;
          } else {
            return 0.00281073246;
          }
        }
      }
    }
  }

  static double tree44(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (lnRatio < 0.306024909) {
        if (lnRatio < 0.18658562) {
          if (age < 41) {
            return -0.0142609691;
          } else {
            return -0.00130605244;
          }
        } else {
          if (age < 30) {
            return 0.0501233004;
          } else {
            return 0.00617034081;
          }
        }
      } else {
        if (lnRatio < 0.313567579) {
          return -0.0148618249;
        } else {
          return -0.0290334877;
        }
      }
    } else {
      if (lnRatio < 0.215254933) {
        if (ln_gender < 0.196498007) {
          if (age < 27) {
            return 0.0229983181;
          } else {
            return 0.00174193352;
          }
        } else {
          if (age < 37) {
            return 0.0525495112;
          } else {
            return 0.0293853227;
          }
        }
      } else {
        if (age < 59) {
          if (lnRatio < 0.244449407) {
            return -0.00355985505;
          } else {
            return -0.0132673131;
          }
        } else {
          return 0.00268191914;
        }
      }
    }
  }

  static double tree45(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (lnRatio < 0.10043025) {
        if (lnRatio < 0.0841774344) {
          if (ln_age < 1.79667366) {
            return -0.0130679356;
          } else {
            return 0.0057678814;
          }
        } else {
          if (age < 41) {
            return -0.0460315458;
          } else {
            return -0.0115025016;
          }
        }
      } else {
        if (lnRatio < 0.306024909) {
          if (lnRatio < 0.18658562) {
            return -0.00227490556;
          } else {
            return 0.0193589218;
          }
        } else {
          if (lnRatio < 0.313567579) {
            return -0.0141758844;
          } else {
            return -0.0277137756;
          }
        }
      }
    } else {
      if (lnRatio < 0.215254933) {
        if (ln_gender < 0.196498007) {
          if (ln_age < 3.68255305) {
            return 0.018764969;
          } else {
            return -0.001388081;
          }
        } else {
          if (age < 37) {
            return 0.0501609109;
          } else {
            return 0.0300464667;
          }
        }
      } else {
        if (age < 27) {
          return -0.0186456777;
        } else {
          if (age < 33) {
            return 0.00408415357;
          } else {
            return -0.00713566411;
          }
        }
      }
    }
  }

  static double tree46(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (lnRatio < 0.10043025) {
        if (lnRatio < 0.0841774344) {
          if (ln_age < 1.79667366) {
            return -0.0112880701;
          } else {
            return 0.00438437564;
          }
        } else {
          if (age < 41) {
            return -0.0449107252;
          } else {
            return -0.00969950017;
          }
        }
      } else {
        if (lnRatio < 0.132279173) {
          if (ln_age < 6.91811943) {
            return 0.00365211884;
          } else {
            return 0.0354745723;
          }
        } else {
          if (lnRatio < 0.138188288) {
            return -0.0486992039;
          } else {
            return -0.00154450245;
          }
        }
      }
    } else {
      if (lnRatio < 0.0972072557) {
        if (age < 21) {
          return -0.0201325119;
        } else {
          if (age < 51) {
            return 0.036085587;
          } else {
            return 0.00687058503;
          }
        }
      } else {
        if (age < 37) {
          if (age < 33) {
            return 0.00512963673;
          } else {
            return 0.0390115455;
          }
        } else {
          if (age < 39) {
            return -0.0193530247;
          } else {
            return -0.000520290283;
          }
        }
      }
    }
  }

  static double tree47(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln2 < 0.000103943385) {
        return 0.0203285217;
      } else {
        if (lnRatio < 0.0999722555) {
          if (age < 41) {
            return -0.0244350526;
          } else {
            return -0.00122661924;
          }
        } else {
          if (lnRatio < 0.132279173) {
            return 0.00629271055;
          } else {
            return -0.00694963709;
          }
        }
      }
    } else {
      if (lnRatio < 0.215254933) {
        if (ln_gender < 0.196498007) {
          if (age < 27) {
            return 0.0192287192;
          } else {
            return 0.00160519558;
          }
        } else {
          if (age < 37) {
            return 0.0461075753;
          } else {
            return 0.0284410957;
          }
        }
      } else {
        if (age < 27) {
          return -0.0180313364;
        } else {
          if (age < 59) {
            return -0.00668842066;
          } else {
            return 0.00288586202;
          }
        }
      }
    }
  }

  static double tree48(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (lnRatio < 0.306024909) {
        if (lnRatio < 0.18658562) {
          if (age < 41) {
            return -0.0124975853;
          } else {
            return -0.000868002418;
          }
        } else {
          if (age < 30) {
            return 0.0474127457;
          } else {
            return 0.00738463551;
          }
        }
      } else {
        if (lnRatio < 0.313567579) {
          return -0.0130384089;
        } else {
          return -0.0262851845;
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_gender < 0.0983946994) {
          if (age < 21) {
            return -0.0206670854;
          } else {
            return 0.0221493244;
          }
        } else {
          if (lnRatio < 0.119212203) {
            return -0.00737453206;
          } else {
            return 0.00959505141;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.196900889) {
            return -0.0212358776;
          } else {
            return -0.0124715939;
          }
        } else {
          if (ln_age < 19.2809601) {
            return 0.000417786563;
          } else {
            return -0.00908525661;
          }
        }
      }
    }
  }

  static double tree49(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 0.614764273) {
        if (lnRatio < -0.00842974056) {
          return -0.00247703097;
        } else {
          return 0.0182281472;
        }
      } else {
        if (ln_age < 1.79667366) {
          if (lnRatio < 0.0246397629) {
            return -0.0148231508;
          } else {
            return -0.0394912623;
          }
        } else {
          if (ln_age < 3.03256512) {
            return 0.0172341634;
          } else {
            return -0.00566247432;
          }
        }
      }
    } else {
      if (lnRatio < 0.215254933) {
        if (ln_gender < 0.196498007) {
          if (ln_age < 3.86382484) {
            return 0.0133757619;
          } else {
            return -0.00326901115;
          }
        } else {
          if (age < 37) {
            return 0.0431500115;
          } else {
            return 0.0269754622;
          }
        }
      } else {
        if (age < 27) {
          return -0.0174713936;
        } else {
          if (age < 33) {
            return 0.00353319012;
          } else {
            return -0.0061162007;
          }
        }
      }
    }
  }

  static double tree50(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age < 30) {
      if (ln2 < 0.00651975162) {
        if (ln2 < 0.00231404207) {
          if (ln3 < -5.99021917e-07) {
            return -0.00238947454;
          } else {
            return 0.0210394356;
          }
        } else {
          if (ln_gender < 0.0621468462) {
            return -0.0298558678;
          } else {
            return 0.0239165314;
          }
        }
      } else {
        if (ln2 < 0.00867896434) {
          return 0.0434846021;
        } else {
          if (ln2 < 0.0362474173) {
            return 0.0139889615;
          } else {
            return -0.0162217077;
          }
        }
      }
    } else {
      if (ln2 < 0.00435810769) {
        if (ln_age < 2.18016124) {
          if (ln2 < 0.00138153217) {
            return 0.00520492624;
          } else {
            return -0.0348330028;
          }
        } else {
          if (ln_age < 3.13271689) {
            return 0.0150777549;
          } else {
            return 0.0331005827;
          }
        }
      } else {
        if (age < 32) {
          if (ln2 < 0.0161538329) {
            return -0.0484935045;
          } else {
            return -0.00794677157;
          }
        } else {
          if (ln_age < 3.53261065) {
            return -0.0176505689;
          } else {
            return -0.00107946235;
          }
        }
      }
    }
  }

  static double tree51(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age < 30) {
      if (lnRatio < 0.0807449818) {
        if (lnRatio < 0.0481044911) {
          if (lnRatio < -0.00842974056) {
            return -0.00228084228;
          } else {
            return 0.0188979208;
          }
        } else {
          if (ln_gender < 0.0621468462) {
            return -0.0280240122;
          } else {
            return 0.0233186241;
          }
        }
      } else {
        if (lnRatio < 0.190387547) {
          if (lnRatio < 0.162283376) {
            return 0.0135143744;
          } else {
            return 0.0454971753;
          }
        } else {
          return -0.0159551948;
        }
      }
    } else {
      if (age_gender < 36) {
        if (lnRatio < 0.00377832609) {
          return 0.0189074185;
        } else {
          if (age < 32) {
            return -0.0283170473;
          } else {
            return -0.0042876075;
          }
        }
      } else {
        if (age < 37) {
          if (lnRatio < 0.180740014) {
            return 0.00986225158;
          } else {
            return 0.0412568413;
          }
        } else {
          if (lnRatio < 0.0990470946) {
            return 0.0134103093;
          } else {
            return -0.00401794026;
          }
        }
      }
    }
  }

  static double tree52(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age2 < 900) {
      if (lnRatio < 0.190387547) {
        if (lnRatio < 0.162283376) {
          if (age_gender < 21) {
            return -0.00164620206;
          } else {
            return 0.0203631986;
          }
        } else {
          return 0.0434498154;
        }
      } else {
        return -0.0150491074;
      }
    } else {
      if (age_gender < 36) {
        if (lnRatio < 0.00377832609) {
          return 0.0180479828;
        } else {
          if (age2 < 1024) {
            return -0.0288156159;
          } else {
            return -0.00465551391;
          }
        }
      } else {
        if (age2 < 1369) {
          if (lnRatio < 0.180740014) {
            return 0.00946777314;
          } else {
            return 0.0389263444;
          }
        } else {
          if (lnRatio < 0.0990470946) {
            return 0.0127528524;
          } else {
            return -0.00494112074;
          }
        }
      }
    }
  }

  static double tree53(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.03256512) {
      if (ln_age < 1.79667366) {
        if (ln_age < 0.990175545) {
          if (lnRatio < -0.00842974056) {
            return -0.00211985107;
          } else {
            return 0.0154302167;
          }
        } else {
          if (ln_gender < 0.0621468462) {
            return -0.0254721772;
          } else {
            return 0.0294727329;
          }
        }
      } else {
        if (ln_age < 1.94196784) {
          return 0.0390800498;
        } else {
          if (age_gender < 21) {
            return 0.0177399162;
          } else {
            return 0.00307457452;
          }
        }
      }
    } else {
      if (ln_age < 4.51623869) {
        if (age_gender < 39) {
          if (age < 27) {
            return 0.0116866194;
          } else {
            return -0.0164520256;
          }
        } else {
          if (age < 51) {
            return 0.0197530426;
          } else {
            return -0.000796203618;
          }
        }
      } else {
        if (age < 37) {
          if (lnRatio < 0.215254933) {
            return 0.026536962;
          } else {
            return -0.00395192346;
          }
        } else {
          if (lnRatio < 0.133431375) {
            return 0.00669000437;
          } else {
            return -0.00669248262;
          }
        }
      }
    }
  }

  static double tree54(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (lnRatio < 0.306024909) {
        if (lnRatio < 0.18658562) {
          if (lnRatio < 0.132279173) {
            return -0.000865626789;
          } else {
            return -0.014570293;
          }
        } else {
          if (age < 30) {
            return 0.0398028903;
          } else {
            return 0.00610777875;
          }
        }
      } else {
        if (lnRatio < 0.313567579) {
          return -0.0114151044;
        } else {
          return -0.023855947;
        }
      }
    } else {
      if (ln_age < 10.325407) {
        if (lnRatio < 0.244449407) {
          if (lnRatio < 0.180740014) {
            return 0.00567794079;
          } else {
            return 0.0241428781;
          }
        } else {
          return -0.0143821761;
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.00982695818;
          } else {
            return -0.0181687828;
          }
        } else {
          if (ln_age < 19.2809601) {
            return 0.00148049858;
          } else {
            return -0.00757077197;
          }
        }
      }
    }
  }

  static double tree55(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age < 30) {
      if (lnRatio < 0.190387547) {
        if (lnRatio < 0.162283376) {
          if (age_gender < 21) {
            return -0.0019366917;
          } else {
            return 0.0192942936;
          }
        } else {
          return 0.038509313;
        }
      } else {
        return -0.0138737066;
      }
    } else {
      if (lnRatio < 0.358946174) {
        if (age < 33) {
          if (lnRatio < 0.00377832609) {
            return 0.0163999274;
          } else {
            return -0.0158228613;
          }
        } else {
          if (age < 36) {
            return 0.0187199917;
          } else {
            return -0.000472830667;
          }
        }
      } else {
        if (gender < 1) {
          return -0.022961339;
        } else {
          return -0.00394256134;
        }
      }
    }
  }

  static double tree56(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 0.614764273) {
        if (lnRatio < -0.00842974056) {
          return -0.00187856506;
        } else {
          return 0.0141071826;
        }
      } else {
        if (ln_age < 1.79667366) {
          if (lnRatio < 0.0246397629) {
            return -0.0130726425;
          } else {
            return -0.0334195122;
          }
        } else {
          if (ln_age < 3.03256512) {
            return 0.0153092686;
          } else {
            return -0.0046204729;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (lnRatio < 0.244449407) {
          if (lnRatio < 0.180740014) {
            return 0.00566354161;
          } else {
            return 0.0236835424;
          }
        } else {
          return -0.0132430689;
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.00892917998;
          } else {
            return -0.0173299164;
          }
        } else {
          if (ln_age < 19.2809601) {
            return 0.00155896274;
          } else {
            return -0.00719143404;
          }
        }
      }
    }
  }

  static double tree57(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age < 22) {
      if (lnRatio < 0.0624650642) {
        return -0.0164668318;
      } else {
        if (lnRatio < 0.0931609645) {
          return 0.037094716;
        } else {
          if (lnRatio < 0.120209746) {
            return -0.00198854459;
          } else {
            return 0.0220056009;
          }
        }
      }
    } else {
      if (lnRatio < 0.0660159662) {
        if (ln_gender < 0.0345214307) {
          if (ln_age < 0.818564355) {
            return 0.00750602921;
          } else {
            return -0.00427918695;
          }
        } else {
          if (lnRatio < 0.0624650642) {
            return 0.0178168304;
          } else {
            return 0.0290557239;
          }
        }
      } else {
        if (ln_age < 5.03944635) {
          if (age < 23) {
            return -0.0307273176;
          } else {
            return -0.00683945045;
          }
        } else {
          if (ln_age < 5.27549839) {
            return 0.0327564701;
          } else {
            return -0.000367299159;
          }
        }
      }
    }
  }

  static double tree58(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age < 22) {
      if (lnRatio < 0.0624650642) {
        return -0.0159963407;
      } else {
        if (lnRatio < 0.0931609645) {
          return 0.0356766135;
        } else {
          if (lnRatio < 0.120025754) {
            return -0.00258742436;
          } else {
            return 0.0210053269;
          }
        }
      }
    } else {
      if (lnRatio < 0.0660159662) {
        if (ln_gender < 0.0147381518) {
          if (age < 32) {
            return 0.00900405552;
          } else {
            return -0.00485083601;
          }
        } else {
          if (ln_gender < 0.0626543388) {
            return 0.0169071537;
          } else {
            return 0.0270302575;
          }
        }
      } else {
        if (lnRatio < 0.0963140205) {
          if (age < 37) {
            return -0.0376462042;
          } else {
            return -0.00388897024;
          }
        } else {
          if (lnRatio < 0.31242606) {
            return 0.000482785894;
          } else {
            return -0.0103733269;
          }
        }
      }
    }
  }

  static double tree59(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (lnRatio < 0.10043025) {
        if (lnRatio < 0.0841774344) {
          if (ln2 < 0.000103943385) {
            return 0.0145486789;
          } else {
            return -0.0034959286;
          }
        } else {
          if (age < 41) {
            return -0.0373437256;
          } else {
            return -0.00938107446;
          }
        }
      } else {
        if (lnRatio < 0.306024909) {
          if (lnRatio < 0.18658562) {
            return -0.00154950528;
          } else {
            return 0.015343288;
          }
        } else {
          if (lnRatio < 0.313567579) {
            return -0.0101661766;
          } else {
            return -0.0210296456;
          }
        }
      }
    } else {
      if (ln_gender < 0.0979064032) {
        if (age < 21) {
          return -0.0154764745;
        } else {
          if (age < 51) {
            return 0.0239014179;
          } else {
            return 0.0034840235;
          }
        }
      } else {
        if (age < 37) {
          if (age < 33) {
            return 0.00152203219;
          } else {
            return 0.0292613003;
          }
        } else {
          if (age < 39) {
            return -0.0174830407;
          } else {
            return -0.000801827584;
          }
        }
      }
    }
  }

  static double tree60(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (age < 43) {
          if (age < 42) {
            return -0.00510801142;
          } else {
            return 0.0233823899;
          }
        } else {
          if (age < 46) {
            return -0.0605721474;
          } else {
            return -0.0053033079;
          }
        }
      } else {
        if (ln2 < 0.0123884417) {
          if (age < 53) {
            return 0.00904052053;
          } else {
            return -0.00650288537;
          }
        } else {
          if (ln2 < 0.0168657415) {
            return 0.0281217042;
          } else {
            return -0.00099773414;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (ln_age < 9.39110851) {
          if (ln_gender < 0.0979064032) {
            return 0.0115118977;
          } else {
            return 0.00236824597;
          }
        } else {
          return 0.0245429855;
        }
      } else {
        if (ln2 < 0.0642797202) {
          if (ln2 < 0.0387699604) {
            return -0.018560499;
          } else {
            return -0.00982447434;
          }
        } else {
          if (ln_age < 19.2809601) {
            return 0.00160299393;
          } else {
            return -0.00620431313;
          }
        }
      }
    }
  }

  static double tree61(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (lnRatio < 0.10043025) {
        if (lnRatio < 0.0841774344) {
          if (ln_age < 0.758106112) {
            return 0.00853443332;
          } else {
            return -0.006251371;
          }
        } else {
          if (ln_age < 5.03944635) {
            return -0.0305777825;
          } else {
            return 0.00431057205;
          }
        }
      } else {
        if (lnRatio < 0.131787285) {
          if (age < 32) {
            return -0.0102766231;
          } else {
            return 0.0129570505;
          }
        } else {
          if (lnRatio < 0.139460221) {
            return -0.0335791036;
          } else {
            return -0.0002085585;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (lnRatio < 0.244449407) {
          if (lnRatio < 0.180740014) {
            return 0.00381820323;
          } else {
            return 0.0202069543;
          }
        } else {
          return -0.0126949595;
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.00786016695;
          } else {
            return -0.016156232;
          }
        } else {
          if (ln_age < 19.2809601) {
            return 0.00152632257;
          } else {
            return -0.00606919779;
          }
        }
      }
    }
  }

  static double tree62(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.03256512) {
      if (ln_age < 1.79667366) {
        if (ln_age < 0.990175545) {
          if (lnRatio < -0.00842974056) {
            return -0.00256162882;
          } else {
            return 0.0105244452;
          }
        } else {
          if (ln_gender < 0.0621468462) {
            return -0.0225182083;
          } else {
            return 0.0237356834;
          }
        }
      } else {
        if (ln_age < 2.10112667) {
          return 0.0312036853;
        } else {
          if (age_gender < 21) {
            return 0.0172697213;
          } else {
            return -0.00224744785;
          }
        }
      }
    } else {
      if (ln_age < 4.27013636) {
        if (age_gender < 39) {
          if (ln_age < 3.53261065) {
            return -0.0233253632;
          } else {
            return -0.00799410697;
          }
        } else {
          if (age < 51) {
            return 0.015052028;
          } else {
            return -0.00189501594;
          }
        }
      } else {
        if (age < 43) {
          if (lnRatio < 0.215254933) {
            return 0.0177840646;
          } else {
            return -0.00269700075;
          }
        } else {
          if (age < 48) {
            return -0.0257086195;
          } else {
            return 0.000846436364;
          }
        }
      }
    }
  }

  static double tree63(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 10.3991442) {
      if (lnRatio < 0.18658562) {
        if (age2 < 729) {
          if (lnRatio < 0.0807449818) {
            return -0.00192919862;
          } else {
            return 0.014953481;
          }
        } else {
          if (age2 < 1681) {
            return -0.00956340972;
          } else {
            return 0.00195368123;
          }
        }
      } else {
        if (lnRatio < 0.215254933) {
          return 0.0277819373;
        } else {
          if (lnRatio < 0.257013857) {
            return -0.00832088571;
          } else {
            return 0.0222877171;
          }
        }
      }
    } else {
      if (age2 < 2304) {
        if (lnRatio < 0.313567579) {
          return -0.0093329316;
        } else {
          return -0.0182401016;
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.234173238) {
            return -0.00622075843;
          } else {
            return -0.0154603524;
          }
        } else {
          if (lnRatio < 0.306024909) {
            return 0.0135547221;
          } else {
            return -0.00111365796;
          }
        }
      }
    }
  }

  static double tree64(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 6.33836126) {
        if (ln_age < 5.90449047) {
          if (ln_age < 5.03944635) {
            return -0.00479027024;
          } else {
            return 0.00866252463;
          }
        } else {
          if (lnRatio < 0.131787285) {
            return -0.0045725028;
          } else {
            return -0.0399526134;
          }
        }
      } else {
        if (lnRatio < 0.132279173) {
          if (lnRatio < 0.118813418) {
            return 0.0318284892;
          } else {
            return 0.0131323142;
          }
        } else {
          if (lnRatio < 0.306024909) {
            return 0.000297746825;
          } else {
            return -0.0138897775;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (age < 52) {
          if (ln_age < 7.06916809) {
            return 0.00465798937;
          } else {
            return 0.0164593011;
          }
        } else {
          if (lnRatio < 0.104588613) {
            return 0.0046092174;
          } else {
            return -0.00910187699;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.196900889) {
            return -0.0169853903;
          } else {
            return -0.0092063481;
          }
        } else {
          if (lnRatio < 0.351743609) {
            return 0.00109885214;
          } else {
            return -0.00557870883;
          }
        }
      }
    }
  }

  static double tree65(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.03256512) {
      if (ln_age < 1.79667366) {
        if (ln_age < 0.990175545) {
          if (lnRatio < -0.00842974056) {
            return -0.00209740154;
          } else {
            return 0.0103099979;
          }
        } else {
          if (ln_gender < 0.0621468462) {
            return -0.0200731307;
          } else {
            return 0.0225721672;
          }
        }
      } else {
        if (ln_age < 1.94196784) {
          return 0.0282960422;
        } else {
          if (age_gender < 21) {
            return 0.0156860501;
          } else {
            return 8.28396223e-05;
          }
        }
      }
    } else {
      if (ln_age < 4.27013636) {
        if (age_gender < 39) {
          if (lnRatio < 0.115923546) {
            return -0.0165110324;
          } else {
            return -0.00138971233;
          }
        } else {
          if (age < 51) {
            return 0.014980264;
          } else {
            return -0.00210720836;
          }
        }
      } else {
        if (age < 43) {
          if (lnRatio < 0.215254933) {
            return 0.0162970815;
          } else {
            return -0.00247012521;
          }
        } else {
          if (age < 48) {
            return -0.0217856579;
          } else {
            return 0.00058726006;
          }
        }
      }
    }
  }

  static double tree66(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age < 22) {
      if (lnRatio < 0.0624650642) {
        return -0.013296199;
      } else {
        if (lnRatio < 0.0931609645) {
          return 0.0289151911;
        } else {
          if (lnRatio < 0.120209746) {
            return -0.00344439526;
          } else {
            return 0.0174549632;
          }
        }
      }
    } else {
      if (ln_age < 0.891935587) {
        if (lnRatio < -0.00842974056) {
          return -0.0020232636;
        } else {
          if (age < 32) {
            return 0.013372059;
          } else {
            return 0.000316489837;
          }
        }
      } else {
        if (ln_age < 1.79667366) {
          if (lnRatio < 0.0481044911) {
            return -0.00617178297;
          } else {
            return -0.0269483179;
          }
        } else {
          if (ln_age < 3.03256512) {
            return 0.0136194592;
          } else {
            return -0.00108487788;
          }
        }
      }
    }
  }

  static double tree67(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age < 25) {
      if (lnRatio < 0.0807449818) {
        if (lnRatio < 0.0481044911) {
          if (lnRatio < -0.00842974056) {
            return -0.0019119645;
          } else {
            return 0.0127141196;
          }
        } else {
          if (ln_gender < 0.0621468462) {
            return -0.0190273635;
          } else {
            return 0.0159749985;
          }
        }
      } else {
        if (lnRatio < 0.0931609645) {
          return 0.0269651022;
        } else {
          if (age_gender < 21) {
            return 0.0155556994;
          } else {
            return -0.00306108664;
          }
        }
      }
    } else {
      if (lnRatio < 0.0841774344) {
        if (lnRatio < 0.0500147603) {
          if (lnRatio < 0.0402697846) {
            return 0.0032399022;
          } else {
            return -0.0250367578;
          }
        } else {
          if (age < 47) {
            return 0.0190294906;
          } else {
            return -1.42048566e-05;
          }
        }
      } else {
        if (lnRatio < 0.094821997) {
          if (gender < 1) {
            return -0.0267462134;
          } else {
            return 0.00415472034;
          }
        } else {
          if (lnRatio < 0.18658562) {
            return -0.00347154774;
          } else {
            return 0.00278248149;
          }
        }
      }
    }
  }

  static double tree68(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (lnRatio < 0.31242606) {
      if (lnRatio < 0.257013857) {
        if (lnRatio < 0.234173238) {
          if (lnRatio < 0.18658562) {
            return -0.000571730081;
          } else {
            return 0.0183853805;
          }
        } else {
          if (age < 33) {
            return -0.00594313396;
          } else {
            return -0.0146959415;
          }
        }
      } else {
        if (lnRatio < 0.306024909) {
          if (age < 40) {
            return 0.0212962404;
          } else {
            return 0.0129979849;
          }
        } else {
          if (age < 53) {
            return -0.00113960903;
          } else {
            return 0.00343325152;
          }
        }
      }
    } else {
      if (lnRatio < 0.358946174) {
        if (gender < 1) {
          return -0.00829076022;
        } else {
          if (age < 53) {
            return -0.000734986214;
          } else {
            return -0.00568657415;
          }
        }
      } else {
        if (gender < 1) {
          return -0.0164168049;
        } else {
          return -0.00297977938;
        }
      }
    }
  }

  static double tree69(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 10.3991442) {
      if (ln_age < 9.58516693) {
        if (ln_age < 8.65112495) {
          if (ln_age < 6.72115183) {
            return -0.00085190445;
          } else {
            return 0.0119397193;
          }
        } else {
          if (lnRatio < 0.1502859) {
            return -0.00641887868;
          } else {
            return -0.0143384961;
          }
        }
      } else {
        if (lnRatio < 0.167090192) {
          return -0.00184993749;
        } else {
          if (ln_age < 9.92273521) {
            return 0.00695502758;
          } else {
            return 0.0206145588;
          }
        }
      }
    } else {
      if (age < 48) {
        if (lnRatio < 0.313567579) {
          return -0.00771042844;
        } else {
          return -0.01566438;
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (age_gender < 58) {
            return -0.00610899925;
          } else {
            return -0.016053088;
          }
        } else {
          if (lnRatio < 0.306024909) {
            return 0.012413092;
          } else {
            return -0.00141907728;
          }
        }
      }
    }
  }

  static double tree70(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.03256512) {
      if (ln_age < 1.79667366) {
        if (ln_age < 0.990175545) {
          if (lnRatio < -0.00842974056) {
            return -0.00177964289;
          } else {
            return 0.0100814886;
          }
        } else {
          if (ln_gender < 0.0621468462) {
            return -0.0186900087;
          } else {
            return 0.0201877598;
          }
        }
      } else {
        if (ln_age < 2.47923446) {
          if (lnRatio < 0.0402697846) {
            return 0.00496679544;
          } else {
            return 0.0203101207;
          }
        } else {
          if (age_gender < 21) {
            return 0.0105670979;
          } else {
            return -0.00134453771;
          }
        }
      }
    } else {
      if (ln_age < 5.03944635) {
        if (age_gender < 39) {
          if (ln_age < 3.61925197) {
            return -0.0194924604;
          } else {
            return -0.00540408911;
          }
        } else {
          if (age < 51) {
            return 0.0137761282;
          } else {
            return -0.0018645724;
          }
        }
      } else {
        if (ln_age < 5.27549839) {
          if (lnRatio < 0.101119064) {
            return 0.00602753973;
          } else {
            return 0.0309983101;
          }
        } else {
          if (lnRatio < 0.133431375) {
            return 0.00817067083;
          } else {
            return -0.00302313757;
          }
        }
      }
    }
  }

  static double tree71(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age < 30) {
      if (ln2 < 0.0362474173) {
        if (ln2 < 0.0263358932) {
          if (age < 27) {
            return 0.00634902949;
          } else {
            return -0.0156495981;
          }
        } else {
          return 0.0296033919;
        }
      } else {
        return -0.0112206358;
      }
    } else {
      if (age < 33) {
        if (ln2 < 0.000103943385) {
          return 0.0122695928;
        } else {
          if (ln_gender < 0.0980255753) {
            return -0.0253251642;
          } else {
            return -0.00033282151;
          }
        }
      } else {
        if (age < 36) {
          return 0.0194603335;
        } else {
          if (ln_age < 10.7064877) {
            return 0.00107724324;
          } else {
            return -0.00553750852;
          }
        }
      }
    }
  }

  static double tree72(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 50) {
        if (age < 43) {
          if (age < 42) {
            return -0.0045892722;
          } else {
            return 0.0197642427;
          }
        } else {
          if (age < 46) {
            return -0.0524815992;
          } else {
            return -0.00260720751;
          }
        }
      } else {
        if (lnRatio < 0.111303374) {
          if (age < 53) {
            return 0.00734264869;
          } else {
            return -0.00514098443;
          }
        } else {
          if (lnRatio < 0.118813418) {
            return 0.0298719015;
          } else {
            return 0.00153984095;
          }
        }
      }
    } else {
      if (lnRatio < 0.215254933) {
        if (lnRatio < 0.18658562) {
          if (ln_gender < 0.0979064032) {
            return 0.00828760024;
          } else {
            return -0.000654451782;
          }
        } else {
          return 0.0239926185;
        }
      } else {
        if (age < 51) {
          if (lnRatio < 0.244449407) {
            return -0.00311754947;
          } else {
            return -0.0119928718;
          }
        } else {
          if (ln_age < 19.2809601) {
            return 0.0010780812;
          } else {
            return -0.00497778878;
          }
        }
      }
    }
  }

  static double tree73(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.03256512) {
      if (ln_age < 1.79667366) {
        if (ln_age < 0.990175545) {
          if (lnRatio < 0.0161937382) {
            return 0.00154373329;
          } else {
            return 0.0108252978;
          }
        } else {
          if (ln_gender < 0.0602228418) {
            return -0.0178517755;
          } else {
            return 0.0147406105;
          }
        }
      } else {
        if (ln_age < 1.94196784) {
          return 0.0231468081;
        } else {
          if (ln_gender < 0.0932063907) {
            return 0.0121503836;
          } else {
            return 0.0059826537;
          }
        }
      }
    } else {
      if (ln_age < 4.27013636) {
        if (lnRatio < 0.0841774344) {
          if (age < 47) {
            return 0.0243675578;
          } else {
            return -0.00349601288;
          }
        } else {
          if (gender < 1) {
            return -0.0177938305;
          } else {
            return -0.00221422105;
          }
        }
      } else {
        if (age < 43) {
          if (lnRatio < 0.215254933) {
            return 0.0146778328;
          } else {
            return -0.00171913009;
          }
        } else {
          if (age < 48) {
            return -0.0181038734;
          } else {
            return 0.000842805894;
          }
        }
      }
    }
  }

  static double tree74(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 10.4673834) {
      if (ln2 < 0.0348141938) {
        if (gender < 1) {
          if (ln_age < 6.33836126) {
            return -0.00417840853;
          } else {
            return 0.0119835529;
          }
        } else {
          if (ln_gender < 0.0979064032) {
            return 0.00897032674;
          } else {
            return -0.000337513135;
          }
        }
      } else {
        if (ln2 < 0.0463346839) {
          if (age < 30) {
            return 0.0278172549;
          } else {
            return 0.0189279001;
          }
        } else {
          if (ln2 < 0.0660561249) {
            return -0.00764421327;
          } else {
            return 0.0195687097;
          }
        }
      }
    } else {
      if (age < 48) {
        if (ln2 < 0.0983246192) {
          return -0.00681833411;
        } else {
          return -0.0136048486;
        }
      } else {
        if (ln2 < 0.0642797202) {
          if (age_gender < 58) {
            return -0.00551323593;
          } else {
            return -0.0154707497;
          }
        } else {
          if (ln_gender < 0.311151057) {
            return 0.0072687678;
          } else {
            return -0.00264954334;
          }
        }
      }
    }
  }

  static double tree75(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 0.891935587) {
      if (lnRatio < -0.00842974056) {
        return -0.00165900309;
      } else {
        if (age < 32) {
          return 0.0113754291;
        } else {
          if (gender < 1) {
            return -0.0082770586;
          } else {
            return 0.000314384699;
          }
        }
      }
    } else {
      if (ln_age < 1.75814581) {
        if (age_gender < 21) {
          if (ln_age < 1.17394626) {
            return -0.0101766642;
          } else {
            return -0.0211056527;
          }
        } else {
          if (lnRatio < 0.0153948888) {
            return 9.25779386e-05;
          } else {
            return 0.0142899519;
          }
        }
      } else {
        if (ln_age < 3.03256512) {
          if (ln_gender < 0.0911149755) {
            return 0.012132681;
          } else {
            return 0.00524918782;
          }
        } else {
          if (ln_age < 4.27013636) {
            return -0.00584118441;
          } else {
            return 2.91667275e-05;
          }
        }
      }
    }
  }

  static double tree76(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 6.33836126) {
        if (ln_age < 5.87127018) {
          if (ln_age < 5.03944635) {
            return -0.00464341789;
          } else {
            return 0.00998891797;
          }
        } else {
          if (lnRatio < 0.131787285) {
            return -0.00343434303;
          } else {
            return -0.0351290032;
          }
        }
      } else {
        if (lnRatio < 0.132279173) {
          if (lnRatio < 0.118813418) {
            return 0.0279135145;
          } else {
            return 0.011357002;
          }
        } else {
          if (lnRatio < 0.306024909) {
            return 9.44137573e-05;
          } else {
            return -0.0104609579;
          }
        }
      }
    } else {
      if (age < 37) {
        if (lnRatio < 0.244449407) {
          if (age < 33) {
            return 0.00643122941;
          } else {
            return 0.0197419133;
          }
        } else {
          return -0.00999619719;
        }
      } else {
        if (age < 39) {
          if (lnRatio < 0.101723135) {
            return -0.00225299201;
          } else {
            return -0.033800941;
          }
        } else {
          if (age < 52) {
            return 0.00773710897;
          } else {
            return -0.00231260294;
          }
        }
      }
    }
  }

  static double tree77(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.2551403) {
      if (ln_age < 1.79667366) {
        if (ln_age < 0.990175545) {
          if (age < 32) {
            return 0.00772835827;
          } else {
            return -0.00209832191;
          }
        } else {
          if (lnRatio < 0.0807449818) {
            return -0.0162612703;
          } else {
            return 0.0127429487;
          }
        }
      } else {
        if (ln_age < 2.47923446) {
          if (lnRatio < 0.0402697846) {
            return 0.00428329036;
          } else {
            return 0.0165835805;
          }
        } else {
          if (age < 50) {
            return 0.00212714891;
          } else {
            return 0.0170912649;
          }
        }
      }
    } else {
      if (ln_age < 3.53261065) {
        if (gender < 1) {
          return -0.0312826894;
        } else {
          if (lnRatio < 0.0660159662) {
            return 0.0138326408;
          } else {
            return -0.00044314863;
          }
        }
      } else {
        if (age < 61) {
          if (age < 37) {
            return 0.00386868487;
          } else {
            return -0.00261844485;
          }
        } else {
          if (lnRatio < 0.118414804) {
            return 0.0179772414;
          } else {
            return -0.00398593908;
          }
        }
      }
    }
  }

  static double tree78(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 6.33415747) {
        if (ln_age < 5.90449047) {
          if (age < 41) {
            return -0.00674841693;
          } else {
            return 0.00323001179;
          }
        } else {
          if (lnRatio < 0.131787285) {
            return -0.0022969807;
          } else {
            return -0.0314704254;
          }
        }
      } else {
        if (lnRatio < 0.132279173) {
          if (lnRatio < 0.118813418) {
            return 0.0260751545;
          } else {
            return 0.0110331969;
          }
        } else {
          if (lnRatio < 0.244979605) {
            return -0.00668306137;
          } else {
            return 0.00338948402;
          }
        }
      }
    } else {
      if (ln_gender < 0.0979064032) {
        if (age < 21) {
          return -0.0107243434;
        } else {
          if (age < 51) {
            return 0.0153080672;
          } else {
            return 0.0013100903;
          }
        }
      } else {
        if (age < 37) {
          if (age < 33) {
            return 0.00104963174;
          } else {
            return 0.0196297821;
          }
        } else {
          if (age < 39) {
            return -0.0138663575;
          } else {
            return -0.000887947564;
          }
        }
      }
    }
  }

  static double tree79(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.03256512) {
      if (ln_age < 1.79667366) {
        if (ln_age < 0.990175545) {
          if (age2 < 1024) {
            return 0.00773160625;
          } else {
            return -0.00189254095;
          }
        } else {
          if (ln_gender < 0.0602228418) {
            return -0.0145261018;
          } else {
            return 0.0171302166;
          }
        }
      } else {
        if (ln_age < 1.94196784) {
          return 0.0198824685;
        } else {
          if (age_gender < 21) {
            return 0.0115554538;
          } else {
            return -0.00139512063;
          }
        }
      }
    } else {
      if (age2 < 3721) {
        if (ln_gender < 0.0626543388) {
          if (ln_age < 3.61925197) {
            return -0.0268563423;
          } else {
            return -0.0025137607;
          }
        } else {
          if (lnRatio < 0.0660159662) {
            return 0.0204163752;
          } else {
            return 0.000252339727;
          }
        }
      } else {
        if (lnRatio < 0.118813418) {
          if (lnRatio < 0.102618463) {
            return 0.0030158679;
          } else {
            return 0.0248716753;
          }
        } else {
          if (age2 < 3969) {
            return -0.0015682379;
          } else {
            return -0.00520526757;
          }
        }
      }
    }
  }

  static double tree80(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age2 < 900) {
      if (lnRatio < 0.0800229907) {
        if (lnRatio < 0.0481044911) {
          if (lnRatio < -0.00842974056) {
            return -0.00172920234;
          } else {
            return 0.0091658961;
          }
        } else {
          if (ln_gender < 0.0621468462) {
            return -0.0144865066;
          } else {
            return 0.0132254129;
          }
        }
      } else {
        if (lnRatio < 0.190387547) {
          if (lnRatio < 0.162283376) {
            return 0.00616972102;
          } else {
            return 0.0263573173;
          }
        } else {
          return -0.00955963135;
        }
      }
    } else {
      if (age2 < 1089) {
        if (lnRatio < 0.00377832609) {
          return 0.011236798;
        } else {
          if (ln_gender < 0.0980255753) {
            return -0.0212661903;
          } else {
            return 5.11479411e-05;
          }
        }
      } else {
        if (age2 < 1296) {
          return 0.0207534768;
        } else {
          if (lnRatio < 0.0660159662) {
            return 0.00660588732;
          } else {
            return -0.00126378681;
          }
        }
      }
    }
  }

  static double tree81(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 3.89363432) {
        if (ln_age < 3.03256512) {
          if (ln_age < 1.79667366) {
            return -0.00510374876;
          } else {
            return 0.0102350451;
          }
        } else {
          if (lnRatio < 0.0841774344) {
            return -3.38099235e-05;
          } else {
            return -0.0265692361;
          }
        }
      } else {
        if (age < 43) {
          if (lnRatio < 0.10043025) {
            return -0.0225552879;
          } else {
            return 0.00781437382;
          }
        } else {
          if (age < 46) {
            return -0.0451440029;
          } else {
            return 0.00022606182;
          }
        }
      }
    } else {
      if (ln_gender < 0.242236435) {
        if (ln_gender < 0.196498007) {
          if (ln_age < 7.23502779) {
            return 0.00307249161;
          } else {
            return -0.0139592858;
          }
        } else {
          if (lnRatio < 0.215254933) {
            return 0.0209827777;
          } else {
            return 0.000355434429;
          }
        }
      } else {
        if (age < 59) {
          if (lnRatio < 0.257013857) {
            return -0.00738257123;
          } else {
            return -0.00256302999;
          }
        } else {
          return 0.00359383482;
        }
      }
    }
  }

  static double tree82(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.03256512) {
      if (ln_age < 1.79667366) {
        if (ln_age < 0.891935587) {
          if (lnRatio < -0.00842974056) {
            return -0.00145790796;
          } else {
            return 0.00681585167;
          }
        } else {
          if (ln_gender < 0.0602228418) {
            return -0.0126172472;
          } else {
            return 0.0161335301;
          }
        }
      } else {
        if (ln_age < 1.94196784) {
          return 0.0185880121;
        } else {
          if (age_gender < 21) {
            return 0.0101958876;
          } else {
            return -0.00241372595;
          }
        }
      }
    } else {
      if (ln_age < 4.27013636) {
        if (age_gender < 39) {
          if (lnRatio < 0.115923546) {
            return -0.0134424437;
          } else {
            return 0.000886277878;
          }
        } else {
          if (age2 < 2601) {
            return 0.0101771941;
          } else {
            return -0.00178259856;
          }
        }
      } else {
        if (age2 < 1849) {
          if (lnRatio < 0.215254933) {
            return 0.0126875686;
          } else {
            return -0.00210463419;
          }
        } else {
          if (age2 < 2304) {
            return -0.0168929193;
          } else {
            return 0.000403239304;
          }
        }
      }
    }
  }

  static double tree83(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.03256512) {
      if (ln_age < 1.79667366) {
        if (ln_age < 0.990175545) {
          if (age < 32) {
            return 0.00700789923;
          } else {
            return -0.00235412689;
          }
        } else {
          if (ln_gender < 0.0621468462) {
            return -0.0129408715;
          } else {
            return 0.015595722;
          }
        }
      } else {
        if (ln_age < 1.94196784) {
          return 0.0177619196;
        } else {
          if (age_gender < 21) {
            return 0.00959871989;
          } else {
            return -0.00182029721;
          }
        }
      }
    } else {
      if (ln_age < 4.27013636) {
        if (age_gender < 39) {
          if (age_gender < 38) {
            return -0.00719866669;
          } else {
            return -0.0311580934;
          }
        } else {
          if (lnRatio < 0.0660159662) {
            return 0.0165616218;
          } else {
            return 0.00201261765;
          }
        }
      } else {
        if (age < 43) {
          if (lnRatio < 0.215254933) {
            return 0.0126787694;
          } else {
            return -0.0012413942;
          }
        } else {
          if (age < 48) {
            return -0.0153838592;
          } else {
            return 0.000768417027;
          }
        }
      }
    }
  }

  static double tree84(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln2 < 0.0976100415) {
      if (ln2 < 0.0660561249) {
        if (ln2 < 0.0476570614) {
          if (ln2 < 0.0348141938) {
            return -0.000253510341;
          } else {
            return 0.0145082762;
          }
        } else {
          if (age < 33) {
            return -0.00349814421;
          } else {
            return -0.0118632596;
          }
        }
      } else {
        if (ln2 < 0.09365125) {
          return 0.0162787642;
        } else {
          if (age < 53) {
            return -0.00047162376;
          } else {
            return 0.00340536423;
          }
        }
      }
    } else {
      if (gender < 1) {
        if (ln2 < 0.0983246192) {
          return -0.0061372905;
        } else {
          return -0.0108063007;
        }
      } else {
        if (age < 53) {
          if (ln2 < 0.0997021347) {
            return -0.000154058143;
          } else {
            return 0.000587105751;
          }
        } else {
          return -0.00433085207;
        }
      }
    }
  }

  static double tree85(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 10.7064877) {
      if (lnRatio < 0.18387787) {
        if (age < 27) {
          if (lnRatio < 0.0807449818) {
            return -0.00104019186;
          } else {
            return 0.00982638542;
          }
        } else {
          if (age < 41) {
            return -0.00706479279;
          } else {
            return 0.00158851489;
          }
        }
      } else {
        if (lnRatio < 0.215254933) {
          if (lnRatio < 0.187265798) {
            return 0.00783346873;
          } else {
            return 0.0189992841;
          }
        } else {
          if (lnRatio < 0.257013857) {
            return -0.00648888061;
          } else {
            return 0.0180648901;
          }
        }
      }
    } else {
      if (ln_age < 12.8404427) {
        if (age_gender < 58) {
          if (ln_gender < 0.241859779) {
            return -0.00410954794;
          } else {
            return -0.0117756845;
          }
        } else {
          return -0.0140181249;
        }
      } else {
        if (lnRatio < 0.31242606) {
          if (lnRatio < 0.306024909) {
            return 0.0110020963;
          } else {
            return 0.00283801346;
          }
        } else {
          if (gender < 1) {
            return -0.00986013841;
          } else {
            return -0.00239838054;
          }
        }
      }
    }
  }

  static double tree86(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.03256512) {
      if (ln_age < 1.79667366) {
        if (ln_age < 0.990175545) {
          if (lnRatio < -0.00842974056) {
            return -0.00166509149;
          } else {
            return 0.00656105531;
          }
        } else {
          if (ln_gender < 0.0621468462) {
            return -0.0121021895;
          } else {
            return 0.0149378469;
          }
        }
      } else {
        if (ln_age < 2.47923446) {
          if (lnRatio < 0.0383346267) {
            return 0.00170653209;
          } else {
            return 0.0139197735;
          }
        } else {
          if (age_gender < 21) {
            return 0.00737368828;
          } else {
            return -0.00345031219;
          }
        }
      }
    } else {
      if (ln_age < 6.48295879) {
        if (age_gender < 39) {
          if (ln_age < 3.53261065) {
            return -0.0166695025;
          } else {
            return -0.00315461564;
          }
        } else {
          if (lnRatio < 0.0660159662) {
            return 0.0142470291;
          } else {
            return 0.00382319698;
          }
        }
      } else {
        if (ln_age < 7.73951292) {
          if (age_gender < 37) {
            return 0.0185434576;
          } else {
            return 0.00169290905;
          }
        } else {
          if (lnRatio < 0.196900889) {
            return -0.00751655037;
          } else {
            return 0.000195751767;
          }
        }
      }
    }
  }

  static double tree87(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_gender < 0.0147381518) {
      if (age < 41) {
        if (lnRatio < 0.246599093) {
          if (age < 36) {
            return -0.00151657558;
          } else {
            return -0.0148657952;
          }
        } else {
          return 0.0170625411;
        }
      } else {
        if (lnRatio < 0.132279173) {
          if (age < 47) {
            return 0.0164685026;
          } else {
            return -0.000188080463;
          }
        } else {
          if (lnRatio < 0.137755901) {
            return -0.0393475406;
          } else {
            return -0.00196398818;
          }
        }
      }
    } else {
      if (ln_age < 10.4673834) {
        if (age < 52) {
          if (ln_age < 6.95307302) {
            return 0.00259427004;
          } else {
            return 0.011238955;
          }
        } else {
          if (lnRatio < 0.104588613) {
            return 0.004425928;
          } else {
            return -0.0082527101;
          }
        }
      } else {
        if (lnRatio < 0.253534466) {
          if (lnRatio < 0.196900889) {
            return -0.013075972;
          } else {
            return -0.00593293365;
          }
        } else {
          if (ln_age < 19.2809601) {
            return 0.00163651432;
          } else {
            return -0.00398045639;
          }
        }
      }
    }
  }

  static double tree88(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.03256512) {
      if (ln_age < 1.79667366) {
        if (ln_age < 0.990175545) {
          if (age < 32) {
            return 0.00633263588;
          } else {
            return -0.00145779445;
          }
        } else {
          if (age_gender < 21) {
            return -0.0119929807;
          } else {
            return 0.0143534346;
          }
        }
      } else {
        if (lnRatio < 0.114360906) {
          if (lnRatio < 0.0402697846) {
            return 0.0016128805;
          } else {
            return 0.0113325575;
          }
        } else {
          if (age_gender < 21) {
            return 0.010114966;
          } else {
            return -0.0054186536;
          }
        }
      }
    } else {
      if (age < 61) {
        if (lnRatio < 0.0841774344) {
          if (age < 47) {
            return 0.024171086;
          } else {
            return -0.00123069528;
          }
        } else {
          if (lnRatio < 0.094821997) {
            return -0.0150589868;
          } else {
            return -0.00147722545;
          }
        }
      } else {
        if (lnRatio < 0.118813418) {
          if (lnRatio < 0.102618463) {
            return 0.0029650901;
          } else {
            return 0.0228087455;
          }
        } else {
          if (age < 63) {
            return -0.00102302816;
          } else {
            return -0.00450284965;
          }
        }
      }
    }
  }

  static double tree89(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 10.7064877) {
      if (lnRatio < 0.18658562) {
        if (age2 < 729) {
          if (lnRatio < 0.0807449818) {
            return -0.00114127179;
          } else {
            return 0.00849036779;
          }
        } else {
          if (age2 < 1681) {
            return -0.00580133637;
          } else {
            return 0.0012495413;
          }
        }
      } else {
        if (lnRatio < 0.215254933) {
          if (age2 < 900) {
            return 0.0225585699;
          } else {
            return 0.0129665183;
          }
        } else {
          if (lnRatio < 0.257013857) {
            return -0.00561079988;
          } else {
            return 0.016526483;
          }
        }
      }
    } else {
      if (ln_age < 12.8404427) {
        if (age_gender < 58) {
          if (age_gender < 51) {
            return -0.0073500271;
          } else {
            return 6.25991888e-05;
          }
        } else {
          return -0.0124392752;
        }
      } else {
        if (lnRatio < 0.307137102) {
          if (lnRatio < 0.306024909) {
            return 0.0107905483;
          } else {
            return 0.00307729025;
          }
        } else {
          if (gender < 1) {
            return -0.00948396511;
          } else {
            return -0.0017227846;
          }
        }
      }
    }
  }

  static double tree90(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.2551403) {
      if (ln_age < 1.79667366) {
        if (lnRatio < 0.0481044911) {
          if (age < 32) {
            return 0.00602324959;
          } else {
            return -0.00274495571;
          }
        } else {
          if (age_gender < 21) {
            return -0.012928376;
          } else {
            return 0.0137525247;
          }
        }
      } else {
        if (age_gender < 36) {
          if (ln_age < 3.03256512) {
            return 0.00730653945;
          } else {
            return -0.00602893857;
          }
        } else {
          if (lnRatio < 0.0624650642) {
            return -0.00155408389;
          } else {
            return 0.0164381992;
          }
        }
      }
    } else {
      if (ln_age < 3.53261065) {
        if (gender < 1) {
          return -0.0235828962;
        } else {
          if (lnRatio < 0.0660159662) {
            return 0.0112283705;
          } else {
            return 0.00069007877;
          }
        }
      } else {
        if (age < 61) {
          if (lnRatio < 0.18658562) {
            return -0.00240323995;
          } else {
            return 0.0018997679;
          }
        } else {
          if (lnRatio < 0.118813418) {
            return 0.0148869231;
          } else {
            return -0.00246279244;
          }
        }
      }
    }
  }

  static double tree91(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 10.7064877) {
      if (lnRatio < 0.18387787) {
        if (ln_age < 3.03256512) {
          if (ln_age < 1.79667366) {
            return -0.000981882215;
          } else {
            return 0.0068678814;
          }
        } else {
          if (age < 46) {
            return -0.00571999466;
          } else {
            return 0.0018200815;
          }
        }
      } else {
        if (lnRatio < 0.215254933) {
          if (age < 30) {
            return 0.0214579627;
          } else {
            return 0.0123711806;
          }
        } else {
          if (lnRatio < 0.257013857) {
            return -0.0054941657;
          } else {
            return 0.015688939;
          }
        }
      }
    } else {
      if (ln_age < 12.8404427) {
        if (age_gender < 58) {
          if (ln_gender < 0.241859779) {
            return -0.00312964246;
          } else {
            return -0.010662185;
          }
        } else {
          return -0.0118167875;
        }
      } else {
        if (lnRatio < 0.31242606) {
          if (lnRatio < 0.306024909) {
            return 0.00993559975;
          } else {
            return 0.00260656793;
          }
        } else {
          if (gender < 1) {
            return -0.00903572235;
          } else {
            return -0.0019860426;
          }
        }
      }
    }
  }

  static double tree92(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 0.891935587) {
      if (lnRatio < -0.00842974056) {
        return -0.00197180826;
      } else {
        if (age2 < 1024) {
          return 0.00870902557;
        } else {
          if (ln2 < 1.64875219e-05) {
            return 0.000890827214;
          } else {
            return -0.00025929042;
          }
        }
      }
    } else {
      if (ln_age < 1.79667366) {
        if (age_gender < 21) {
          if (ln_age < 1.17394626) {
            return -0.00548622338;
          } else {
            return -0.0141014699;
          }
        } else {
          if (lnRatio < 0.0153948888) {
            return 0.00013771058;
          } else {
            return 0.0126859909;
          }
        }
      } else {
        if (ln_age < 2.65175748) {
          if (ln_gender < 0.0932063907) {
            return 0.00938792806;
          } else {
            return 0.00290623656;
          }
        } else {
          if (age2 < 1024) {
            return -0.00619883277;
          } else {
            return 4.52401218e-05;
          }
        }
      }
    }
  }

  static double tree93(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_gender < 0.0147381518) {
      if (lnRatio < 0.109497316) {
        if (lnRatio < 0.0841774344) {
          if (age < 47) {
            return 0.00364479772;
          } else {
            return -0.00557261333;
          }
        } else {
          if (ln_age < 5.03944635) {
            return -0.0187244397;
          } else {
            return -0.000335055607;
          }
        }
      } else {
        if (lnRatio < 0.132279173) {
          if (age < 32) {
            return -0.00981284026;
          } else {
            return 0.0128071206;
          }
        } else {
          if (lnRatio < 0.138188288) {
            return -0.0224471185;
          } else {
            return -0.00101663161;
          }
        }
      }
    } else {
      if (lnRatio < 0.104588613) {
        if (age < 21) {
          return -0.00639006123;
        } else {
          if (age < 22) {
            return 0.0153465364;
          } else {
            return 0.00565860188;
          }
        }
      } else {
        if (lnRatio < 0.119212203) {
          if (lnRatio < 0.109195448) {
            return -0.00396447862;
          } else {
            return -0.0198246371;
          }
        } else {
          if (age < 52) {
            return 0.00436121738;
          } else {
            return -0.00327958772;
          }
        }
      }
    }
  }

  static double tree94(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_gender < 0.0345214307) {
      if (age < 46) {
        if (age < 43) {
          if (age < 42) {
            return -0.00255545252;
          } else {
            return 0.0150488233;
          }
        } else {
          return -0.0403969698;
        }
      } else {
        if (age < 47) {
          return 0.0228874013;
        } else {
          if (lnRatio < 0.0896396264) {
            return -0.00565440999;
          } else {
            return 0.00230288994;
          }
        }
      }
    } else {
      if (lnRatio < 0.104588613) {
        if (age < 21) {
          return -0.00556793204;
        } else {
          if (age < 22) {
            return 0.0148363728;
          } else {
            return 0.00520768063;
          }
        }
      } else {
        if (lnRatio < 0.119212203) {
          if (lnRatio < 0.109195448) {
            return -0.00379457488;
          } else {
            return -0.0187851954;
          }
        } else {
          if (age < 52) {
            return 0.00421688054;
          } else {
            return -0.00361680472;
          }
        }
      }
    }
  }

  static double tree95(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 10.7064877) {
      if (lnRatio < 0.257013857) {
        if (ln_gender < 0.0345214307) {
          if (lnRatio < 0.136914715) {
            return 0.000291594188;
          } else {
            return -0.00616112119;
          }
        } else {
          if (age < 52) {
            return 0.00427309889;
          } else {
            return -0.00233376352;
          }
        }
      } else {
        return 0.014984794;
      }
    } else {
      if (ln_age < 12.8404427) {
        if (ln_gender < 0.241859779) {
          if (age_gender < 58) {
            return -0.00292075588;
          } else {
            return -0.0110000549;
          }
        } else {
          return -0.0105943512;
        }
      } else {
        if (lnRatio < 0.307137102) {
          if (lnRatio < 0.306024909) {
            return 0.00971247163;
          } else {
            return 0.00301355845;
          }
        } else {
          if (lnRatio < 0.358946174) {
            return -0.00139299524;
          } else {
            return -0.0090996502;
          }
        }
      }
    }
  }

  static double tree96(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln_age < 6.33836126) {
        if (ln_age < 5.90449047) {
          if (ln_age < 5.03944635) {
            return -0.00288525666;
          } else {
            return 0.00710905297;
          }
        } else {
          if (lnRatio < 0.131787285) {
            return -0.00382142956;
          } else {
            return -0.0241366308;
          }
        }
      } else {
        if (lnRatio < 0.132279173) {
          if (lnRatio < 0.118813418) {
            return 0.0200816207;
          } else {
            return 0.00908926874;
          }
        } else {
          if (ln_age < 9.92273521) {
            return -0.0078475615;
          } else {
            return 0.000768485072;
          }
        }
      }
    } else {
      if (lnRatio < 0.104588613) {
        if (age < 21) {
          return -0.00602707872;
        } else {
          if (age < 22) {
            return 0.0137512526;
          } else {
            return 0.00436359644;
          }
        }
      } else {
        if (lnRatio < 0.117243618) {
          if (lnRatio < 0.109195448) {
            return -0.00344270072;
          } else {
            return -0.0204975475;
          }
        } else {
          if (age < 52) {
            return 0.00422234135;
          } else {
            return -0.00338072772;
          }
        }
      }
    }
  }

  static double tree97(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 0.867518961) {
      if (lnRatio < -0.00842974056) {
        return -0.00179566385;
      } else {
        if (age < 32) {
          if (lnRatio < 0.00377832609) {
            return 0.00985223614;
          } else {
            return 0.00606524944;
          }
        } else {
          if (ln2 < 1.64875219e-05) {
            return 0.00103282928;
          } else {
            return 3.46713605e-05;
          }
        }
      }
    } else {
      if (ln_age < 1.79667366) {
        if (lnRatio < 0.0481044911) {
          if (lnRatio < 0.0246397629) {
            return -0.00340191904;
          } else {
            return 0.00636058813;
          }
        } else {
          if (gender < 1) {
            return -0.013924974;
          } else {
            return -0.00388482702;
          }
        }
      } else {
        if (ln_age < 2.65175748) {
          if (ln_gender < 0.0932063907) {
            return 0.00872774888;
          } else {
            return 0.00174187182;
          }
        } else {
          if (age < 32) {
            return -0.00593279023;
          } else {
            return -0.000233117331;
          }
        }
      }
    }
  }

  static double tree98(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.03256512) {
      if (ln_age < 1.79667366) {
        if (lnRatio < 0.0481044911) {
          if (age < 32) {
            return 0.00537233148;
          } else {
            return -0.00199713185;
          }
        } else {
          if (ln_gender < 0.0621468462) {
            return -0.0109353997;
          } else {
            return 0.0114265764;
          }
        }
      } else {
        if (ln_gender < 0.0932063907) {
          if (lnRatio < 0.0402697846) {
            return 0.000664801046;
          } else {
            return 0.00896501075;
          }
        } else {
          if (lnRatio < 0.120209746) {
            return -0.00549809448;
          } else {
            return 0.00815466139;
          }
        }
      }
    } else {
      if (ln_age < 3.61925197) {
        if (gender < 1) {
          if (lnRatio < 0.078321375) {
            return -0.012150839;
          } else {
            return -0.0246172175;
          }
        } else {
          if (lnRatio < 0.0660159662) {
            return 0.0118488232;
          } else {
            return -0.00102979795;
          }
        }
      } else {
        if (age < 37) {
          if (age < 33) {
            return -0.00206759805;
          } else {
            return 0.0165637564;
          }
        } else {
          if (age < 39) {
            return -0.0105332825;
          } else {
            return -0.000651810085;
          }
        }
      }
    }
  }

  static double tree99(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (lnRatio < 0.31242606) {
      if (lnRatio < 0.257013857) {
        if (lnRatio < 0.234173238) {
          if (lnRatio < 0.18658562) {
            return -0.000278124789;
          } else {
            return 0.00932973996;
          }
        } else {
          if (age < 33) {
            return -0.00374233024;
          } else {
            return -0.00984486751;
          }
        }
      } else {
        if (lnRatio < 0.306024909) {
          return 0.012593451;
        } else {
          if (age < 53) {
            return -0.000178599366;
          } else {
            return 0.00314272079;
          }
        }
      }
    } else {
      if (age < 48) {
        if (lnRatio < 0.313567579) {
          return -0.00468692323;
        } else {
          return -0.00851951074;
        }
      } else {
        if (age < 53) {
          if (lnRatio < 0.31575644) {
            return 0.000480723393;
          } else {
            return 0.00130863197;
          }
        } else {
          return -0.00305869314;
        }
      }
    }
  }

  static double tree100(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_gender < 0.0147381518) {
      if (age < 60) {
        if (lnRatio < 0.0596177615) {
          if (lnRatio < 0.0577103645) {
            return 0.00107004296;
          } else {
            return 0.0104053831;
          }
        } else {
          if (lnRatio < 0.10043025) {
            return -0.00771225011;
          } else {
            return -0.00060859276;
          }
        }
      } else {
        if (age < 62) {
          if (lnRatio < 0.102618463) {
            return 0.00209361711;
          } else {
            return 0.0190647785;
          }
        } else {
          if (age < 63) {
            return -0.000495491026;
          } else {
            return -0.0030502507;
          }
        }
      }
    } else {
      if (lnRatio < 0.104588613) {
        if (age < 21) {
          return -0.00440818258;
        } else {
          if (age < 22) {
            return 0.0126144653;
          } else {
            return 0.00476260111;
          }
        }
      } else {
        if (lnRatio < 0.117243618) {
          if (lnRatio < 0.109195448) {
            return -0.00333456323;
          } else {
            return -0.0191912409;
          }
        } else {
          if (age < 52) {
            return 0.00362509745;
          } else {
            return -0.00314062135;
          }
        }
      }
    }
  }

  static double tree101(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 0.891935587) {
      if (lnRatio < -0.00842974056) {
        return -0.0019676208;
      } else {
        if (age2 < 1024) {
          if (lnRatio < 0.00377832609) {
            return 0.00912423618;
          } else {
            return 0.00571176922;
          }
        } else {
          if (gender < 1) {
            return -0.00760831824;
          } else {
            return 0.000375954318;
          }
        }
      }
    } else {
      if (ln_age < 1.79667366) {
        if (age_gender < 21) {
          if (ln_age < 1.17394626) {
            return -0.00400703866;
          } else {
            return -0.0120513467;
          }
        } else {
          if (lnRatio < 0.0153948888) {
            return 4.06503677e-05;
          } else {
            return 0.0100615984;
          }
        }
      } else {
        if (ln_age < 2.65175748) {
          if (ln_gender < 0.0932063907) {
            return 0.0081244586;
          } else {
            return 0.00128338684;
          }
        } else {
          if (age2 < 3721) {
            return -0.0011431434;
          } else {
            return 0.00482512033;
          }
        }
      }
    }
  }

  static double tree102(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_gender < 0.0626543388) {
      if (ln_age < 3.92414355) {
        if (lnRatio < 0.0841774344) {
          if (lnRatio < 0.0807449818) {
            return -0.000936530472;
          } else {
            return 0.0212559141;
          }
        } else {
          if (age < 30) {
            return 0.000875043857;
          } else {
            return -0.0216541067;
          }
        }
      } else {
        if (lnRatio < 0.131787285) {
          if (lnRatio < 0.111303374) {
            return -0.00191987678;
          } else {
            return 0.0129778627;
          }
        } else {
          if (lnRatio < 0.138188288) {
            return -0.0348524153;
          } else {
            return 8.38849301e-05;
          }
        }
      }
    } else {
      if (lnRatio < 0.0660159662) {
        if (lnRatio < 0.0634116903) {
          return 0.00714001665;
        } else {
          return 0.0169082303;
        }
      } else {
        if (ln_age < 2.10112667) {
          return 0.0117254164;
        } else {
          if (lnRatio < 0.234173238) {
            return 0.00157320616;
          } else {
            return -0.00267624925;
          }
        }
      }
    }
  }

  static double tree103(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln2 < 0.000103943385) {
        return 0.00882501993;
      } else {
        if (ln_age < 3.79441977) {
          if (ln_age < 3.03256512) {
            return -0.000601819891;
          } else {
            return -0.0120604606;
          }
        } else {
          if (age < 40) {
            return 0.00652281661;
          } else {
            return -0.00193587586;
          }
        }
      }
    } else {
      if (lnRatio < 0.104588613) {
        if (age < 21) {
          return -0.00467247982;
        } else {
          if (age < 22) {
            return 0.0111103533;
          } else {
            return 0.00400572969;
          }
        }
      } else {
        if (lnRatio < 0.111157894) {
          if (lnRatio < 0.109195448) {
            return -0.00321006775;
          } else {
            return -0.0251994822;
          }
        } else {
          if (age < 52) {
            return 0.00304883928;
          } else {
            return -0.00278645521;
          }
        }
      }
    }
  }

  static double tree104(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (ln2 < 0.000103943385) {
        return 0.00835093576;
      } else {
        if (ln_age < 3.89363432) {
          if (ln_age < 3.03256512) {
            return -0.000165318343;
          } else {
            return -0.0101025868;
          }
        } else {
          if (age < 36) {
            return 0.00986836012;
          } else {
            return -0.00146710908;
          }
        }
      }
    } else {
      if (ln_gender < 0.242236435) {
        if (age < 52) {
          if (lnRatio < 0.133431375) {
            return 0.00132694666;
          } else {
            return 0.00913054124;
          }
        } else {
          if (lnRatio < 0.104588613) {
            return 0.00209754054;
          } else {
            return -0.00509569002;
          }
        }
      } else {
        if (lnRatio < 0.257013857) {
          if (lnRatio < 0.244449407) {
            return -0.00209813518;
          } else {
            return -0.00885704067;
          }
        } else {
          if (ln_age < 19.2809601) {
            return 0.00236481777;
          } else {
            return -0.00254748832;
          }
        }
      }
    }
  }

  static double tree105(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age < 30) {
      if (lnRatio < 0.190387547) {
        if (lnRatio < 0.162283376) {
          if (ln_age < 3.79034114) {
            return 0.00261941156;
          } else {
            return -0.0145124076;
          }
        } else {
          return 0.0199318361;
        }
      } else {
        return -0.00740903243;
      }
    } else {
      if (age < 32) {
        if (lnRatio < 0.00377832609) {
          return 0.00789161678;
        } else {
          if (lnRatio < 0.127097726) {
            return -0.0283114593;
          } else {
            return -0.00559282769;
          }
        }
      } else {
        if (lnRatio < 0.111303374) {
          if (age < 41) {
            return -0.00763446232;
          } else {
            return 0.0012058682;
          }
        } else {
          if (lnRatio < 0.121615343) {
            return 0.0162557084;
          } else {
            return -0.000921652128;
          }
        }
      }
    }
  }

  static double tree106(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (lnRatio < 0.358946174) {
      if (lnRatio < 0.257013857) {
        if (lnRatio < 0.218304977) {
          if (lnRatio < 0.18658562) {
            return -0.00058129587;
          } else {
            return 0.00942130294;
          }
        } else {
          if (age < 33) {
            return -0.00228470331;
          } else {
            return -0.00888678338;
          }
        }
      } else {
        if (lnRatio < 0.306024909) {
          return 0.0117256483;
        } else {
          if (age < 59) {
            return -0.00198260113;
          } else {
            return 0.00340158935;
          }
        }
      }
    } else {
      if (gender < 1) {
        return -0.00801218767;
      } else {
        return -0.00102412701;
      }
    }
  }

  static double tree107(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 8.65112495) {
      if (ln_age < 6.80171776) {
        if (ln_age < 5.90449047) {
          if (ln_age < 5.03944635) {
            return -0.000433545792;
          } else {
            return 0.00771803362;
          }
        } else {
          if (lnRatio < 0.133431375) {
            return -0.000765234872;
          } else {
            return -0.0142963296;
          }
        }
      } else {
        if (age_gender < 50) {
          if (lnRatio < 0.215254933) {
            return 0.0123084215;
          } else {
            return 0.0015855789;
          }
        } else {
          if (age < 52) {
            return 0.00126924517;
          } else {
            return -0.00367753929;
          }
        }
      }
    } else {
      if (ln_age < 9.58516693) {
        if (lnRatio < 0.1502859) {
          return -0.0047830441;
        } else {
          return -0.00972257089;
        }
      } else {
        if (ln_age < 10.4673834) {
          if (lnRatio < 0.168472111) {
            return -0.00133756397;
          } else {
            return 0.011109516;
          }
        } else {
          if (ln_age < 12.8404427) {
            return -0.00483722985;
          } else {
            return -5.65198789e-05;
          }
        }
      }
    }
  }

  static double tree108(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (gender < 1) {
      if (age < 60) {
        if (ln2 < 0.000103943385) {
          return 0.00758219743;
        } else {
          if (age < 33) {
            return -0.00475209719;
          } else {
            return -0.00102850457;
          }
        }
      } else {
        if (age < 62) {
          if (lnRatio < 0.102618463) {
            return 0.0025371688;
          } else {
            return 0.016505165;
          }
        } else {
          if (ln2 < 0.000239367102) {
            return -0.00934956875;
          } else {
            return -0.00163132756;
          }
        }
      }
    } else {
      if (lnRatio < 0.104588613) {
        if (age < 21) {
          return -0.00459508365;
        } else {
          if (age < 22) {
            return 0.0105659291;
          } else {
            return 0.00365115399;
          }
        }
      } else {
        if (lnRatio < 0.118414804) {
          if (lnRatio < 0.109195448) {
            return -0.00276007666;
          } else {
            return -0.0166751947;
          }
        } else {
          if (age < 52) {
            return 0.00331586343;
          } else {
            return -0.00248079165;
          }
        }
      }
    }
  }

  static double tree109(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (lnRatio < 0.358946174) {
      if (lnRatio < 0.18658562) {
        if (lnRatio < 0.136914715) {
          if (ln_age < 7.04157972) {
            return 0.000110097149;
          } else {
            return 0.0129457479;
          }
        } else {
          if (age2 < 1849) {
            return 0.0047319564;
          } else {
            return -0.00822792482;
          }
        }
      } else {
        if (lnRatio < 0.215254933) {
          if (age2 < 900) {
            return 0.018495433;
          } else {
            return 0.00890684966;
          }
        } else {
          if (lnRatio < 0.257013857) {
            return -0.00456148945;
          } else {
            return 0.0031731599;
          }
        }
      }
    } else {
      if (gender < 1) {
        return -0.00759528065;
      } else {
        return -0.000935101532;
      }
    }
  }

  static double tree110(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_gender < 0.0147381518) {
      if (ln_age < 6.33836126) {
        if (ln_age < 5.90449047) {
          if (ln_age < 5.03944635) {
            return -0.0023006096;
          } else {
            return 0.00649484387;
          }
        } else {
          if (lnRatio < 0.139460221) {
            return -0.0151759638;
          } else {
            return 0.0158825051;
          }
        }
      } else {
        if (lnRatio < 0.132279173) {
          if (lnRatio < 0.118813418) {
            return 0.0149330273;
          } else {
            return 0.00852743909;
          }
        } else {
          if (ln_age < 9.92273521) {
            return -0.00618058676;
          } else {
            return 0.00132753339;
          }
        }
      }
    } else {
      if (lnRatio < 0.101119064) {
        if (age < 21) {
          return -0.00439574476;
        } else {
          if (age < 22) {
            return 0.0099773882;
          } else {
            return 0.00399819156;
          }
        }
      } else {
        if (lnRatio < 0.120209746) {
          if (lnRatio < 0.109195448) {
            return -0.00189618114;
          } else {
            return -0.0133374035;
          }
        } else {
          if (age < 46) {
            return 0.00475288136;
          } else {
            return -0.00140164734;
          }
        }
      }
    }
  }

  static double tree111(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 10.7064877) {
      if (ln_age < 6.73659086) {
        if (ln_age < 5.90449047) {
          if (ln_age < 5.03944635) {
            return -0.000438018295;
          } else {
            return 0.0063508763;
          }
        } else {
          if (lnRatio < 0.132279173) {
            return -0.000826943666;
          } else {
            return -0.014299701;
          }
        }
      } else {
        if (age_gender < 52) {
          if (ln_age < 7.73951292) {
            return 0.00991871674;
          } else {
            return 0.00141532847;
          }
        } else {
          if (lnRatio < 0.14314808) {
            return -0.00318688038;
          } else {
            return -0.0096277874;
          }
        }
      }
    } else {
      if (ln_age < 12.8404427) {
        if (ln_gender < 0.241859779) {
          if (ln_gender < 0.196498007) {
            return -0.0054106391;
          } else {
            return 0.0015217464;
          }
        } else {
          return -0.00885034539;
        }
      } else {
        if (lnRatio < 0.31575644) {
          if (lnRatio < 0.306024909) {
            return 0.00790684577;
          } else {
            return 0.00191836362;
          }
        } else {
          if (gender < 1) {
            return -0.00717514521;
          } else {
            return -0.0018317065;
          }
        }
      }
    }
  }

  static double tree112(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_gender < 0.0345214307) {
      if (age < 33) {
        if (lnRatio < 0.0279438309) {
          if (lnRatio < -0.00842974056) {
            return -0.00159611704;
          } else {
            return 0.00597132929;
          }
        } else {
          if (age < 31) {
            return -0.00209140894;
          } else {
            return -0.0201175455;
          }
        }
      } else {
        if (age < 36) {
          return 0.018371284;
        } else {
          if (age < 37) {
            return -0.0176298674;
          } else {
            return 2.43747036e-05;
          }
        }
      }
    } else {
      if (lnRatio < 0.104588613) {
        if (age < 21) {
          return -0.00418093475;
        } else {
          if (lnRatio < 0.0660159662) {
            return 0.00883294083;
          } else {
            return 0.00292277196;
          }
        }
      } else {
        if (lnRatio < 0.120209746) {
          if (lnRatio < 0.109195448) {
            return -0.00261779525;
          } else {
            return -0.0117367143;
          }
        } else {
          if (age < 46) {
            return 0.00442704838;
          } else {
            return -0.00131388649;
          }
        }
      }
    }
  }

  static double tree113(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (lnRatio < 0.358946174) {
      if (lnRatio < 0.257013857) {
        if (lnRatio < 0.234173238) {
          if (lnRatio < 0.187265798) {
            return -0.000212954867;
          } else {
            return 0.00798721518;
          }
        } else {
          if (age < 33) {
            return -0.00206367276;
          } else {
            return -0.00806606654;
          }
        }
      } else {
        if (lnRatio < 0.306024909) {
          return 0.0109622953;
        } else {
          if (age < 59) {
            return -0.00174542947;
          } else {
            return 0.00325306249;
          }
        }
      }
    } else {
      if (gender < 1) {
        return -0.00692259148;
      } else {
        return -0.000798010849;
      }
    }
  }

  static double tree114(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_gender < 0.0345214307) {
      if (ln_age < 6.33836126) {
        if (ln_age < 5.90449047) {
          if (ln_age < 5.03944635) {
            return -0.00175043405;
          } else {
            return 0.00551238982;
          }
        } else {
          if (lnRatio < 0.139460221) {
            return -0.0140203927;
          } else {
            return 0.0158301834;
          }
        }
      } else {
        if (lnRatio < 0.132279173) {
          if (lnRatio < 0.118813418) {
            return 0.0140075358;
          } else {
            return 0.0079437783;
          }
        } else {
          if (lnRatio < 0.306024909) {
            return 0.000754320878;
          } else {
            return -0.00532992603;
          }
        }
      }
    } else {
      if (lnRatio < 0.104588613) {
        if (age < 21) {
          return -0.0039960444;
        } else {
          if (age < 22) {
            return 0.00941606425;
          } else {
            return 0.00399471633;
          }
        }
      } else {
        if (lnRatio < 0.120209746) {
          if (lnRatio < 0.109195448) {
            return -0.00249648793;
          } else {
            return -0.00922762975;
          }
        } else {
          if (age < 46) {
            return 0.00395948766;
          } else {
            return -0.00168358127;
          }
        }
      }
    }
  }

  static double tree115(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (age < 30) {
      if (ln2 < 0.0362474173) {
        if (ln2 < 0.0263358932) {
          if (ln_age < 3.79034114) {
            return 0.00291016116;
          } else {
            return -0.0131148472;
          }
        } else {
          return 0.0165790245;
        }
      } else {
        return -0.00628380338;
      }
    } else {
      if (age < 32) {
        if (ln2 < 0.000103943385) {
          return 0.0070902505;
        } else {
          if (ln2 < 0.0161538329) {
            return -0.0255157482;
          } else {
            return -0.00693406118;
          }
        }
      } else {
        if (ln2 < 0.0123884417) {
          if (age < 41) {
            return -0.00662231818;
          } else {
            return 0.00149298261;
          }
        } else {
          if (ln2 < 0.0147902919) {
            return 0.0136901662;
          } else {
            return -0.00059571251;
          }
        }
      }
    }
  }

  static double tree116(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_gender < 0.0626543388) {
      if (ln_age < 5.03944635) {
        if (lnRatio < 0.0841774344) {
          if (lnRatio < 0.0807449818) {
            return -0.000218737594;
          } else {
            return 0.0136534814;
          }
        } else {
          if (lnRatio < 0.10043025) {
            return -0.0153319528;
          } else {
            return -0.000259078341;
          }
        }
      } else {
        if (age2 < 900) {
          return 0.0161249451;
        } else {
          if (lnRatio < 0.132279173) {
            return 0.00493417773;
          } else {
            return -0.00264058867;
          }
        }
      }
    } else {
      if (lnRatio < 0.0660159662) {
        if (lnRatio < 0.0634116903) {
          return 0.00586156873;
        } else {
          return 0.0150284981;
        }
      } else {
        if (age2 < 1369) {
          if (lnRatio < 0.244449407) {
            return 0.00453055464;
          } else {
            return -0.00593819609;
          }
        } else {
          if (age2 < 1521) {
            return -0.0089281816;
          } else {
            return 0.000372380571;
          }
        }
      }
    }
  }

  static double tree117(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.03256512) {
      if (ln_age < 1.79667366) {
        if (ln2 < 0.00231404207) {
          if (age < 32) {
            return 0.00370077416;
          } else {
            return -0.00141060015;
          }
        } else {
          if (ln_gender < 0.0621468462) {
            return -0.00893897004;
          } else {
            return 0.008114147;
          }
        }
      } else {
        if (ln_gender < 0.0932063907) {
          if (ln2 < 0.00146954367) {
            return 0.000566315663;
          } else {
            return 0.00747959921;
          }
        } else {
          if (ln2 < 0.0144503824) {
            return -0.00375885004;
          } else {
            return 0.00572818099;
          }
        }
      }
    } else {
      if (ln_age < 3.53261065) {
        if (ln_gender < 0.0626543388) {
          if (ln2 < 0.0039687003) {
            return -0.00522184372;
          } else {
            return -0.0165043231;
          }
        } else {
          if (ln2 < 0.00435810769) {
            return 0.0117914733;
          } else {
            return -0.00194245332;
          }
        }
      } else {
        if (age < 61) {
          if (age < 54) {
            return 0.000511397491;
          } else {
            return -0.00299891201;
          }
        } else {
          if (ln2 < 0.0141166272) {
            return 0.00887574535;
          } else {
            return -0.00129558798;
          }
        }
      }
    }
  }

  static double tree118(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.03256512) {
      if (ln_age < 1.79667366) {
        if (lnRatio < 0.0481044911) {
          if (age < 32) {
            return 0.00366830383;
          } else {
            return -0.00140769489;
          }
        } else {
          if (gender < 1) {
            return -0.0104612587;
          } else {
            return -0.00230427226;
          }
        }
      } else {
        if (lnRatio < 0.114360906) {
          if (lnRatio < 0.0402697846) {
            return 0.000434642396;
          } else {
            return 0.00703328475;
          }
        } else {
          if (age_gender < 21) {
            return 0.00556869525;
          } else {
            return -0.00372356921;
          }
        }
      }
    } else {
      if (ln_age < 3.53261065) {
        if (gender < 1) {
          return -0.0157798287;
        } else {
          if (lnRatio < 0.0660159662) {
            return 0.0101971729;
          } else {
            return -0.00148830016;
          }
        }
      } else {
        if (lnRatio < 0.0841774344) {
          if (age < 47) {
            return 0.0231630579;
          } else {
            return -0.00441256119;
          }
        } else {
          if (lnRatio < 0.0905797631) {
            return -0.00947957486;
          } else {
            return -7.19040108e-05;
          }
        }
      }
    }
  }

  static double tree119(double lnRatio, double gender, double age, double age2, double ln2, double ln3, double ln_age, double ln_gender, double age_gender) {
    if (ln_age < 3.03256512) {
      if (ln_age < 1.75814581) {
        if (lnRatio < 0.0481044911) {
          if (lnRatio < -0.00842974056) {
            return -0.00189413223;
          } else {
            return 0.00318101235;
          }
        } else {
          if (ln_gender < 0.0621468462) {
            return -0.00717776595;
          } else {
            return 0.00691437721;
          }
        }
      } else {
        if (ln_gender < 0.0932063907) {
          if (lnRatio < 0.0402697846) {
            return 0.000345570705;
          } else {
            return 0.00677012233;
          }
        } else {
          if (lnRatio < 0.120209746) {
            return -0.00355433556;
          } else {
            return 0.00521039171;
          }
        }
      }
    } else {
      if (lnRatio < 0.18658562) {
        if (age < 46) {
          if (age < 43) {
            return -0.00162483717;
          } else {
            return -0.0157241933;
          }
        } else {
          if (age < 47) {
            return 0.0223329216;
          } else {
            return -0.000544152223;
          }
        }
      } else {
        if (lnRatio < 0.215254933) {
          if (age < 51) {
            return 0.0102657638;
          } else {
            return -0.0109660868;
          }
        } else {
          if (lnRatio < 0.257013857) {
            return -0.00384246418;
          } else {
            return 0.0015485615;
          }
        }
      }
    }
  }

}
