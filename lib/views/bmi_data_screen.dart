import 'package:flutter/material.dart';
import 'package:tugas1/constants/constant.dart';
import 'package:tugas1/helpers/bmi_calculator.dart';
import 'package:tugas1/views/bmi_result_screen.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = 'Male';
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == 'Male') ? Colors.white : primaryColor,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: GenderIconText(
                          icon: Icons.male,
                          title: "Male",
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = 'Female';
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == 'Female') ? Colors.white : primaryColor,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: GenderIconText(
                          icon: Icons.female,
                          title: "Female",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            BmiCard(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: labelTextStyle!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$height",
                          style: numberTextStyle,
                        ),
                        Text(
                          "cm",
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 80,
                      max: 200,
                      thumbColor: Colors.red,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        height = value.toInt();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: BmiCard(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: labelTextStyle,
                          ),
                          Text(
                            "$weight",
                            style: numberTextStyle,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  weight -= 1;
                                  if (weight < 20) {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text("Sorry"),
                                        content: const Text(
                                            "Weight should not be under 20."),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(14),
                                              child: const Text("okay"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                    weight = 20;
                                  }
                                  setState(() {});
                                },
                                elevation: 0,
                                shape: const CircleBorder(),
                                fillColor: const Color(0xff212747),
                                constraints: const BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  weight += 1;
                                  if (weight > 200) {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text("Sorry"),
                                        content: const Text(
                                            "Weight should not be higher than 200."),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(14),
                                              child: const Text("okay"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                    weight = 200;
                                  }
                                  setState(() {});
                                },
                                elevation: 0,
                                shape: const CircleBorder(),
                                fillColor: const Color(0xff212747),
                                constraints: const BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: labelTextStyle,
                          ),
                          Text(
                            "$age",
                            style: numberTextStyle,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                onPressed: () {
                                  age--;
                                  if (age < 5) {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text("Sorry"),
                                        content: const Text(
                                            "Age should not be under 5."),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(14),
                                              child: const Text("okay"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                    age = 5;
                                  }
                                  setState(() {});
                                },
                                elevation: 0,
                                shape: const CircleBorder(),
                                fillColor: const Color(0xff212747),
                                constraints: const BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  age++;
                                  if (age > 100) {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text("Sorry"),
                                        content: const Text(
                                            "Your age should not be higher than 100."),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(14),
                                              child: const Text("okay"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                    age = 100;
                                  }
                                  setState(() {});
                                },
                                elevation: 0,
                                shape: const CircleBorder(),
                                fillColor: const Color(0xff212747),
                                constraints: const BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  final bmiCalculator =
                      BmiCalculator(height: height, weight: weight);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return BmiResultScreen(
                          bmiResult: bmiCalculator.calculateBmi(),
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffEC3C66),
                      borderRadius: BorderRadius.circular(15)),
                  height: 60,
                  child: const Center(
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xff272A4e),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor!,
        ),
      ),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
