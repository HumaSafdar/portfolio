import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_company/appbar.dart';
import 'package:portfolio_company/custom_text.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * pi,
                child: Stack(
                  alignment: Alignment.center,
                  children: List.generate(18, (index) {
                    double angle = (index * 4 * pi) / 18;
                    return Positioned(
                      left: 500 * cos(angle),
                      top: 500 * sin(angle),
                      child: const CircleAvatar(
                          radius: 10, backgroundColor: Colors.pink),
                    );
                  }),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TypewriterAnimatedTextKit(
                      totalRepeatCount: 2,
                      text: const ['Hi ! MultiTechs Solutions'],
                      textStyle: const TextStyle(
                          fontSize: 32.0,
                          color: Colors.pink,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Poppins'),
                      speed: const Duration(milliseconds: 200),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TypewriterAnimatedTextKit(
                      totalRepeatCount: 2,
                      text: const ['Software Company'],
                      textStyle: const TextStyle(
                          fontSize: 32.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Poppins'),
                      speed: const Duration(milliseconds: 200),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    const CustomText(
                      title:
                          'A software company is a business that specializes in the development,\nproduction, and distribution of software products and services. These\ncompanies may create applications, programs, or systems that\naddress specific needs or challenges for individuals, businesses,\nor organizations. Software companies often focus on one or more areas,\nsuch as operating systems, productivity software, mobile apps, cloud\ncomputing, artificial intelligence, or cybersecurity solutions.',
                      size: 15,
                      weight: FontWeight.w200,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ],
                ),
                SizedBox(
                  width: width * 0.1,
                ),
                ClipOval(
                  child: Image.asset(
                    "assets/images/pic1.jpeg",
                    width: width * 0.3,
                    height: height * 0.7,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
