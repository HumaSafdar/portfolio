import 'package:flutter/material.dart';
import 'package:portfolio_company/widgets/about.dart';
import 'package:portfolio_company/screens/contact-us.dart';
import 'package:portfolio_company/screens/dashboard.dart';
import 'package:portfolio_company/provider/index_provide.dart';
import 'package:portfolio_company/screens/projects.dart';
import 'package:portfolio_company/provider/routing_provider.dart';
import 'package:portfolio_company/screens/services.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDrawerVisible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    setState(() {
      if (width < 600) {
        isDrawerVisible = true;
      } else {
        isDrawerVisible = false;
      }
    });
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.containerBG,
        // drawer: isDrawerVisible ? null : const CustomDrawer(),
        body: Row(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Consumer<RoutingProvider>(
                  builder: (context, provider, child) {
                    print('objectttttt ${provider.getindex}');
                    if (provider.getindex == 0) {
                      return const Dashboard();
                    } else if (provider.getindex == 1) {
                      return AboutSection();
                    } else if (provider.getindex == 2) {
                      return SkillsScreen();
                    } else if (provider.getindex == 3) {
                      return ProjectsScreen();
                    } else if (provider.getindex == 4) {
                      return ContactDetailsScreen();
                    }
                    return const SizedBox();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
