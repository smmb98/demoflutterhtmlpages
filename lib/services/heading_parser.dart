import 'package:flutter/material.dart';

double calculateHeadingHeight(String heading) {
  // Remove HTML tags
  String plainText = heading.replaceAll(RegExp(r'<[^>]*>'), '');
  double lineHeight = 0.0;
  int wordsPerLine = 0;

  if (heading.contains(RegExp(r'<h[1][^>]*>'))) {
    lineHeight = 45.0; // Set line height for <h1>
    wordsPerLine = 5; // Set words per line for <h1>
  } else if (heading.contains(RegExp(r'<h[2][^>]*>'))) {
    lineHeight = 40.0; // Set line height for <h2>
    wordsPerLine = 8; // Set words per line for <h2>
  } else if (heading.contains(RegExp(r'<h[3][^>]*>'))) {
    lineHeight = 35.0; // Set line height for <h3>
    wordsPerLine = 10; // Set words per line for <h3>
  } else if (heading.contains(RegExp(r'<h[4][^>]*>'))) {
    lineHeight = 30.0; // Set line height for <h4>
    wordsPerLine = 12; // Set words per line for <h4>
  } else if (heading.contains(RegExp(r'<h[5][^>]*>'))) {
    lineHeight = 25.0; // Set line height for <h5>
    wordsPerLine = 15; // Set words per line for <h5>
  } else if (heading.contains(RegExp(r'<h[6][^>]*>'))) {
    lineHeight = 20.0; // Set line height for <h6>
    wordsPerLine = 18; // Set words per line for <h6>
  } else {
    lineHeight = 25.0; // Default line height for unrecognized headings
    wordsPerLine = 10; // Default words per line for unrecognized headings
  }

  // Calculate the number of words in the heading
  List<String> words = plainText.split(' ');
  int numberOfWords = words.length;

  // Calculate the number of lines based on words per line
  int numberOfLines = (numberOfWords / wordsPerLine).ceil();

  // Calculate total height based on the number of lines and line height
  double headingHeight = numberOfLines * lineHeight;

  return headingHeight;
}

Widget buildHeading(String heading) {
  // Remove HTML tags
  String plainText = heading.replaceAll(RegExp(r'<[^>]*>'), '').trim();

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
