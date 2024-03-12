import 'package:flutter/material.dart';
import 'package:myportfolio/enum.dart';
import 'package:myportfolio/portfolio_viewmodel.dart';
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
                const Text(
                  "My Experience",
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
                    const Text(
                      "Junior Flutter Developer",
                      maxLines: 3,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    const Text(
                      "Vanillatech Pvt Ltd",
                      style: TextStyle(color: Colors.cyan),
                    ),
                    const Text(
                      '''06/07/2023 - current | Kathmanddu, Nepal''',
                      maxLines: 3,
                      softWrap: false,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    context.watch<PortfolioViewmodel>().hideExperienceDetail
                        ? const SizedBox.shrink()
                        : const Text(
                            "- Done CI/CD \n - worked i multiple project",
                            style: TextStyle(color: Colors.white),
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
