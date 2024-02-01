import 'package:flutter/material.dart';

double calculateHeadingHeight(String heading) {
  // Remove HTML tags
  String plainText = heading.replaceAll(RegExp(r'<[^>]*>'), '');

  // Calculate the number of words in the heading
  List<String> words = plainText.split(' ');
  int numberOfWords = words.length;

  // Assuming each word takes up 10 logical pixels for simplicity
  double wordWidth = 10.0;

  // Calculate the heading height based on the number of words
  double headingHeight = numberOfWords * wordWidth;

  // Adjust the heading height based on the heading level
  double fontSize;
  if (heading.contains(RegExp(r'<h[1][^>]*>'))) {
    fontSize = 32.0;
  } else if (heading.contains(RegExp(r'<h[2][^>]*>'))) {
    fontSize = 28.0;
  } else if (heading.contains(RegExp(r'<h[3][^>]*>'))) {
    fontSize = 24.0;
  } else if (heading.contains(RegExp(r'<h[4][^>]*>'))) {
    fontSize = 20.0;
  } else if (heading.contains(RegExp(r'<h[5][^>]*>'))) {
    fontSize = 18.0;
  } else if (heading.contains(RegExp(r'<h[6][^>]*>'))) {
    fontSize = 16.0;
  } else {
    fontSize = 16.0; // Default size for unrecognized headings
  }

  // Adjust the heading height based on the font size
  headingHeight += fontSize * 1.5; // Adjust as needed

  return headingHeight;
}

Widget buildHeading(String heading) {
  // Remove HTML tags
  String plainText = heading.replaceAll(RegExp(r'<[^>]*>'), '');

  // Adjust the heading style based on the heading level
  TextStyle headingStyle;
  if (heading.contains(RegExp(r'<h[1][^>]*>'))) {
    headingStyle = const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold);
  } else if (heading.contains(RegExp(r'<h[2][^>]*>'))) {
    headingStyle = const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold);
  } else if (heading.contains(RegExp(r'<h[3][^>]*>'))) {
    headingStyle = const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);
  } else if (heading.contains(RegExp(r'<h[4][^>]*>'))) {
    headingStyle = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  } else if (heading.contains(RegExp(r'<h[5][^>]*>'))) {
    headingStyle = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  } else if (heading.contains(RegExp(r'<h[6][^>]*>'))) {
    headingStyle = const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
  } else {
    headingStyle = const TextStyle(
        fontSize: 16.0); // Default style for unrecognized headings
  }
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      plainText,
      style: headingStyle,
    ),
  );
}
