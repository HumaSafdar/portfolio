import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_company/widgets/appbar.dart';

class AboutSection extends StatefulWidget {
  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with TickerProviderStateMixin {
  bool _isVisible = false;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
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

  double getResponsiveFontSize(BuildContext context, double baseSize) {
    return MediaQuery.of(context).size.width > 600 ? baseSize * 1.5 : baseSize;
  }

  double getResponsiveHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.05;
  }

  double getResponsiveWidth(BuildContext context, double factor) {
    return MediaQuery.of(context).size.width * factor;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 600;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: const Appbar(),
        body: Center(
            child: Stack(alignment: Alignment.center, children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/pic1.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.7),
          ),
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
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
                                totalRepeatCount: 2,
                                text: const ['MultiTechs Solutions'],
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
                      const SizedBox(height: 20),
                      AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: _isVisible ? 1.0 : 0.0,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Text(
                            'MultiTechs Solutions is a forward-thinking IT agency that stands at the\nforefront of technological innovation, dedicated to delivering bespoke\nsolutions that cater to the unique challenges of today’s businesses.Our\ndiverse team of skilled professionals brings together a wealth of experi\nence and expertise, ensuring that we provide high-quality services acr\noss various domains, including web development, iOS and Android app\nlication development, eCommerce website design, and robust web apps.',
                            style: TextStyle(
                                fontSize: getResponsiveFontSize(context, 12),
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                width: getResponsiveWidth(context, 0.21),
                                height: getResponsiveHeight(context) * 4,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.pink.shade200, Colors.pink],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 15,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.verified,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Experienced Team',
                                          style: TextStyle(
                                            fontSize: getResponsiveFontSize(
                                                context, 9),
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Expert-driven excellence',
                                          style: TextStyle(
                                            fontSize: getResponsiveFontSize(
                                                context, 8),
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width: getResponsiveWidth(context, 0.03)),
                              // Container 2
                              Container(
                                width: getResponsiveWidth(context, 0.21),
                                height: getResponsiveHeight(context) *
                                    4, // Adjusted for height
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 15,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.people_outline_rounded,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Client Centric Approach',
                                          style: TextStyle(
                                            fontSize: getResponsiveFontSize(
                                                context, 9),
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Your needs, our focus',
                                          style: TextStyle(
                                            fontSize: getResponsiveFontSize(
                                                context, 8),
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width: getResponsiveWidth(context, 0.03)),
                              // Container 3
                              Container(
                                width: getResponsiveWidth(context, 0.21),
                                height: getResponsiveHeight(context) *
                                    4, // Adjusted for height
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.blue.shade300, Colors.blue],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 15,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.laptop_chromebook_rounded,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Cutting Edge Technologies',
                                          style: TextStyle(
                                            fontSize: getResponsiveFontSize(
                                                context, 9),
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Innovating with the latest.',
                                          style: TextStyle(
                                            fontSize: getResponsiveFontSize(
                                                context, 8),
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  width: getResponsiveWidth(context, 0.03)),
                              // Container 4
                              Container(
                                width: getResponsiveWidth(context, 0.21),
                                height: getResponsiveHeight(context) *
                                    4, // Adjusted for height
                                decoration: BoxDecoration(
                                  color: Colors.green.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 15,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time_filled_rounded,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Timely Delivery',
                                          style: TextStyle(
                                            fontSize: getResponsiveFontSize(
                                                context, 9),
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Punctual and precise',
                                          style: TextStyle(
                                            fontSize: getResponsiveFontSize(
                                                context, 8),
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
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
                                      totalRepeatCount: 2,
                                      text: const ['MultiTechs Solutions'],
                                      textStyle: TextStyle(
                                          fontSize: getResponsiveFontSize(
                                              context, 20),
                                          color: Colors.pink,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'Poppins'),
                                      speed: const Duration(milliseconds: 200),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: AnimatedOpacity(
                            duration: const Duration(seconds: 1),
                            opacity: _isVisible ? 1.0 : 0.0,
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: Text(
                                'MultiTechs Solutions is a forward-thinking IT agency that stands at the\nforefront of technological innovation, dedicated to delivering bespoke\nsolutions that cater to the unique challenges of today’s businesses.Our\ndiverse team of skilled professionals brings together a wealth of experi\nence and expertise, ensuring that we provide high-quality services acr\noss various domains, including web development, iOS and Android app\nlication development, eCommerce website design, and robust web apps.',
                                style: TextStyle(
                                    fontSize: getResponsiveFontSize(context, 9),
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.05),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              children: [
                                Container(
                                  width: getResponsiveWidth(context, 0.8),
                                  height: getResponsiveHeight(context) * 4,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.pink.shade200,
                                        Colors.pink
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 15,
                                        spreadRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.verified,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Experienced Team',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Expert-driven excellence',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  width: getResponsiveWidth(context, 0.8),
                                  height: getResponsiveHeight(context) *
                                      4, // Adjusted for height
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple.shade100,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 15,
                                        spreadRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.people_outline_rounded,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Client Centric Approach',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Your needs, our focus',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  width: getResponsiveWidth(context, 0.8),
                                  height: getResponsiveHeight(context) *
                                      4, // Adjusted for height
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue.shade300,
                                        Colors.blue
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 15,
                                        spreadRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.laptop_chromebook_rounded,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Cutting Edge Technologies',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Innovating with the latest.',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Container(
                                  width: getResponsiveWidth(context, 0.8),
                                  height: getResponsiveHeight(context) * 4,
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 15,
                                        spreadRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.access_time_filled_rounded,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Timely Delivery',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Punctual and precise',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
        ])));
  }
}
