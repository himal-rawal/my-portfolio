import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myportfolio/achievemet_page.dart';
import 'package:myportfolio/bio.dart';
import 'package:myportfolio/clock_viewmodel.dart';
import 'package:myportfolio/colors.dart';
import 'package:myportfolio/education_page.dart';
import 'package:myportfolio/enum.dart';
import 'package:myportfolio/experience.dart';
import 'package:myportfolio/portfolio_viewmodel.dart';
import 'package:myportfolio/skills_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<PortfolioViewmodel>(
        create: (_) => PortfolioViewmodel()),
    ChangeNotifierProvider<ClockViewmodel>(create: (_) => ClockViewmodel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("1");
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const MyPortfolio(),
    );
  }
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff252526),
        body: Center(
          child: AspectRatio(
            aspectRatio: 1.0, // Maintain aspect ratio of 1:1
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Image widget
                FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(
                    '/ios.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // Container positioned at the center of the image
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.40, // 50% width of the parent (image)
                    heightFactor: 0.84, // 50% height of the parent (image)
                    child: Container(
                      //color: Colors.blue.withOpacity(0.5),
                      child: showPage(context,
                          context.watch<PortfolioViewmodel>().showPage),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showPage(BuildContext context, PortfolioViewEnum viewPage) {
    switch (viewPage) {
      case PortfolioViewEnum.bioDataPage:
        return const BioPage();
      case PortfolioViewEnum.homePage:
        return _buildHomePgae(context);

      case PortfolioViewEnum.experiencePage:
        return const ExperiencePage();

      case PortfolioViewEnum.educationPage:
        return const EducationPage();
      case PortfolioViewEnum.skillPage:
        return const SkillsPage();
      case PortfolioViewEnum.achievementPage:
        return const AchievemetPage();

      default:
        print('choose a different number!');
        return const Text("data");
    }
  }

  Widget _buildHomePgae(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the number of columns based on available width
        int crossAxisCount = (constraints.maxWidth / 100).floor();
        if (crossAxisCount < 2) {
          crossAxisCount = 2; // Minimum 2 columns
        }
        return GridView.count(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
          children: [
            _categoryItem(context,
                icon: Icons.person,
                title: "About Me",
                onTap: () => context
                    .read<PortfolioViewmodel>()
                    .setPortfolioPage(PortfolioViewEnum.bioDataPage)),
            _categoryItem(
              context,
              icon: Icons.business_center,
              title: "Experience",
              onTap: () => context
                  .read<PortfolioViewmodel>()
                  .setPortfolioPage(PortfolioViewEnum.experiencePage),
            ),
            _categoryItem(
              context,
              icon: Icons.view_list_rounded,
              title: "Skills",
              onTap: () => context
                  .read<PortfolioViewmodel>()
                  .setPortfolioPage(PortfolioViewEnum.skillPage),
            ),
            _categoryItem(
              context,
              icon: Icons.workspace_premium_outlined,
              title: "Achievment",
              onTap: () => context
                  .read<PortfolioViewmodel>()
                  .setPortfolioPage(PortfolioViewEnum.achievementPage),
            ),
            _categoryItem(
              context,
              icon: Icons.school,
              title: "Education",
              onTap: () => context
                  .read<PortfolioViewmodel>()
                  .setPortfolioPage(PortfolioViewEnum.educationPage),
            ),
            // Add more icons as needed
          ],
        );
      },
    );
  }

  GestureDetector _categoryItem(BuildContext context,
      {void Function()? onTap, IconData? icon, String? title}) {
    return GestureDetector(
      onTap: onTap,
      // () {
      //   context
      //       .read<PortfolioViewmodel>()
      //       .setPortfolioPage(PortfolioViewEnum.bioDataPage);
      // },
      child: SizedBox(
        height: 100,
        width: 100,
        child: Column(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: colorsList[Random().nextInt(6)],
              child: Icon(
                size: 30,
                icon,
                // Icons.person,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              // "About Me",
              title ?? "",
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
