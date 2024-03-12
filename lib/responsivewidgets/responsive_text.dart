import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final double minFontSize;
  final double maxFontSize;
  final Color? color;

  const ResponsiveText(
      {Key? key,
      required this.text,
      required this.minFontSize,
      required this.maxFontSize,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Get the available width
        final screenWidth = constraints.maxWidth;

        // Calculate the fontSize based on screen width
        final double fontSize =
            screenWidth / 20; // You can adjust this ratio for your needs
        final double finalFontSize = fontSize.clamp(minFontSize,
            maxFontSize); // Ensure font size stays within defined bounds
        print("finalsize:$finalFontSize");
        return Text(
          text,
          style: TextStyle(fontSize: finalFontSize, color: color),
        );
      },
    );
  }
}
