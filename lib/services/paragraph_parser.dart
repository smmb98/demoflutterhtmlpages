import 'dart:ui';
import 'package:flutter/material.dart';
import '../Config/config_map.dart';
import '../main.dart';

double calculateParagraphHeight(String paragraph, double screenWidth) {
  String plainText = paragraph.replaceAll(RegExp(r'<[^>]*>'), '');

  ParagraphBuilder paragraphBuilder = ParagraphBuilder(
    ParagraphStyle(
      fontSize: ConfigMap.config[fontSize]!.paragraphFontSize,
      textDirection: TextDirection.ltr,
    ),
  )..addText(plainText);

  // Create a Paragraph with constraints
  Paragraph constrainedParagraph = paragraphBuilder.build()
    ..layout(ParagraphConstraints(width: screenWidth));

  // Get the actual height of the rendered text
  double totalHeight = constrainedParagraph.height + 12.5;

  // if (fontSize == 14) {
  //   totalHeight += 12.5;
  // } else if (fontSize == 16) {
  //   totalHeight += 12.5;
  // } else if (fontSize == 18) {
  //   totalHeight =
  //       totalHeight + (ConfigMap.config[fontSize]!.paragraphLineHeight / 2);
  // }

  // double totalHeight = paragraphConstraint.height +
  //     (ConfigMap.config[fontSize]!.paragraphLineHeight / 2);

  // print("Measured Paragraph Text Height: $totalHeight pixels\n");

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
        style: TextStyle(
            fontSize: ConfigMap.config[fontSize]!.paragraphFontSize,
            color: Colors.black),
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
            style: const TextStyle(fontStyle: FontStyle.italic),
            children: nestedSpans));
      } else if (match.group(1) == 'b') {
        spans.add(TextSpan(
            style: const TextStyle(fontWeight: FontWeight.bold),
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
