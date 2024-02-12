import 'package:flutter/material.dart';
import 'package:myportfolio/enum.dart';
import 'package:myportfolio/portfolio_viewmodel.dart';
import 'package:provider/provider.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  style: TextStyle(color: Colors.white, fontSize: 18),
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
                const Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bachelor Of Technology \nComputer Science Engineering (CSE)",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    Text(
                      "Uttarakhand Tecchnical University",
                      style: TextStyle(color: Colors.cyan),
                    ),
                    Text(
                      "2017 - 2021 | Deheradun, India",
                      style: TextStyle(color: Colors.white),
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
                    const Text(
                      "Intermediate Schooling \nMajor:Science",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    const Text(
                      "Radiant Higher Secondary School",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "2015 - 2017 | Kacchanpur, Nepal",
                      style: TextStyle(color: Colors.grey.shade400),
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
                    const Text(
                      "School Leaving Certificate \n(SLC)",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    const Text(
                      "Shree New Saraswati Vidya Mandir Airy",
                      style: TextStyle(color: Colors.purple),
                    ),
                    Text(
                      "2003 - 2015 | Kanchanpur, Nepal",
                      style: TextStyle(color: Colors.grey.shade400),
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
