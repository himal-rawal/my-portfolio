import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myportfolio/bio.dart';
import 'package:myportfolio/colors.dart';
import 'package:myportfolio/enum.dart';
import 'package:myportfolio/mobile/acchievment_mobile.dart';
import 'package:myportfolio/mobile/education_mobile.dart';
import 'package:myportfolio/mobile/experience_mobile.dart';
import 'package:myportfolio/portfolio_viewmodel.dart';
import 'package:myportfolio/skills_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileBrowserView extends StatelessWidget {
  const MobileBrowserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252526),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Colors.white,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  "tenor1.gif",
                  fit: BoxFit.contain,
                  colorBlendMode: BlendMode.saturation,
                ),
              ),
            ),
            Center(
                child: SizedBox(
              child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                TypewriterAnimatedText("You took forever to reach me ",
                    textStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                    speed: const Duration(milliseconds: 300))
              ]),
            )),
            _drawerListItem(title: "About Me"),
            Align(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 150,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.greenAccent.shade100,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: const Center(
                      child: Text(
                    "Hire Me",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: context.watch<PortfolioViewmodel>().showPage ==
              PortfolioViewEnum.homePage
          ? AppBar(
              title: const Text("Himal's Portfolio"),
              centerTitle: true,
              leading: Builder(builder: (context) {
                return IconButton(
                    icon: const Icon(Icons.dashboard),
                    onPressed: () => Scaffold.of(context).openDrawer());
              }),
              backgroundColor: const Color(0xff252526),
              elevation: 4,
              shadowColor: Colors.grey.shade100,
            )
          : null,
      // appBar: AppBar(

      //   title: const Text(
      //     "My Bio",
      //     style: TextStyle(fontWeight: FontWeight.w700),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: showPage(context, context.watch<PortfolioViewmodel>().showPage),
      ),
    );
  }

  Align _drawerListItem({void Function()? onTap, String? title}) {
    return Align(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.greenAccent.shade100,
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
            ],
          ),
          child: Column(
            children: [
              Text(
                // "About Me",
                title ?? "",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
              const SizedBox(height: 8),
              const Text(
                "       My name is Himal Rawal.          ",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              AnimatedTextKit(repeatForever: true, animatedTexts: [
                TypewriterAnimatedText("Learner",
                    cursor: " |",
                    textStyle: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w700),
                    speed: const Duration(milliseconds: 300)),
                TypewriterAnimatedText("Software Developer",
                    cursor: " |",
                    textStyle: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w700),
                    speed: const Duration(milliseconds: 300)),
                TypewriterAnimatedText("Cyber Security Enthusiast",
                    cursor: " |",
                    textStyle: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w700),
                    speed: const Duration(milliseconds: 300))
              ]),
            ],
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
        return const ExperiencePageMobile();

      case PortfolioViewEnum.educationPage:
        return const EducationPageMobile();
      case PortfolioViewEnum.skillPage:
        return const SkillsPage();
      case PortfolioViewEnum.achievementPage:
        return const AchievemetPageMobile();

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

  // showAppBar(PortfolioViewEnum viewPage) {
  //   switch (viewPage) {
  //     case PortfolioViewEnum.bioDataPage:
  //       return "About Me";
  //     case PortfolioViewEnum.homePage:
  //       return "Himal's Bio";

  //     case PortfolioViewEnum.experiencePage:
  //       return "My Experience";

  //     case PortfolioViewEnum.educationPage:
  //       return "My Education";
  //     case PortfolioViewEnum.skillPage:
  //       return "My Skills";
  //     case PortfolioViewEnum.achievementPage:
  //       return "My Achievments";

  //     default:
  //       print('choose a different number!');
  //       return const Text("data");
  //   }
}
