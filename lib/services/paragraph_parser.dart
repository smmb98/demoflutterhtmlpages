import 'package:flutter/material.dart';

import '../main.dart';

double calculateParagraphHeight(String paragraph) {
  String plainText = paragraph.replaceAll(RegExp(r'<[^>]*>'), '');

  double lineHeight;
  int wordsPerLine;

  // Adjusting lineHeight and wordsPerLine based on fontSize
  switch (fontSize) {
    case 14:
      lineHeight = 21.0;
      wordsPerLine = 11;
      break;
    case 16:
      lineHeight = 25.0;
      wordsPerLine = 10;
      break;
    case 18:
      lineHeight = 25.0;
      wordsPerLine = 8;
      break;
    // Add more cases as needed for other font sizes

    default:
      // Use a default value if the fontSize is not one of the specified cases
      lineHeight = 25.0;
      wordsPerLine = 10;
      break;
  }

  // Assuming each line takes up 20 logical pixels for simplicity
  // double lineHeight = 45.0; // For 32px
  // double lineHeight = 25.0; // For 18px
  // double lineHeight = 25.0; // For 16px
  // double lineHeight = 21.0; // For 14px

  // print("lineHeight: $lineHeight");
  // Split the paragraph into words to estimate the number of lines
  List<String> words = plainText.split(' ');
  int numberOfWords = words.length;

  // Assuming an average of 10 words per line for simplicity
  // int wordsPerLine = 5; // For 32px
  // int wordsPerLine = 8; // For 18px
  // int wordsPerLine = 10; // For 16px
  // int wordsPerLine = 11; // For 14px
  int numberOfLines = (numberOfWords / wordsPerLine).ceil();

  // print("numberOfLines: $numberOfLines");
  // Calculating total height based on the number of lines and font size
  double totalHeight = numberOfLines * lineHeight;

  // print("Paragraph totalHeight: $totalHeight\n");

  return totalHeight;
}

Widget buildParagraph(String paragraph) {
  // Remove HTML tags
  String plainText = paragraph.replaceAll(RegExp(r'<[^>]*>'), '').trim();

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      plainText,
      style: TextStyle(fontSize: fontSize),
    ),
  );
}
