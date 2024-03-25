import 'package:flutter/material.dart';
import 'package:myportfolio/enum.dart';
import 'package:myportfolio/portfolio_viewmodel.dart';
import 'package:myportfolio/responsivewidgets/responsive_text.dart';
import 'package:provider/provider.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 20),
                const ResponsiveText(
                  maxFontSize: 18,
                  minFontSize: 14,

                  color: Colors.white,

                  text: "My Experience",
                  //style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                GestureDetector(
                  onTap: () {
                    context
                        .read<PortfolioViewmodel>()
                        .setPortfolioPage(PortfolioViewEnum.homePage);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Icon(
              Icons.business_center,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            Container(
                height: 1, width: double.infinity, color: Colors.grey[50]),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 40, width: 2, color: Colors.cyan),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveText(
                      text: "Junior Flutter Developer",
                      maxFontSize: 16,
                      minFontSize: 12,
                      giveHeightWidth: true,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      maxWidth: MediaQuery.of(context).size.width * 0.31,

                      // style: TextStyle(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.w700,
                      //     fontSize: 16),
                    ),
                    ResponsiveText(
                      text: "Vanillatech Pvt Ltd",
                      maxFontSize: 14,
                      minFontSize: 10,
                      giveHeightWidth: true,
                      color: Colors.cyan,
                      maxWidth: MediaQuery.of(context).size.width * 0.31,
                      // style: TextStyle(color: Colors.cyan),
                    ),
                    ResponsiveText(
                      text: '''06/07/2023 - current | Kathmanddu, Nepal''',
                      maxFontSize: 10,
                      minFontSize: 6,
                      giveHeightWidth: true,
                      color: Colors.grey,
                      maxWidth: MediaQuery.of(context).size.width * 0.31,
                      //style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    context.watch<PortfolioViewmodel>().hideExperienceDetail
                        ? const SizedBox.shrink()
                        : ResponsiveText(
                            text:
                                "- Done CI/CD \n - worked in multiple project",
                            maxFontSize: 16,
                            minFontSize: 8,
                            giveHeightWidth: true,
                            color: Colors.white,
                            maxWidth: MediaQuery.of(context).size.width * 0.31,
                            // style: TextStyle(color: Colors.white),
                          ),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      context
                          .read<PortfolioViewmodel>()
                          .setExperienceDetailVisibility();
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
