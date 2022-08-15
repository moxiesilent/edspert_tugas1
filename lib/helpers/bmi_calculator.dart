import 'dart:math';

import 'package:tugas1/constants/constant.dart';

class BmiCalculator{
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.height,required  this.weight});

  BmiCalculator.fromBmiValue(this.bmi);

  double calculateBmi() {
    double heightInMeter = height! / 100;
    final bmi = weight! / pow(heightInMeter, 2);
    return bmi;
  }

  determineBmiCategory() {
    String category = "";
    if (bmi! < 16.0) {
      category = underweightSevere;
    } else if (bmi! <= 16.9) {
      category = underweightModerate;
    } else if (bmi! <= 18.4) {
      category = underweightMild;
    } else if (bmi! <= 24.9) {
      category = normal;
    } else if (bmi! <= 29.9) {
      category = overweight;
    } else if (bmi! <= 34.9) {
      category = obeseI;
    } else if (bmi! <= 39.9) {
      category = obeseII;
    } else {
      category = obeseIII;
    }

    bmiCategory = category;
    return bmiCategory;
  }

  String getHealthRiskDescription() {
    String desc = '';
    switch (bmiCategory) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional deficiency and osteoporosis.";
        break;
      case normal:
        desc = "Low risk (healthy range).";
        break;
      case overweight:
        desc =
            "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome.";
        break;
    }
    bmiDescription = desc;
    return bmiDescription!;
  }

}