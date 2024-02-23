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
    print("1");
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(color: Color(0xff252526)),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   margin: const EdgeInsets.all(20),
          //   height: double.maxFinite,
          //   //color: Colors.lightGreen,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       children: [
          //         Container(
          //             padding: const EdgeInsets.all(8),
          //             decoration: BoxDecoration(
          //                 color: Colors.white10,
          //                 borderRadius: BorderRadius.circular(20)
          //                 //backgroundBlendMode: BlendMode.lighten,
          //                 ),
          //             height: MediaQuery.of(context).size.height * 0.3,
          //             width: MediaQuery.of(context).size.width * 0.2,
          //             child: Column(
          //               children: [
          //                 const CircleAvatar(
          //                   radius: 30,
          //                   backgroundImage: AssetImage("/him.jpeg"),
          //                 ),
          //                 const SizedBox(height: 10),
          //                 AnimatedTextKit(
          //                   //pause: const Duration(seconds: 5),
          //                   repeatForever: true,
          //                   animatedTexts: [
          //                     TypewriterAnimatedText(
          //                         speed: const Duration(milliseconds: 500),
          //                         "Hello, it's me Himal Rawal",
          //                         textStyle: const TextStyle(
          //                           // fontFamily: 'Canterbury',
          //                           color: Colors.black,
          //                         )),
          //                   ],
          //                 ),
          //               ],
          //             )),
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.30,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    SizedBox(
                        height: constraints.maxHeight,
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: FittedBox(
                            fit: BoxFit.cover, child: Image.asset("/ios.png"))),
                    Positioned(
                        //height: MediaQuery.of(context).size.height * 0.84,
                        // width: MediaQuery.of(context).size.width * 0.21,
                        bottom: constraints.maxHeight * 0.09,
                        top: constraints.maxHeight * 0.09,
                        right: constraints.maxWidth * 0.12,
                        left: constraints.maxWidth * 0.12,
                        child: showPage(context,
                            context.watch<PortfolioViewmodel>().showPage))
                  ],
                );
              },
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.all(20),
          //   height: double.maxFinite,
          //   //color: Colors.greenAccent,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         const Clock(),
          //         //const SizedBox(height: 20),
          //         Text(DateFormat('EEEE, MMM d, yyyy').format(DateTime.now()),
          //             style: const TextStyle(
          //                 color: Colors.white, fontWeight: FontWeight.w700)),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    ));
  }

  Container _buildHomePgae(BuildContext context) {
    return Container(
      //color: Colors.amber,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              const SizedBox(
                height: 100,
                width: 100,
              )
            ],
          ),
        ],
      ),
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
}
