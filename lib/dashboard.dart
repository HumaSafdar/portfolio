import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_company/custom_text.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  bool _isHoveredHome = false;
  bool _isClickedHome = false;

  bool _isHoveredAbout = false;
  bool _isClickedAbout = false;

  bool _isHoveredSkills = false;
  bool _isClickedSkills = false;

  bool _isHoveredProjects = false;
  bool _isClickedProjects = false;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  void _onHover(bool isHovering, String button) {
    setState(() {
      if (button == 'Home') {
        _isHoveredHome = isHovering;
      } else if (button == 'About') {
        _isHoveredAbout = isHovering;
      } else if (button == 'Skills') {
        _isHoveredSkills = isHovering;
      } else if (button == 'Projects') {
        _isHoveredProjects = isHovering;
      }
    });
  }

  void _onPressed(String button) {
    setState(() {
      _isClickedHome = false;
      _isClickedAbout = false;
      _isClickedSkills = false;
      _isClickedProjects = false;

      if (button == 'Home') {
        _isClickedHome = true;
      } else if (button == 'About') {
        _isClickedAbout = true;
      } else if (button == 'Skills') {
        _isClickedSkills = true;
      } else if (button == 'Projects') {
        _isClickedProjects = true;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1.5,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            elevation: 2,
            backgroundColor: Colors.white,
            title: Row(
              children: [
                const CustomText(
                  title: 'HUMA SAFDAR',
                  color: Colors.pink,
                  fontFamily: 'Poppins',
                  size: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.0, vertical: 20),
                  child: Container(
                    width: 0.2,
                    height: 100,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            actions: [
              GestureDetector(
                onTap: () => _onPressed('Home'),
                child: MouseRegion(
                  onEnter: (_) => _onHover(true, 'Home'),
                  onExit: (_) => _onHover(false, 'Home'),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Column(
                        children: [
                          const CustomText(
                            title: 'Home',
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            size: 15,
                          ),
                          AnimatedContainer(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.pink[500],
                            ),
                            duration: const Duration(milliseconds: 300),
                            height: 7,
                            width: _isHoveredHome || _isClickedHome ? 50 : 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * .022,
              ),
              GestureDetector(
                onTap: () => _onPressed('About'),
                child: MouseRegion(
                  onEnter: (_) => _onHover(true, 'About'),
                  onExit: (_) => _onHover(false, 'About'),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Column(
                      children: [
                        const CustomText(
                          title: 'About',
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          size: 15,
                        ),
                        AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.pink[500],
                          ),
                          duration: const Duration(milliseconds: 300),
                          height: 7,
                          width: _isHoveredAbout || _isClickedAbout ? 50 : 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * .022,
              ),
              GestureDetector(
                onTap: () => _onPressed('Skills'),
                child: MouseRegion(
                  onEnter: (_) => _onHover(true, 'Skills'),
                  onExit: (_) => _onHover(false, 'Skills'),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Column(
                      children: [
                        const CustomText(
                          title: 'Skills',
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          size: 15,
                        ),
                        AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.pink[500],
                          ),
                          duration: const Duration(milliseconds: 300),
                          height: 7,
                          width: _isHoveredSkills || _isClickedSkills ? 50 : 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * .022,
              ),
              GestureDetector(
                onTap: () => _onPressed('Projects'),
                child: MouseRegion(
                  onEnter: (_) => _onHover(true, 'Projects'),
                  onExit: (_) => _onHover(false, 'Projects'),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Column(
                      children: [
                        const CustomText(
                          title: 'Projects',
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          size: 15,
                        ),
                        AnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.pink[500],
                          ),
                          duration: const Duration(milliseconds: 300),
                          height: 7,
                          width:
                              _isHoveredProjects || _isClickedProjects ? 50 : 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 0.2,
                  height: height * 0.2,
                  color: Colors.grey,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    height: height * 0.08,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(7)),
                    child: const Center(
                      child: CustomText(
                        title: 'Contact Me',
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        size: 15,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
      body: Stack(
        // alignment: Alignment.center,
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
                    const CustomText(
                      title: 'Hi ! Huma Safdar',
                      size: 25,
                      weight: FontWeight.w900,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TypewriterAnimatedTextKit(
                      totalRepeatCount: 2,
                      text: const ['Flutter Developer'],
                      textStyle: const TextStyle(
                          fontSize: 32.0,
                          color: Colors.pink,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Poppins'),
                      speed: Duration(milliseconds: 200),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    const CustomText(
                      title:
                          'An enthusiastic software engineer specializing in creating\nFlutter mobile applications and mastering the intricacies\nof Firebase backends. With strong development acumen\nIm dedicated to constant improvement, pursuing growth\nboth as a programmer and an avid learner.',
                      size: 16,
                      weight: FontWeight.w200,
                      color: Colors.black45,
                      fontFamily: 'Poppins',
                    ),
                  ],
                ),
                SizedBox(
                  width: width * 0.2,
                ),
                ClipOval(
                  child: Container(
                    width: width * 0.3,
                    height: height * 0.7,
                    decoration: const BoxDecoration(
                      color: Colors.pink,
                    ),
                    child: Image.asset(
                      'assets/images/pic1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
