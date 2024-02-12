import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:myportfolio/clock_viewmodel.dart';
import 'package:provider/provider.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ClockViewmodel>().clock();
    return SizedBox(
      width: 200,
      height: 140,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${context.watch<ClockViewmodel>().currentTime.hour}:",
            style: const TextStyle(
                fontSize: 40.0, fontFamily: 'Canterbury', color: Colors.white),
          ),
          const SizedBox(width: 10),
          Text(
            "${context.watch<ClockViewmodel>().currentTime.minute}:",
            style: const TextStyle(
                fontSize: 40.0, fontFamily: 'Canterbury', color: Colors.white),
          ),
          const SizedBox(width: 10),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 40.0,
              fontFamily: 'Horizon',
            ),
            child: AnimatedTextKit(
              pause: const Duration(milliseconds: 30),
              repeatForever: true,
              animatedTexts: [
                RotateAnimatedText(
                    context
                        .watch<ClockViewmodel>()
                        .currentTime
                        .second
                        .toString(),
                    duration: const Duration(seconds: 1),
                    textStyle: const TextStyle(
                        fontFamily: 'Canterbury', color: Colors.white)),
              ],
            ),
          ),
          // Text(
          //     context.watch<PortfolioViewmodel>().currentTime.second.toString())
        ],
      ),
    );
  }
}
