({double height, double width}) sizeConstraints(double height, double width) {
  if (height.isBetween(849, 1) && width.isBetween(1650, 1680)) {
    return (height: 49.0, width: 50.0);
  }
  return (height: height, width: width);
}

extension DoubleRangeExtension on double {
  bool isBetween(double min, double max) {
    return this >= min && this <= max;
  }
}
