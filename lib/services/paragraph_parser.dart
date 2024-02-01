import 'package:flutter/material.dart';

double calculateParagraphHeight(String paragraph) {
  String plainText = paragraph.replaceAll(RegExp(r'<[^>]*>'), '');

  // Assuming each line takes up 20 logical pixels for simplicity
  // double lineHeight = 45.0; // For 32px
  double lineHeight = 25.0; // For 16px

  // Extracting font size from the style attribute
  // final styleRegex = RegExp(r'font-size: (\d+)px');
  // final match = styleRegex.firstMatch(plainText);
  // double fontSize = match != null ? double.parse(match.group(1)!) : 16.0;

  // Split the paragraph into words to estimate the number of lines
  List<String> words = plainText.split(' ');
  int numberOfWords = words.length;

  // Assuming an average of 10 words per line for simplicity
  // int wordsPerLine = 5; // For 32px
  int wordsPerLine = 10; // For 16px
  int numberOfLines = (numberOfWords / wordsPerLine).ceil();

  // Calculating total height based on the number of lines and font size
  double totalHeight = numberOfLines * lineHeight;

  return totalHeight;
}

Widget buildParagraph(String paragraph) {
  // Remove HTML tags
  String plainText = paragraph.replaceAll(RegExp(r'<[^>]*>'), '');

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      plainText,
      style: const TextStyle(fontSize: 16.0),
    ),
  );
}
