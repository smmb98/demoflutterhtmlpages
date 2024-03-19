import 'dart:core';

double calculateMediaHeight(String html, double screenWidth) {
  double mediaWidth = 0;
  double mediaHeight = 0;
  RegExp regExp = RegExp(r'data-media-width="(\d+)" data-media-height="(\d+)"');
  RegExpMatch? match = regExp.firstMatch(html);
  if (match != null) {
    mediaWidth = double.parse(match.group(1)!);
    mediaHeight = double.parse(match.group(2)!);
  }
  // print("imageHeight $imageHeight");
  // print("imageWidth $imageWidth");
  // Calculate the height relative to the aspect ratio
  // Height= Width / Ratio
  double heightRelativeToRatio = screenWidth / (mediaWidth / mediaHeight);
  // print("heightRelativeToRatio $heightRelativeToRatio");

  return heightRelativeToRatio;
}
