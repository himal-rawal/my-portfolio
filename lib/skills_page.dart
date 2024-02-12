import 'package:flutter/material.dart';
import 'package:myportfolio/enum.dart';
import 'package:myportfolio/portfolio_viewmodel.dart';
import 'package:provider/provider.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      //color: Colors.amber,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 20),
                const Text(
                  "My Skills",
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
            const Text(
              "Languages :",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 3),
            const Divider(
              color: Colors.green,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildSkillContainer(color: Colors.green, skill: "dart"),
                _buildSkillContainer(color: Colors.pink, skill: "C"),
                _buildSkillContainer(color: Colors.teal, skill: "Java Script"),
                _buildSkillContainer(color: Colors.blueGrey, skill: "Python")
              ],
            ),
            Row(
              children: [
                _buildSkillContainer(color: Colors.pink, skill: "Java"),
                _buildSkillContainer(color: Colors.purple, skill: "Swift"),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Frameworks :",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 3),
            const Divider(
              color: Colors.green,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildSkillContainer(color: Colors.green, skill: "Flutter"),
                _buildSkillContainer(color: Colors.teal, skill: "React Js"),
                _buildSkillContainer(color: Colors.teal, skill: "Node Js"),
                _buildSkillContainer(color: Colors.blueGrey, skill: "Flask")
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Others :",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 3),
            const Divider(
              color: Colors.green,
            ),
            const SizedBox(height: 10),
            _buildSkillContainer(
                color: Colors.green,
                skill: "Integration Testing and Unit Testiing Flutter"),
            Row(
              children: [
                _buildSkillContainer(color: Colors.indigoAccent, skill: "Git"),
                _buildSkillContainer(color: Colors.indigo, skill: "Github"),
                _buildSkillContainer(
                    color: Colors.orange, skill: "Github Action")
              ],
            ),
            Row(
              children: [
                _buildSkillContainer(
                    color: Colors.deepPurple, skill: "Codemagic"),
                _buildSkillContainer(color: Colors.purple, skill: "Firebase"),
                _buildSkillContainer(color: Colors.purpleAccent, skill: "Jira"),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Technology as Hobby :",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 3),
            const Divider(
              color: Colors.green,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildSkillContainer(
                    color: Colors.orange, skill: "Web App Penetration Testing"),
                _buildSkillContainer(color: Colors.orange, skill: "Burpsuite"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildSkillContainer(
      {required Color color, required String skill}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      height: 30,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        //border: Border.all(color: color),
      ),
      child: Text(
        skill,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
