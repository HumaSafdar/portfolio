import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_company/widgets/appbar.dart';
import 'package:portfolio_company/widgets/custom_text.dart';

class ProjectsScreen extends StatefulWidget {
  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  late AnimationController _controller;
  void _nextPage() {
    if (_currentIndex < 7) {
      setState(() {
        _currentIndex++;
      });
      _pageController.nextPage(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut);
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _pageController.previousPage(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 40,
                      color: Colors.black,
                    ),
                    onPressed: _previousPage,
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      children: [
                        ProjectCard(
                          projectTitle: 'K-Friends',
                          projectImage: 'assets/images/kfriend.jpeg',
                          projectLink:
                              'K-Friends is an immersive language learning app\nthat connects Korean speakers with a global audience\nthrough interactive games, quizzes, and real-time chat.\nIt offers seamless audio/video calls and social engagement\nfeatures, with subscription plans for non-Korean users to\nunlock call functionality.',
                        ),
                        ProjectCard(
                          projectTitle: 'Brain Master',
                          projectImage: 'assets/images/brainmaster.jpeg',
                          projectLink:
                              'Brain Master is a strategic gaming app where players\ntackle timed missions, progressing through levels while\nmanaging limited lives and earning gems.Players can\nrestore lives using gems, with escalating costs,and enjoy\nenhanced benefits through membership plans.',
                        ),
                        ProjectCard(
                          projectTitle: '3rrend',
                          projectImage: 'assets/images/3rrend.jpeg',
                          projectLink:
                              '3rrend is a social app combining networking and\ne-commerce, offering features like chats, posts, live\nevents,and product listings. It supports real-time audio\n/videocalls and live stories, with a focus on privacy and\na sleek dark theme.',
                        ),
                        ProjectCard(
                          projectTitle: 'Rola Mex',
                          projectImage: 'assets/images/rolamex.jpeg',
                          projectLink:
                              'Rola Mex is a cleaning service app that connects customers\nwith local providers, offering QR-coded bags for secure laundry\nhandling and real-time order tracking via Google Maps. The app\nfeatures seamless online payments, membership plans, and distinct\nprofiles for customers and providers.',
                        ),
                        ProjectCard(
                            projectTitle: 'Hockey Institue',
                            projectImage: 'assets/images/hockey.jpeg',
                            projectLink:
                                'Hockey Institute offers online Skating Coach Certification\nprograms designed to help coaches develop their skills\nand expertise in skating techniques. The comprehensive\ncourses are accessible from anywhere, providing aspiring\nand experienced coaches with the knowledge and tools\nthey need to enhance their coaching abilities and excel\nin the field of skating instruction.'),
                        ProjectCard(
                            projectTitle: 'Modar',
                            projectImage: 'assets/images/luxurytransport.jpeg',
                            projectLink:
                                'Modar provides customizable furniture packages that\ncan be expanded with a wide range of household goods,\nincluding tableware,kitchen supplies, household textiles,\nlighting, and electronics.Committed to customer satisfaction,\nModar aims to save clients time and effort in creating a\nharmonious interior. With a focus on convenience and style,\nModar takes care of all the details so customers can enjoy\na beautifully designed space without the hassle'),
                        ProjectCard(
                            projectTitle: 'Gest Consultant',
                            projectImage: 'assets/images/gest.jpeg',
                            projectLink:
                                'Gest Consultant offers comprehensive services to\nsupport students pursuing Persian language and\ncultural studies in Iran. They provide both short-\nand long-term Persian language courses, as well\nas enriching educational seminars and cultural\ntours. Additional services include airport pick-up\nand drop-off, loan facilities for financial assistance,\nand hostel accommodations. Bright students can\nalsobenefit from post-study visa assistance, with\nthe possibility of obtaining a 5-year Iranian residency\nafter completing their degree'),
                        ProjectCard(
                            projectTitle: 'Luxury Transport',
                            projectImage: 'assets/images/luxurytransport.jpeg',
                            projectLink:
                                'Luxury Transport UK offers premium transportation\nservices for weddings, events, and airport transfers.\nWith a focus on elegance and reliability, clients can\npre-book luxurious vehicles for their special occasions,\nensuring a smooth and stylish experience.Whether it\na wedding, corporate event, or airport transfer, Luxury\nTransport UK guarantees exceptional service and comfort\nfor all travel needs')
                      ],
                    ),
                  ),
                  SizedBox(width: getResponsiveWidth(context, 0.02)),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 40,
                      color: Colors.black,
                    ),
                    onPressed: _nextPage,
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

class ProjectCard extends StatefulWidget {
  final String projectTitle;
  final String projectImage;
  final String projectLink;

  ProjectCard({
    required this.projectTitle,
    required this.projectImage,
    required this.projectLink,
  });

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
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
    return GestureDetector(
        onTap: () {},
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              _isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              _isHovered = false;
            });
          },
          child: !isSmallScreen
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: getResponsiveWidth(context, 0.3),
                      height: getResponsiveHeight(context),
                      transform: Matrix4.identity()
                        ..scale(_isHovered ? 1.05 : 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          widget.projectImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              widget.projectTitle,
                              textStyle: TextStyle(
                                fontSize: getResponsiveFontSize(context, 20),
                                color: Colors.pink,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Poppins',
                              ),
                              speed: const Duration(milliseconds: 200),
                            ),
                          ],
                          totalRepeatCount: 2,
                        ),
                        CustomText(
                          title: widget.projectLink,
                          size: getResponsiveFontSize(context, 10),
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          weight: FontWeight.w900,
                        ),
                      ],
                    ),
                  ],
                )
              : SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Center(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: getResponsiveWidth(context, 0.8),
                              height: getResponsiveHeight(context),
                              transform: Matrix4.identity()
                                ..scale(_isHovered ? 1.05 : 1),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  widget.projectImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                widget.projectTitle,
                                textStyle: TextStyle(
                                  fontSize: getResponsiveFontSize(context, 20),
                                  color: Colors.pink,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Poppins',
                                ),
                                speed: const Duration(milliseconds: 200),
                              ),
                            ],
                            totalRepeatCount: 2,
                          ),
                          CustomText(
                            title: widget.projectLink,
                            size: getResponsiveFontSize(context, 8),
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            weight: FontWeight.w900,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}
