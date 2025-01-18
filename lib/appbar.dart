import 'package:flutter/material.dart';
import 'package:portfolio_company/about.dart';
import 'package:portfolio_company/contact-us.dart';
import 'package:portfolio_company/custom_text.dart';
import 'package:portfolio_company/fade_transition.dart';
import 'package:portfolio_company/home_screen.dart';
import 'package:portfolio_company/index_provide.dart';
import 'package:portfolio_company/projects.dart';
import 'package:portfolio_company/services.dart';
import 'package:provider/provider.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  const Appbar({super.key});
  @override
  State<Appbar> createState() => _AppbarState();
  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

class _AppbarState extends State<Appbar> {
  bool _isHoveredHome = false;

  bool _isHoveredAbout = false;

  bool _isHoveredSkills = false;

  bool _isHoveredProjects = false;

  late AnimationController _controller;
  bool _isHovering = false;
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double getResponsiveHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.08;
  }

  double getResponsiveHeightbtn(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.05;
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
    final selectedIndexProvider = Provider.of<SelectedIndexProvider>(context);
    var size = MediaQuery.of(context).size;
    double width = size.width;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 600;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 1.5,
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: !isSmallScreen
                ? AppBar(
                    elevation: 2,
                    backgroundColor: Colors.black,
                    title: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: getResponsiveHeightImage(context),
                            width: getResponsiveWidth(context, 0.2),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/logo.jpeg',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      _buildNavButton(
                        context: context,
                        label: 'Home',
                        isHovered: _isHoveredHome,
                        onTap: () {
                          selectedIndexProvider.setSelectedIndex(0);
                          navigateWithFadeFromBack(context, HomeScreen());
                        },
                        onHover: (isHovering) => _onHover(isHovering, 'Home'),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      _buildNavButton(
                        context: context,
                        label: 'About',
                        isHovered: _isHoveredAbout,
                        onTap: () {
                          selectedIndexProvider.setSelectedIndex(1);
                          navigateWithFadeFromBack(context, AboutSection());
                        },
                        onHover: (isHovering) => _onHover(isHovering, 'About'),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      _buildNavButton(
                        context: context,
                        label: 'Services',
                        isHovered: _isHoveredSkills,
                        onTap: () {
                          selectedIndexProvider.setSelectedIndex(2);
                          navigateWithFadeFromBack(context, SkillsScreen());
                        },
                        onHover: (isHovering) => _onHover(isHovering, 'Skills'),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      _buildNavButton(
                        context: context,
                        label: 'Projects',
                        isHovered: _isHoveredProjects,
                        onTap: () {
                          selectedIndexProvider.setSelectedIndex(3);
                          navigateWithFadeFromBack(context, ProjectsScreen());
                        },
                        onHover: (isHovering) =>
                            _onHover(isHovering, 'Projects'),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            selectedIndexProvider.setSelectedIndex(4);
                            navigateWithFadeFromBack(
                                context, ContactDetailsScreen());
                          },
                          child: MouseRegion(
                            onEnter: (_) => setState(() => _isHovering = true),
                            onExit: (_) => setState(() => _isHovering = false),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              transform: Matrix4.identity()
                                ..scale(_isHovering ? 1.1 : 1.0),
                              height: getResponsiveHeight(context),
                              width: getResponsiveWidth(context, 0.1),
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Center(
                                child: CustomText(
                                  title: 'Contact Me',
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  size: getResponsiveFontSize(context, 8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : AppBar(
                    automaticallyImplyLeading: false,
                    elevation: 2,
                    backgroundColor: Colors.black,
                    title: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: getResponsiveHeightImage(context),
                            width: getResponsiveWidth(context, 0.2),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/logo.jpeg',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      _buildNavButton(
                        context: context,
                        label: 'Home',
                        isHovered: _isHoveredHome,
                        onTap: () {
                          selectedIndexProvider.setSelectedIndex(0);
                          navigateWithFadeFromBack(context, const HomeScreen());
                        },
                        onHover: (isHovering) => _onHover(isHovering, 'Home'),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      _buildNavButton(
                        context: context,
                        label: 'About',
                        isHovered: _isHoveredAbout,
                        onTap: () {
                          selectedIndexProvider.setSelectedIndex(1);
                          navigateWithFadeFromBack(context, AboutSection());
                        },
                        onHover: (isHovering) => _onHover(isHovering, 'About'),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      _buildNavButton(
                        context: context,
                        label: 'Services',
                        isHovered: _isHoveredSkills,
                        onTap: () {
                          selectedIndexProvider.setSelectedIndex(2);
                          navigateWithFadeFromBack(context, SkillsScreen());
                        },
                        onHover: (isHovering) => _onHover(isHovering, 'Skills'),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      _buildNavButton(
                        context: context,
                        label: 'Projects',
                        isHovered: _isHoveredProjects,
                        onTap: () {
                          selectedIndexProvider.setSelectedIndex(3);
                          navigateWithFadeFromBack(context, ProjectsScreen());
                        },
                        onHover: (isHovering) =>
                            _onHover(isHovering, 'Projects'),
                      ),
                      SizedBox(
                        width: width * 0.07,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            selectedIndexProvider.setSelectedIndex(4);
                            navigateWithFadeFromBack(
                                context, ContactDetailsScreen());
                          },
                          child: MouseRegion(
                            onEnter: (_) => setState(() => _isHovering = true),
                            onExit: (_) => setState(() => _isHovering = false),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              transform: Matrix4.identity()
                                ..scale(_isHovering ? 1.1 : 1.0),
                              height: getResponsiveHeightbtn(context),
                              width: getResponsiveWidth(context, 0.18),
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Center(
                                child: CustomText(
                                  title: 'Contact Me',
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  size: getResponsiveFontSize(context, 8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
      ),
    );
  }

  Widget _buildNavButton({
    required BuildContext context,
    required String label,
    required bool isHovered,
    required Function() onTap,
    required Function(bool) onHover,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        onEnter: (_) => onHover(true),
        onExit: (_) => onHover(false),
        child: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: AnimatedScale(
            scale: isHovered ? 1.2 : 1.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: CustomText(
              title: label,
              color: isHovered ? Colors.pink : Colors.white,
              fontFamily: 'Poppins',
              size: getResponsiveFontSize(context, 10),
            ),
          ),
        ),
      ),
    );
  }
}
