import 'dart:core';

double calculateMediaHeight(String htmlElement, double screenWidth) {
  double mediaWidth = 0;
  double mediaHeight = 0;
  RegExp regExp = RegExp(r'data-media-width="(\d+)" data-media-height="(\d+)"');
  RegExpMatch? match = regExp.firstMatch(htmlElement);
  if (match != null) {
    mediaWidth = double.parse(match.group(1)!);
    mediaHeight = double.parse(match.group(2)!);
  }
  // print("\n");
  // print("mediaWidth $mediaWidth");
  // print("mediaHeight $mediaHeight");
  // Calculate the height relative to the aspect ratio
  // Height= Width / Ratio
  double aspectRatio =
      // (mediaWidth / mediaHeight) < 0.62 ? 0.5625 : mediaWidth / mediaHeight;
      mediaWidth / mediaHeight;
  double heightRelativeToRatio = ((screenWidth - 16) / aspectRatio) + 16;
  // print("heightRelativeToRatio $heightRelativeToRatio");

  return heightRelativeToRatio;
}
