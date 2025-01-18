import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_company/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_company/appbar.dart';

class ContactDetailsScreen extends StatefulWidget {
  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen>
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

    // Trigger animations with a delay
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
    return MediaQuery.of(context).size.height * 0.5;
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
    double height = size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 600;
    return Scaffold(
      appBar: const Appbar(),
      body: Center(
        child: Stack(
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
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/pic1.jpeg'),
                      ),
                      const SizedBox(height: 20),
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
                                text: const ['Get in Touch'],
                                textStyle: const TextStyle(
                                    fontSize: 32.0,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Poppins'),
                                speed: const Duration(milliseconds: 200),
                              ),
                            ),
                          ),
                        ),
                      ),
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
                                text: const [
                                  'A sleek, minimalist design with intuitive navigation, offering seamless access\nto communication channels for support, inquiries, and feedback.',
                                ],
                                textAlign: TextAlign.center,
                                textStyle: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Poppins'),
                                speed: const Duration(milliseconds: 200),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ContactCard(
                            icon: FontAwesomeIcons.envelope,
                            label: 'Email',
                            value: 'anees.ahmad@multitechs\nsolutions.com',
                          ),
                          ContactCard(
                            icon: FontAwesomeIcons.phone,
                            label: 'Phone No',
                            value: 'tel:+923120102100',
                          ),
                          ContactCard(
                            icon: FontAwesomeIcons.linkedin,
                            label: 'LinkedIn',
                            value:
                                'https://www.linkedin.com/\ncompany/multitechs-solutions/',
                          ),
                          ContactCard(
                            icon: FontAwesomeIcons.github,
                            label: 'Github',
                            value: 'https://github.com/mu-shafiq',
                          ),
                          ContactCard(
                            icon: FontAwesomeIcons.webflow,
                            label: 'Website',
                            value: 'https://www.multitechs\nsolutions.com',
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/pic1.jpeg'),
                      ),
                      const SizedBox(height: 20),
                      CustomText(
                          title: 'Get in Touch',
                          size: getResponsiveFontSize(context, 10),
                          color: Colors.pink,
                          weight: FontWeight.w900,
                          fontFamily: 'Poppins'),
                      CustomText(
                          title:
                              'A sleek, minimalist design with intuitive navigation, offering seamless access\nto communication channels for support, inquiries, and feedback.',
                          textAlign: TextAlign.center,
                          size: getResponsiveFontSize(context, 8),
                          color: Colors.black,
                          weight: FontWeight.w900,
                          fontFamily: 'Poppins'),
                      const SizedBox(height: 30),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ContactCard(
                            icon: FontAwesomeIcons.webflow,
                            label: 'Website',
                            value: 'https://www.multitechssolutions.com',
                          ),
                          ContactCard(
                            icon: FontAwesomeIcons.phone,
                            label: 'Phone No',
                            value: 'tel:+923120102100',
                          ),
                          ContactCard(
                            icon: FontAwesomeIcons.github,
                            label: 'Github',
                            value: 'https://github.com/mu-shafiq',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Row(
                        children: [
                          ContactCard(
                            icon: FontAwesomeIcons.linkedin,
                            label: 'LinkedIn',
                            value:
                                'https://www.linkedin.com/\ncompany/multitechs-solutions/',
                          ),
                          ContactCard(
                            icon: FontAwesomeIcons.webflow,
                            label: 'Website',
                            value: 'https://www.multitechs\nsolutions.com',
                          ),
                          ContactCard(
                            icon: FontAwesomeIcons.envelope,
                            label: 'Email',
                            value: 'anees.ahmad@multitechs\nsolutions.com',
                          ),
                        ],
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ContactCard(
      {required this.icon, required this.label, required this.value});

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  double getResponsiveHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.5;
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getResponsiveFontSize(context, 10),
              fontFamily: 'Poppins',
              color: Colors.pink,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () => _launchURL(value),
            child: Text(
              value,
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, 8),
                fontFamily: 'Poppins',
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
