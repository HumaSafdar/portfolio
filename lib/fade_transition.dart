import 'package:flutter/widgets.dart';

void navigateWithFadeFromBack(BuildContext context, Widget destination) {
  Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destination,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Create a fade animation that starts with 0 (fully transparent) and ends with 1 (fully opaque)
      var fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeIn,
        ),
      );

      // The child is wrapped with FadeTransition
      return FadeTransition(
        opacity: fadeAnimation,
        child: child,
      );
    },
    transitionDuration:
        Duration(milliseconds: 500), // Adjust duration as needed
  ));
}
