import 'package:flutter/material.dart';
import 'package:myportfolio/enum.dart';
import 'package:myportfolio/portfolio_viewmodel.dart';
import 'package:myportfolio/responsivewidgets/responsive_text.dart';
import 'package:provider/provider.dart';

class ExperiencePageMobile extends StatelessWidget {
  const ExperiencePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 20),
                const ResponsiveText(
                  maxFontSize: 18,
                  minFontSize: 18,

                  color: Colors.white,

                  text: "My Experience",
                  fontWeight: FontWeight.w700,
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
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
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
                      const Text(
                        "Vanillatech Pvt Ltd",
                        style: TextStyle(color: Colors.cyan, fontSize: 14),

                        // style: TextStyle(color: Colors.cyan),
                      ),
                      const Text(
                        '''06/07/2023 - current | Kathmanddu, Nepal''',
                        style: TextStyle(fontSize: 10, color: Colors.grey),

                        //style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      context.watch<PortfolioViewmodel>().hideExperienceDetail
                          ? const SizedBox.shrink()
                          : const Text(
                              "- worked in multiple project \n- worked with highly proficient team",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                              // maxFontSize: 14,
                              // minFontSize: 12,
                              // giveHeightWidth: true,
                              // color: Colors.white,
                              // maxWidth:
                              //     MediaQuery.of(context).size.width * 0.31,
                              // style: TextStyle(color: Colors.white),
                            ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                    onTap: () {
                      context
                          .read<PortfolioViewmodel>()
                          .setExperienceDetailVisibility();
                    },
                    child:
                        context.read<PortfolioViewmodel>().hideExperienceDetail
                            ? const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.keyboard_arrow_up_rounded,
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
