import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final double minFontSize;
  final double maxFontSize;
  final Color? color;
  final bool? giveHeightWidth;
  final double? maxHeight;
  final double? maxWidth;
  final FontWeight? fontWeight;

  const ResponsiveText(
      {Key? key,
      required this.text,
      required this.minFontSize,
      required this.maxFontSize,
      this.color,
      this.giveHeightWidth = false,
      this.maxHeight,
      this.maxWidth,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width <= 500
        ? Text(
            text,
            style:
                TextStyle(fontSize: 18, color: color, fontWeight: fontWeight),
          )
        : LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // Get the available width
              final screenWidth = MediaQuery.of(context).size.width;

              // Calculate the fontSize based on screen width
              final double fontSize =
                  screenWidth / 100; // You can adjust this ratio for your needs
              final double finalFontSize = fontSize.clamp(minFontSize,
                  maxFontSize); // Ensure font size stays within defined bounds
              print("finalsize:$finalFontSize");
              if (giveHeightWidth == true) {
                return Container(
                    constraints: BoxConstraints(
                        maxHeight: maxHeight ?? double.infinity,
                        maxWidth: maxWidth ?? double.infinity),
                    child: Text(text,
                        style: TextStyle(
                            fontSize: finalFontSize,
                            color: color,
                            fontWeight: fontWeight)));
              } else {
                return Text(
                  text,
                  style: TextStyle(
                      fontSize: finalFontSize,
                      color: color,
                      fontWeight: fontWeight),
                );
              }
            },
          );
  }
}
