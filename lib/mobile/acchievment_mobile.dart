import 'package:flutter/material.dart';
import 'package:myportfolio/enum.dart';
import 'package:myportfolio/portfolio_viewmodel.dart';
import 'package:provider/provider.dart';

class AchievemetPageMobile extends StatelessWidget {
  const AchievemetPageMobile({super.key});

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
                  "My Achievments",
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
              Icons.workspace_premium_outlined,
              size: 80,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            _achievmentContainer(context,
                imgUrl:
                    "https://pbs.twimg.com/profile_images/1511784317336399881/PMWMmbSS_400x400.jpg",
                subTitle: "Received Thanks From more than 3 Hackerone program",
                index: 0,
                title: "Received Thanks"),
            const SizedBox(height: 20),
            _achievmentContainer(context,
                imgUrl:
                    "https://images.datacamp.com/image/upload/f_auto,q_auto:best/v1603223608/DC_New_mugdv8.png",
                title: "Data Engineerig Certification",
                index: 1,
                subTitle:
                    "Completed  Certification for Data Engineering in python from Datacamp"),
            const SizedBox(height: 20),
            _achievmentContainer(context,
                imgUrl:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/800px-Python-logo-notext.svg.png",
                title: "Python Training",
                index: 2,
                subTitle: "Completed Python course RCPL"),
          ],
        ),
      ),
    );
  }

  SizedBox _achievmentContainer(BuildContext context,
      {required String imgUrl,
      required String title,
      required String subTitle,
      required int index}) {
    return SizedBox(
      //padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 20, backgroundImage: NetworkImage(imgUrl)),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.50),
                    child: Text(
                      title,
                      maxLines: 3,
                      softWrap: true,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  context.watch<PortfolioViewmodel>().subtitleVisibility[index]
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.50,
                            child: Text(
                              subTitle,
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 12),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () => context
                .read<PortfolioViewmodel>()
                .setAchievementDetailVisibility(index),
            child: Icon(
              context.watch<PortfolioViewmodel>().subtitleVisibility[index]
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
