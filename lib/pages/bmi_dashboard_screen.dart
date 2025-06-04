import 'package:bmical/components/buttons/primary_circle_button.dart';
import 'package:bmical/components/buttons/primary_elevated_button.dart';
import 'package:bmical/components/cards/primary_card.dart';
import 'package:bmical/components/text/primary_text.dart';
import 'package:bmical/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BmiDashboardScreen extends StatefulWidget {
  const BmiDashboardScreen({super.key});

  @override
  State<BmiDashboardScreen> createState() => _BmiDashboardScreenState();
}

class _BmiDashboardScreenState extends State<BmiDashboardScreen> {
  double valueHeight = 50;
  int weight = 50;
  int age = 20;
  String selectedGender = 'MALE';

  void calculateBMI() {
    // Convert  cm to m
    double heightInMeters = valueHeight / 100;

    // Calculate BMI
    double bmi = weight / (heightInMeters * heightInMeters);

    // BMI category
    String category;
    Color categoryColor;
    if (bmi < 18.5) {
      category = "Underweight";
      categoryColor = darkOrange;
    } else if (bmi >= 18.5 && bmi < 25) {
      category = "Normal";
      categoryColor = greenColor;
    } else if (bmi >= 25 && bmi < 30) {
      category = "Overweight";
      categoryColor = redColor;
    } else {
      category = "Obese";
      categoryColor = fireBrick;
    }

    //Display Result
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Card(
          color: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryText(
                  text: "Your Result",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                20.height,
                Container(
                  decoration: BoxDecoration(
                    color: gray,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    child: PrimaryText(
                      text: "BMI: ${bmi.toStringAsFixed(1)}",
                      fontSize: 22,
                    ),
                  ),
                ),
                16.height,
                Container(
                  color: categoryColor.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Center(
                      child: PrimaryText(
                        text: "Condition : $category",
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

                16.height,
                PrimaryText(
                  text: getBMIDescription(category),
                  fontSize: 16,
                  color: white,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //Category Message
  String getBMIDescription(String category) {
    switch (category) {
      case "Underweight":
        return "You have a lower than normal body weight. You should eat a bit more.";
      case "Normal":
        return "You have a normal body weight. Good job!";
      case "Overweight":
        return "You have a higher than normal body weight. Try to exercise more.";
      case "Obese":
        return "You have a much higher than normal body weight. Consider consulting a doctor.";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: GenderCard(
                      title: "MALE",
                      imageUrl: "assets/images/male.png",
                      isSelected: selectedGender == "MALE",
                      ontap: () {
                        setState(() {
                          selectedGender = "MALE";
                        });
                      },
                    ),
                  ),
                  5.width,
                  Expanded(
                    child: GenderCard(
                      title: "FEMALE",
                      imageUrl: "assets/images/female.png",
                      isSelected: selectedGender == "FEMALE",
                      ontap: () {
                        setState(() {
                          selectedGender = "FEMALE";
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: PrimaryCard(
                color: lightGray,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            PrimaryText(
                              text: "Height",
                              color: appBackgroundColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PrimaryText(
                                  text: valueHeight.round().toString(),
                                  fontSize: 45,
                                  color: appBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                5.width,
                                PrimaryText(
                                  text: "Cm",
                                  color: appBackgroundColor,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w800,
                                ),
                              ],
                            ),
                            SfSlider(
                              min: 0.0,
                              max: 200.0,
                              value: valueHeight,
                              interval: 50,
                              showTicks: true,
                              activeColor: white,
                              inactiveColor: white,
                              showLabels: true,
                              enableTooltip: true,
                              minorTicksPerInterval: 1,
                              onChanged: (dynamic value) {
                                setState(() {
                                  valueHeight = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: CustomWeightAgeCard(
                      onAddTap: () {
                        setState(() {
                          weight++;
                        });
                      },
                      onRemoveTap: () {
                        setState(() {
                          if (weight > 0) weight--;
                        });
                      },
                      title: "Weight(Kg)",
                      valueDisplay: weight.toString(),
                    ),
                  ),
                  Expanded(
                    child: CustomWeightAgeCard(
                      onAddTap: () {
                        setState(() {
                          age++;
                        });
                      },
                      onRemoveTap: () {
                        setState(() {
                          if (age > 0) age--;
                        });
                      },
                      title: "Age(Years)",
                      valueDisplay: age.toString(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PrimaryElevatedButton(
        onPressed: calculateBMI,
        btnBackgroundColor: fireBrick,
        child: PrimaryText(
          text: "CALCULATE",
          fontWeight: FontWeight.w700,
          fontSize: 25,
          color: white,
        ),
      ),
    );
  }
}

class CustomWeightAgeCard extends StatelessWidget {
  CustomWeightAgeCard({
    super.key,
    required this.title,
    this.valueDisplay = "",
    required this.onAddTap,
    required this.onRemoveTap,
  });

  final String title;
  final String valueDisplay;
  final Function() onAddTap;
  final Function() onRemoveTap;

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      color: cardBg,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  PrimaryText(
                    text: title,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  PrimaryText(
                    text: valueDisplay,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrimaryCircleButton(
                        backgroundColor: dimGrey.withOpacity(0.6),
                        onPressed: onRemoveTap,
                        icon: Icons.remove,
                        size: 30,
                        iconcolor: white,
                      ),
                      PrimaryCircleButton(
                        onPressed: onAddTap,
                        icon: Icons.add,
                        iconcolor: white,
                        size: 30,
                        backgroundColor: lightGrey.withOpacity(0.5),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function() ontap;
  final bool isSelected;

  const GenderCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.ontap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        color: isSelected ? Colors.blue.withOpacity(0.3) : cardBg,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Image.asset(imageUrl),
            ),
            PrimaryText(text: title, fontSize: 25, fontWeight: FontWeight.w900),
          ],
        ),
      ),
    );
  }
}
