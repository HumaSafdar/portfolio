import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_company/appbar.dart';
import 'package:portfolio_company/custom_text.dart';

class ProjectsScreen extends StatefulWidget {
  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _nextPage() {
    if (_currentIndex < 3) {
      // Updated boundary condition
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
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: width * 0.4,
              height: height * 0.6,
              transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1),
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
                      textStyle: const TextStyle(
                        fontSize: 32.0,
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
                  size: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  weight: FontWeight.w900,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
