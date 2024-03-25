import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:myportfolio/achievemet_page.dart';
import 'package:myportfolio/bio.dart';
import 'package:myportfolio/colors.dart';
import 'package:myportfolio/education_page.dart';
import 'package:myportfolio/enum.dart';
import 'package:myportfolio/experience.dart';
import 'package:myportfolio/portfolio_viewmodel.dart';
import 'package:myportfolio/skills_page.dart';
import 'package:provider/provider.dart';

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
                    speed: const Duration(milliseconds: 300))
              ]),
            )),
            ListTile(
              tileColor: Colors.brown,
              title: const Text('About Me'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: context.watch<PortfolioViewmodel>().showPage ==
              PortfolioViewEnum.homePage
          ? AppBar(
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
