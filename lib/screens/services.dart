import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_company/widgets/appbar.dart';
import 'package:portfolio_company/widgets/custom_text.dart';

class SkillsScreen extends StatefulWidget {
  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  final List<Map<String, String>> services = [
    {
      'name': 'MOBILE APPLICATION DEVELOPMENT',
      'details':
          'We craft intuitive and responsive mobile apps tailored to meet your\nbusiness objectives. From native to cross-platform development,our\nsolutions ensure seamless user experiences and high performance\nacross iOS and Android platforms.  '
    },
    {
      'name': 'WEB DEVELOPMENT',
      'details':
          'Our skilled team delivers high-performing, responsive websites using\ntechnologies like WordPress, ensuring your online presence is\nimpactful and aligns with your business goals.  '
    },
    {
      'name': 'CUSTOM SOFTWARE DEVELOPMENT & CUSTOM SOLUTIONS',
      'details':
          'Our custom software development services are designed to provide\nsolutions that are tailored to the unique needs of your business.We\ndeliver scalable, secure, and efficient software products that\nhelp optimize operations and drive growth.'
    },
    {
      'name': 'UI/UX DESIGN & GRAPHIC DESIGN',
      'details':
          'Our design team excels in creating visually stunning and user-centric\ndesigns that enhance user engagement and brand identity. Whether\nit’s UI/UX for digital platforms or graphic design for marketing\nmaterials, we bring creativity and functionality together. '
    },
    {
      'name': 'E-COMMERECE DEVELOPMENT',
      'details':
          'We develop robust e-commerce solutions on platforms like Shopify,\nMagento, and WooCommerce that help businesses sell online effectively\nand deliver exceptional customer experiences.'
    },
    {
      'name': 'SALESFORCE SOLUTIONS',
      'details':
          'As experts in Salesforce development and integration, we help\norganizations streamline their customer relationship management\nprocesses,improve productivity, and enhance customer interactions.',
    }
  ];

  int _currentIndex = 0;

  void _nextPage() {
    if (_currentIndex < services.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _pageController.nextPage(
          duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _pageController.previousPage(
          duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
    }
  }

  double getResponsiveFontSize(BuildContext context, double baseSize) {
    return MediaQuery.of(context).size.width > 600 ? baseSize * 1.5 : baseSize;
  }

  double getResponsiveHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.05;
  }

  double getResponsiveHeightIcon(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.02;
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
        child: Stack(
          alignment: Alignment.center,
          children: [
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
                ? PageView.builder(
                    controller: _pageController,
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return AnimatedOpacity(
                        opacity: _currentIndex == index ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedSlide(
                          offset: _currentIndex == index
                              ? const Offset(0, 0)
                              : Offset(0, 0.5),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TypewriterAnimatedTextKit(
                                totalRepeatCount: 2,
                                text: [services[index]['name']!],
                                textStyle: TextStyle(
                                  fontSize: getResponsiveFontSize(context, 18),
                                  color: Colors.pink,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Poppins',
                                ),
                                speed: const Duration(milliseconds: 200),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                services[index]['details']!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        getResponsiveFontSize(context, 10),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: 'Poppins',
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : PageView.builder(
                    controller: _pageController,
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return AnimatedOpacity(
                        opacity: _currentIndex == index ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedSlide(
                          offset: _currentIndex == index
                              ? Offset(0, 0)
                              : Offset(0, 0.5),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOut,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TypewriterAnimatedTextKit(
                                totalRepeatCount: 2,
                                text: [services[index]['name']!],
                                textStyle: TextStyle(
                                  fontSize: getResponsiveFontSize(context, 15),
                                  color: Colors.pink,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Poppins',
                                ),
                                speed: const Duration(milliseconds: 200),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                services[index]['details']!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: getResponsiveFontSize(context, 8),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: 'Poppins',
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
            Positioned(
              left: isSmallScreen ? 5 : 16,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: isSmallScreen
                      ? getResponsiveHeightIcon(context)
                      : getResponsiveHeight(context),
                ),
                onPressed: _previousPage,
              ),
            ),
            Positioned(
              right: isSmallScreen ? 5 : 16,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: isSmallScreen
                      ? getResponsiveHeightIcon(context)
                      : getResponsiveHeight(context),
                ),
                onPressed: _nextPage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
