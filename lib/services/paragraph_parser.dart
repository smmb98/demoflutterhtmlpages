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
  String plainText = paragraph
      .replaceAll(RegExp(r'<p[^>]*>'), '')
      .replaceAll('</p>', '')
      .trim();
  List<TextSpan> spans = parseFormattingTags(plainText);

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: RichText(
      text: TextSpan(
        style: TextStyle(fontSize: fontSize),
        children: spans,
      ),
    ),
  );
}

List<TextSpan> parseFormattingTags(String paragraph) {
  List<TextSpan> spans = [];
  RegExp exp = RegExp(r'<(i|b)>(.*?)<\/\1>');

  int startIndex = 0;
  int endIndex = 0;

  while (exp.hasMatch(paragraph)) {
    RegExpMatch? match = exp.firstMatch(paragraph);
    if (match != null) {
      endIndex = match.start;

      // Process the text before the formatting tag
      if (startIndex < endIndex) {
        spans.add(TextSpan(text: paragraph.substring(startIndex, endIndex)));
      }

      // Process the content within the formatting tag
      String content = match.group(2)!;
      List<TextSpan> nestedSpans = parseFormattingTags(content);

      if (match.group(1) == 'i') {
        spans.add(TextSpan(
            style: TextStyle(fontStyle: FontStyle.italic),
            children: nestedSpans));
      } else if (match.group(1) == 'b') {
        spans.add(TextSpan(
            style: TextStyle(fontWeight: FontWeight.bold),
            children: nestedSpans));
      }

      paragraph = paragraph.substring(match.end);
      startIndex = match.end;
    }
  }

  // Process any remaining text after the last formatting tag
  if (startIndex < paragraph.length) {
    spans.add(TextSpan(text: paragraph.substring(startIndex)));
  }

  return spans;
}
