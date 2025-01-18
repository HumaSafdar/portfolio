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
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  bool _isVisible = false;
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 0.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double getResponsiveHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.08;
  }

  double getResponsiveHeightImage(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.3;
  }

  double getResponsiveWidth(BuildContext context, double factor) {
    return MediaQuery.of(context).size.width * factor;
  }

  double getResponsiveFontSize(BuildContext context, double baseSize) {
    return MediaQuery.of(context).size.width > 600 ? baseSize * 1.5 : baseSize;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 600;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Appbar(),
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
          !isSmallScreen
              ? Padding(
                  padding: const EdgeInsets.only(left: 100, top: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            duration: const Duration(seconds: 3),
                            opacity: _isVisible ? 1.0 : 0.0,
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: Transform.rotate(
                                angle: _rotationAnimation.value,
                                child: ScaleTransition(
                                  scale: _scaleAnimation,
                                  child: TypewriterAnimatedTextKit(
                                    text: const ['Hi ! MultiTechs Solutions'],
                                    textStyle: TextStyle(
                                        fontSize:
                                            getResponsiveFontSize(context, 20),
                                        color: Colors.pink,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Poppins'),
                                    speed: const Duration(milliseconds: 200),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          TypewriterAnimatedTextKit(
                            totalRepeatCount: 2,
                            text: const ['Software Company'],
                            textStyle: TextStyle(
                                fontSize: getResponsiveFontSize(context, 20),
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Poppins'),
                            speed: const Duration(milliseconds: 200),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomText(
                            title:
                                'A software company is a business that specializes in the development,\nproduction, and distribution of software products and services. These\ncompanies may create applications, programs, or systems that\naddress specific needs or challenges for individuals, businesses,\nor organizations. Software companies often focus on one or more areas,\nsuch as operating systems, productivity software, mobile apps, cloud\ncomputing, artificial intelligence, or cybersecurity solutions.',
                            size: getResponsiveFontSize(context, 9),
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
                          width: getResponsiveWidth(context, 0.3),
                          height: height * 0.7,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: AnimatedOpacity(
                            duration: const Duration(seconds: 3),
                            opacity: _isVisible ? 1.0 : 0.0,
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: Transform.rotate(
                                angle: _rotationAnimation.value,
                                child: ScaleTransition(
                                  scale: _scaleAnimation,
                                  child: TypewriterAnimatedTextKit(
                                    text: const ['Hi ! MultiTechs Solutions'],
                                    textStyle: TextStyle(
                                        fontSize:
                                            getResponsiveFontSize(context, 20),
                                        color: Colors.pink,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Poppins'),
                                    speed: const Duration(milliseconds: 200),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Center(
                          child: TypewriterAnimatedTextKit(
                            totalRepeatCount: 2,
                            text: const ['Software Company'],
                            textStyle: TextStyle(
                                fontSize: getResponsiveFontSize(context, 20),
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Poppins'),
                            speed: const Duration(milliseconds: 200),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Center(
                          child: CustomText(
                            title:
                                'A software company is a business that specializes in the development,\nproduction, and distribution of software products and services. These\ncompanies may create applications, programs, or systems that\naddress specific needs or challenges for individuals, businesses,\nor organizations. Software companies often focus on one or more areas,\nsuch as operating systems, productivity software, mobile apps, cloud\ncomputing, artificial intelligence, or cybersecurity solutions.',
                            size: getResponsiveFontSize(context, 9),
                            weight: FontWeight.w200,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Center(
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/pic1.jpeg",
                              width: getResponsiveWidth(context, 0.7),
                              height: height * 0.5,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
