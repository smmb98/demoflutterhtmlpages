import 'dart:ui';
import 'package:flutter/material.dart';
import '../Config/config_map.dart';
import '../main.dart';

double calculateParagraphHeight(String paragraph, double screenWidth) {
  String plainText = paragraph
      .replaceAll(RegExp(r'<[^>]*>'), '')
      .replaceAll("&nbsp;", ' ')
      .replaceAll("&#160;", ' ');

  ParagraphBuilder paragraphBuilder = ParagraphBuilder(
    ParagraphStyle(
      fontSize: ConfigMap.config[fontSize]!.paragraphFontSize,
      textDirection: TextDirection.ltr,
    ),
  )..addText(plainText);

  // Create a Paragraph with constraints
  Paragraph constrainedParagraph = paragraphBuilder.build()
    ..layout(ParagraphConstraints(width: screenWidth - 16));
  print(constrainedParagraph.height + 16);

  // Get the actual height of the rendered text
  double totalHeight = constrainedParagraph.height + 16;

  return totalHeight;
}

Widget buildParagraph(String paragraph) {
  String plainText = paragraph
      .replaceAll(RegExp(r'<p[^>]*>'), '')
      .replaceAll('</p>', '')
      .replaceAll("&nbsp;", ' ')
      .replaceAll("&#160;", ' ')
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
  RegExp exp = RegExp(r'<(i|b|span)[^>]*?>(.*?)<\/\1>');

  int startIndex = 0;

  exp.allMatches(paragraph).forEach((match) {
    // Process the text before the formatting tag
    if (startIndex < match.start) {
      spans.add(TextSpan(text: paragraph.substring(startIndex, match.start)));
    }

    // Process the content within the formatting tag
    String tag = match.group(1)!;
    String content = match.group(2)!;

    if (tag == 'i') {
      spans.add(TextSpan(
          style: const TextStyle(fontStyle: FontStyle.italic),
          children: parseFormattingTags(content)));
    } else if (tag == 'b') {
      spans.add(TextSpan(
          style: const TextStyle(fontWeight: FontWeight.bold),
          children: parseFormattingTags(content)));
    } else if (tag == 'span') {
      if (match.group(0)!.contains('font-weight: bolder')) {
        spans.add(TextSpan(
            style: const TextStyle(fontWeight: FontWeight.bold),
            children: parseFormattingTags(content)));
      } else {
        // Default style for span tag
        spans.addAll(parseFormattingTags(content));
      }
    }

    startIndex = match.end;
  });

  // Process any remaining text after the last formatting tag
  if (startIndex < paragraph.length) {
    spans.add(TextSpan(text: paragraph.substring(startIndex)));
  }

  return spans;
}
