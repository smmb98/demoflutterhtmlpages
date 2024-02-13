import 'dart:ui';

import 'package:flutter/material.dart';

import '../Config/config_map.dart';
import '../main.dart';

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
  if (headingLevel == 1) {
    headingFontSize = ConfigMap.config[fontSize]!.heading1FontSize;
  } else if (headingLevel == 2) {
    headingFontSize = ConfigMap.config[fontSize]!.heading2FontSize;
  } else if (headingLevel == 3) {
    headingFontSize = ConfigMap.config[fontSize]!.heading3FontSize;
  } else if (headingLevel == 4) {
    headingFontSize = ConfigMap.config[fontSize]!.heading4FontSize;
  } else if (headingLevel == 5) {
    headingFontSize = ConfigMap.config[fontSize]!.heading5FontSize;
  } else if (headingLevel == 6) {
    headingFontSize = ConfigMap.config[fontSize]!.heading6FontSize;
  } else {
    headingFontSize = ConfigMap.config[fontSize]!.heading6FontSize;
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

  print("Measured Heading Text Height: $headingHeight pixels\n");

  return headingHeight;
}

Widget buildHeading(String heading) {
  // Remove HTML tags
  String plainText = heading.replaceAll(RegExp(r'<[^>]*>'), '').trim();

  // Determine heading level
  int headingLevel = 6; // Default to lowest heading level
  RegExpMatch? match = RegExp(r'<h(\d)[^>]*>').firstMatch(heading);
  if (match != null) {
    headingLevel = int.parse(match.group(1)!);
  }

  // Get heading style based on heading level
  TextStyle headingStyle = TextStyle(
    fontSize: ConfigMap.config[fontSize]!.heading6FontSize,
    fontWeight: FontWeight.bold,
  );

  if (headingLevel == 1) {
    headingStyle = TextStyle(
      fontSize: ConfigMap.config[fontSize]!.heading1FontSize,
      fontWeight: FontWeight.bold,
    );
  } else if (headingLevel == 2) {
    headingStyle = TextStyle(
      fontSize: ConfigMap.config[fontSize]!.heading2FontSize,
      fontWeight: FontWeight.bold,
    );
  } else if (headingLevel == 3) {
    headingStyle = TextStyle(
      fontSize: ConfigMap.config[fontSize]!.heading3FontSize,
      fontWeight: FontWeight.bold,
    );
  } else if (headingLevel == 4) {
    headingStyle = TextStyle(
      fontSize: ConfigMap.config[fontSize]!.heading4FontSize,
      fontWeight: FontWeight.bold,
    );
  } else if (headingLevel == 5) {
    headingStyle = TextStyle(
      fontSize: ConfigMap.config[fontSize]!.heading5FontSize,
      fontWeight: FontWeight.bold,
    );
  } else if (headingLevel == 6) {
    headingStyle = TextStyle(
      fontSize: ConfigMap.config[fontSize]!.heading6FontSize,
      fontWeight: FontWeight.bold,
    );
  } else {
    headingStyle = TextStyle(
      fontSize: ConfigMap.config[fontSize]!.heading6FontSize,
      fontWeight: FontWeight.bold,
    );
  }

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      plainText,
      style: headingStyle,
    ),
  );
}
