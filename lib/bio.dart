import 'package:flutter/material.dart';
import 'package:myportfolio/enum.dart';
import 'package:myportfolio/portfolio_viewmodel.dart';
import 'package:myportfolio/responsivewidgets/responsive_text.dart';
import 'package:provider/provider.dart';

class BioPage extends StatelessWidget {
  const BioPage({super.key});

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
                const ResponsiveText(
                  text: "About Me",
                  color: Colors.white,
                  maxFontSize: 18,
                  minFontSize: 18,
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
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://scontent.fktm16-1.fna.fbcdn.net/v/t1.15752-9/433842336_393236060308662_4798174647125361728_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_ohc=PvN4_DdkPXwAX_91Eih&_nc_ht=scontent.fktm16-1.fna&oh=03_AdTEGrQp3qKQ21vCgSga5ol7SEJHg_82PoEcf920m7ZTIw&oe=6630ADF9"),
            ),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Hello ',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: ', My name is ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: 'Himal Rawal ',
                    style: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const ResponsiveText(
              text:
                  "I am a passonate developer willing to make people's life easier with Mobile Apps.\n\nCurrently I am working as junior mobile app developer in Vanillatech. I have completed my Bachelor of Technology in Computer Science Engineering from Uttarakhand Technical University. \n\nI am creative thinker who loves to explore different genre of techology. I am not only limited to mobile app development I have explored different genre of tehcnology like cyber security, backend development and data engineering.\n\nI love playing mobile games,playing cricket, solving DSA problems and doing CTF.Though I have not got opportunity to explore new places but I do enjoy exploring new places ,new culture ",
              maxFontSize: 18,
              minFontSize: 10,
              color: Colors.white,
              // style: TextStyle(fontSize: 18, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
