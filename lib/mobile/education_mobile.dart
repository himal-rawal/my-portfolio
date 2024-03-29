import 'package:flutter/material.dart';
import 'package:myportfolio/enum.dart';
import 'package:myportfolio/portfolio_viewmodel.dart';
import 'package:myportfolio/responsivewidgets/responsive_text.dart';
import 'package:provider/provider.dart';

class EducationPageMobile extends StatelessWidget {
  const EducationPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(8),
      //color: Colors.amber,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 20),
                const Text(
                  "My Education",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
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
              Icons.school,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 40, width: 2, color: Colors.cyan),
                const SizedBox(width: 20),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveText(
                      text:
                          "Bachelor Of Technology \nComputer Science Engineering (CSE)",
                      maxFontSize: 16,
                      minFontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      giveHeightWidth: true,
                      maxWidth: MediaQuery.of(context).size.width * 0.31,
                      // style: TextStyle(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.w700,
                      //     fontSize: 16),
                    ),
                    const Text(
                      "Uttarakhand Tecchnical University",
                      style: TextStyle(fontSize: 14, color: Colors.cyan),

                      //style: TextStyle(color: Colors.cyan),
                    ),
                    const Text(
                      "2017 - 2021 | Deheradun, India",
                      // maxFontSize: 8,
                      // minFontSize: 6,
                      // giveHeightWidth: true,
                      // color: Colors.white,
                      // maxWidth: MediaQuery.of(context).size.width * 0.31,
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 40, width: 2, color: Colors.green),
                const SizedBox(width: 20),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveText(
                      text: "Intermediate Schooling \nMajor:Science",
                      maxFontSize: 16,
                      minFontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      giveHeightWidth: true,
                      maxWidth: MediaQuery.of(context).size.width * 0.31,
                      // style: TextStyle(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.w700,
                      //     fontSize: 16),
                    ),
                    const Text(
                      "Radiant Higher Secondary School",
                      // maxFontSize: 14,
                      // minFontSize: 10,
                      // giveHeightWidth: true,
                      // color: Colors.green,
                      // maxWidth: MediaQuery.of(context).size.width * 0.31,
                      style: TextStyle(color: Colors.green, fontSize: 14),
                    ),
                    Text(
                      "2015 - 2017 | Kanchanpur, Nepal",
                      // maxFontSize: 8,
                      // minFontSize: 6,
                      // giveHeightWidth: true,
                      // color: Colors.grey.shade400,
                      // maxWidth: MediaQuery.of(context).size.width * 0.31,
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 40, width: 2, color: Colors.purple),
                const SizedBox(width: 20),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveText(
                      text: "School Leaving Certificate \n(SLC)",
                      maxFontSize: 16,
                      minFontSize: 12,
                      fontWeight: FontWeight.w700,
                      giveHeightWidth: true,
                      color: Colors.white,
                      maxWidth: MediaQuery.of(context).size.width * 0.31,
                      // style: TextStyle(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.w700,
                      //     fontSize: 16),
                    ),
                    const Text(
                      "Shree New Saraswati Vidya Mandir Airy",
                      // maxFontSize: 14,
                      // minFontSize: 10,
                      // giveHeightWidth: true,
                      // color: Colors.purple,
                      // maxWidth: MediaQuery.of(context).size.width * 0.31,
                      style: TextStyle(color: Colors.purple, fontSize: 14),
                    ),
                    Text(
                      "2003 - 2015 | Kanchanpur, Nepal",
                      // maxFontSize: 8,
                      // minFontSize: 6,
                      // giveHeightWidth: true,
                      // color: Colors.grey.shade400,
                      // maxWidth: MediaQuery.of(context).size.width * 0.31,
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 10),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
