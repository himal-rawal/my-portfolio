import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myportfolio/achievemet_page.dart';
import 'package:myportfolio/bio.dart';
import 'package:myportfolio/clock_viewmodel.dart';
import 'package:myportfolio/colors.dart';
import 'package:myportfolio/education_page.dart';
import 'package:myportfolio/enum.dart';
import 'package:myportfolio/experience.dart';
import 'package:myportfolio/mobile_view.dart';
import 'package:myportfolio/portfolio_viewmodel.dart';
import 'package:myportfolio/skills_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
      title: "Himal's Portfolio",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: MediaQuery.of(context).size.width <= 500
          ? const MobileBrowserView()
          : const MyPortfolio(),
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
                  child: Image.network(
                    'https://i.ibb.co/0QpZRs0/ios.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // Container positioned at the center of the image
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.40, // 50% width of the parent (image)
                    heightFactor: 0.84, // 50% height of the parent (image)
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
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
            _categoryItem(context, icon: Icons.facebook_rounded,
                onTap: () async {
              final Uri url =
                  Uri.parse("https://www.facebook.com/himal.rawal.969/");
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
                iconUrl:
                    "https://cdn2.iconfinder.com/data/icons/social-media-2285/512/1_Facebook_colored_svg_copy-1024.png",
                socialMedia: true,
                socialMediaColor: Colors.blue,
                title: "Facebook"),
            _categoryItem(context,
                iconUrl:
                    "https://cdn1.iconfinder.com/data/icons/logotypes/32/circle-linkedin-1024.png",
                onTap: () async {
              final Uri url =
                  Uri.parse("https://www.linkedin.com/in/himal-rawal/");
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
                socialMedia: true,
                socialMediaColor: Colors.blue,
                title: "Linkedin"),
            _categoryItem(context,
                iconUrl:
                    "https://cdn3.iconfinder.com/data/icons/2018-social-media-logotypes/1000/2018_social_media_popular_app_logo_instagram-1024.png",
                onTap: () async {
              final Uri url =
                  Uri.parse("https://www.instagram.com/himalrawal07/");
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
                socialMedia: true,
                socialMediaColor: Colors.blue,
                title: "Instagram"),
            _categoryItem(context,
                iconUrl:
                    "https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-social-github-1024.png",
                onTap: () async {
              final Uri url = Uri.parse("https://github.com/himal-rawal");
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
                socialMedia: true,
                socialMediaColor: Colors.white,
                title: "Github"),

            _categoryItem(context,
                lottieUrl:
                    "https://lottie.host/b51acb5e-be5b-49a8-a2d6-45b9b1d4a911/XfWGbGRmkp.json",
                onTap: () async {
              final Uri url =
                  Uri(scheme: "mailto", path: "himalrawal07@gmail.com");
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
                socialMedia: true,
                socialMediaColor: Colors.white,
                title: "Contact me"),

            _categoryItem(context,
                lottieUrl:
                    "https://lottie.host/c25d8252-e672-4851-8807-ad26375142fa/KwbWhH5wDZ.json",
                onTap: () async {
              final Uri url = Uri.parse(
                  "https://drive.google.com/uc?export=download&id=1PdZEG4-ipayU1zxF6fLh3l3dLLo563z8");
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
                socialMedia: true,
                socialMediaColor: Colors.white,
                title: "Download Resume")
            // Add more icons as needed
          ],
        );
      },
    );
  }

  GestureDetector _categoryItem(BuildContext context,
      {void Function()? onTap,
      IconData? icon,
      String? title,
      bool socialMedia = false,
      Color? socialMediaColor,
      String iconUrl = '',
      String lottieUrl = ''}) {
    return socialMedia
        ? GestureDetector(
            onTap: onTap,
            child: SizedBox(
              height: 100,
              width: 100,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: socialMediaColor,
                    child: lottieUrl.isNotEmpty
                        ? Lottie.network(lottieUrl)
                        : iconUrl.isNotEmpty
                            ? Image.network(iconUrl)
                            : Icon(
                                size: 30,
                                icon,
                                // Icons.person,
                                color: Colors.white,
                              ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      // "About Me",
                      title ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        : GestureDetector(
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
