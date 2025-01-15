import 'package:flutter/material.dart';
import 'package:portfolio_company/about.dart';
import 'package:portfolio_company/custom_text.dart';
import 'package:portfolio_company/services.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  const Appbar({super.key});
  @override
  State<Appbar> createState() => _AppbarState();
  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

class _AppbarState extends State<Appbar> {
  bool _isHoveredHome = false;
  bool _isClickedHome = false;

  bool _isHoveredAbout = false;
  bool _isClickedAbout = false;

  bool _isHoveredSkills = false;
  bool _isClickedSkills = false;

  bool _isHoveredProjects = false;
  bool _isClickedProjects = false;

  late AnimationController _controller;
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 1.5,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            elevation: 2,
            backgroundColor: Colors.grey.withOpacity(0.3),
            title: Row(
              children: [
                Container(
                  height: height * 0.6,
                  width: width * 0.2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/logo.jpeg',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20),
                  child:
                      Container(width: 0.2, height: 100, color: Colors.black),
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
                      padding: const EdgeInsets.only(top: 13),
                      child: AnimatedScale(
                        scale: _isHoveredHome ? 1.2 : 1.0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        child: CustomText(
                          title: 'Home',
                          color: _isHoveredHome ? Colors.pink : Colors.black,
                          fontFamily: 'Poppins',
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * .022,
              ),
              GestureDetector(
                onTap: () {
                  {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            AboutSection(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                              position: offsetAnimation, child: child);
                        },
                      ),
                    );
                  }
                },
                child: MouseRegion(
                  onEnter: (_) => _onHover(true, 'About'),
                  onExit: (_) => _onHover(false, 'About'),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: AnimatedScale(
                      scale: _isHoveredAbout ? 1.2 : 1.0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: CustomText(
                        title: 'About',
                        color: _isHoveredAbout ? Colors.pink : Colors.black,
                        fontFamily: 'Poppins',
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * .022,
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SkillsScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                            position: offsetAnimation, child: child);
                      },
                    ),
                  )
                },
                child: MouseRegion(
                  onEnter: (_) => _onHover(true, 'Skills'),
                  onExit: (_) => _onHover(false, 'Skills'),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: AnimatedScale(
                      scale: _isHoveredSkills ? 1.2 : 1.0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: CustomText(
                        title: 'Services',
                        color: _isHoveredSkills ? Colors.pink : Colors.black,
                        fontFamily: 'Poppins',
                        size: 15,
                      ),
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
                    padding: const EdgeInsets.only(top: 13),
                    child: AnimatedScale(
                      scale: _isHoveredProjects ? 1.2 : 1.0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: CustomText(
                        title: 'Projects',
                        color: _isHoveredProjects ? Colors.pink : Colors.black,
                        fontFamily: 'Poppins',
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * .03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 0.2,
                  height: height * 0.2,
                  color: Colors.black,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    height: height * 0.08,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.pink,
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
    );
  }
}
