import 'dart:ui';
import 'package:demohtmlpages/services/html_parser.dart';
import 'package:flutter/material.dart';
import '../Config/config_map.dart';

double calculateHeadingHeight(String heading, double screenWidth) {
  // Remove HTML tags
  String plainText = heading.replaceAll(RegExp(r'<[^>]*>'), '');

  double headingHeight = 0;
  int headingLevel = 6; // Default to lowest heading level

  // Determine heading level
  RegExpMatch? match = RegExp(r'<h(\d)[^>]*>').firstMatch(heading);
  if (match != null) {
    headingLevel = int.parse(match.group(1)!);
  }
  double headingFontSize = 16;

  // Set font size based on heading level
  if (headingLevel >= 1 && headingLevel <= 6) {
    headingFontSize =
        ConfigMap().getHeadingFontSize(HeadingType.values[headingLevel - 1]);
  } else {
    headingFontSize = ConfigMap().getHeadingFontSize(HeadingType.h6);
  }

  // Create paragraph builder
  ParagraphBuilder paragraphBuilder = ParagraphBuilder(
    ParagraphStyle(
      fontSize: headingFontSize,
      textDirection: TextDirection.ltr,
    ),
  )..addText(plainText);

  // Create a Paragraph with constraints
  Paragraph constrainedParagraph = paragraphBuilder.build()
    ..layout(ParagraphConstraints(width: screenWidth - 16));

  // Calculate total height
  headingHeight = constrainedParagraph.height + 16;

  // print("Measured Heading Text Height: $headingHeight pixels\n");

  return headingHeight;
}

Widget buildHeading(String heading) {
  // Remove HTML tags
  String plainText = heading
      .replaceAll(RegExp(r'<h[^>]*>'), '')
      .replaceAll(RegExp(r'</h[^>]*>'), '')
      .trim()
      .replaceAll("&nbsp;", ' ')
      .replaceAll("&#160;", ' ');
  // Determine heading level
  int headingLevel = 6; // Default to lowest heading level
  RegExpMatch? match = RegExp(r'<h(\d)[^>]*>').firstMatch(heading);
  if (match != null) {
    headingLevel = int.parse(match.group(1)!);
  }

  TextStyle headingStyle = TextStyle(
    fontSize: ConfigMap().getHeadingFontSize(HeadingType.h6),
    fontWeight: FontWeight.bold,
  );

  if (headingLevel >= 1 && headingLevel <= 6) {
    headingStyle = TextStyle(
      fontSize:
          ConfigMap().getHeadingFontSize(HeadingType.values[headingLevel - 1]),
      fontWeight: FontWeight.bold,
    );
  } else {
    headingStyle = TextStyle(
      fontSize: ConfigMap().getHeadingFontSize(HeadingType.h6),
      fontWeight: FontWeight.bold,
    );
  }

  List<TextSpan> spans = parseFormattingTags(plainText);

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: RichText(
      text: TextSpan(
        style: TextStyle(
            fontSize: headingStyle.fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black),
        children: spans,
      ),
    ),
  );
}
