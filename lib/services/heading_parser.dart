import 'dart:ui';

import 'package:flutter/material.dart';

import '../Config/config_map.dart';
import '../main.dart';

double calculateHeadingHeight(String heading, double screenWidth) {
  // Remove HTML tags
  String plainText = heading.replaceAll(RegExp(r'<[^>]*>'), '');
  double totalHeight = 0;

  if (heading.contains(RegExp(r'<h[1][^>]*>'))) {
    ParagraphBuilder paragraphBuilder = ParagraphBuilder(
      ParagraphStyle(
        fontSize: ConfigMap.config[fontSize]!.heading1FontSize,
        textDirection: TextDirection.ltr,
      ),
    )..addText(plainText);

    // Create a Paragraph with constraints
    Paragraph constrainedParagraph = paragraphBuilder.build()
      ..layout(ParagraphConstraints(width: screenWidth));

    // Get the actual height of the rendered text
    totalHeight = constrainedParagraph.height + 22;
  } else if (heading.contains(RegExp(r'<h[2][^>]*>'))) {
    ParagraphBuilder paragraphBuilder = ParagraphBuilder(
      ParagraphStyle(
        fontSize: ConfigMap.config[fontSize]!.heading2FontSize,
        textDirection: TextDirection.ltr,
      ),
    )..addText(plainText);

    // Create a Paragraph with constraints
    Paragraph constrainedParagraph = paragraphBuilder.build()
      ..layout(ParagraphConstraints(width: screenWidth));
    print(constrainedParagraph.height);

    // Get the actual height of the rendered text
    totalHeight =
        constrainedParagraph.height + (constrainedParagraph.height / 3);
  } else if (heading.contains(RegExp(r'<h[3][^>]*>'))) {
    ParagraphBuilder paragraphBuilder = ParagraphBuilder(
      ParagraphStyle(
        fontSize: ConfigMap.config[fontSize]!.heading3FontSize,
        textDirection: TextDirection.ltr,
      ),
    )..addText(plainText);

    // Create a Paragraph with constraints
    Paragraph constrainedParagraph = paragraphBuilder.build()
      ..layout(ParagraphConstraints(width: screenWidth));
    print(constrainedParagraph.height);

    // Get the actual height of the rendered text
    totalHeight =
        constrainedParagraph.height + (constrainedParagraph.height / 3);
  } else if (heading.contains(RegExp(r'<h[4][^>]*>'))) {
    ParagraphBuilder paragraphBuilder = ParagraphBuilder(
      ParagraphStyle(
        fontSize: ConfigMap.config[fontSize]!.heading4FontSize,
        textDirection: TextDirection.ltr,
      ),
    )..addText(plainText);

    // Create a Paragraph with constraints
    Paragraph constrainedParagraph = paragraphBuilder.build()
      ..layout(ParagraphConstraints(width: screenWidth));
    print(constrainedParagraph.height);

    // Get the actual height of the rendered text
    totalHeight =
        constrainedParagraph.height + (constrainedParagraph.height / 3);
  } else if (heading.contains(RegExp(r'<h[5][^>]*>'))) {
    ParagraphBuilder paragraphBuilder = ParagraphBuilder(
      ParagraphStyle(
        fontSize: ConfigMap.config[fontSize]!.heading5FontSize,
        textDirection: TextDirection.ltr,
      ),
    )..addText(plainText);

    // Create a Paragraph with constraints
    Paragraph constrainedParagraph = paragraphBuilder.build()
      ..layout(ParagraphConstraints(width: screenWidth));
    print(constrainedParagraph.height);

    // Get the actual height of the rendered text
    totalHeight =
        constrainedParagraph.height + (constrainedParagraph.height / 3);
  } else if (heading.contains(RegExp(r'<h[6][^>]*>'))) {
    ParagraphBuilder paragraphBuilder = ParagraphBuilder(
      ParagraphStyle(
        fontSize: ConfigMap.config[fontSize]!.heading6FontSize,
        textDirection: TextDirection.ltr,
      ),
    )..addText(plainText);

    // Create a Paragraph with constraints
    Paragraph constrainedParagraph = paragraphBuilder.build()
      ..layout(ParagraphConstraints(width: screenWidth));
    print(constrainedParagraph.height);

    // Get the actual height of the rendered text
    totalHeight =
        constrainedParagraph.height + (constrainedParagraph.height / 3);
  } else {
    ParagraphBuilder paragraphBuilder = ParagraphBuilder(
      ParagraphStyle(
        fontSize: ConfigMap.config[fontSize]!.heading6FontSize,
        textDirection: TextDirection.ltr,
      ),
    )..addText(plainText);

    // Create a Paragraph with constraints
    Paragraph constrainedParagraph = paragraphBuilder.build()
      ..layout(ParagraphConstraints(width: screenWidth));

    // Get the actual height of the rendered text
    totalHeight =
        constrainedParagraph.height + (constrainedParagraph.height / 3);
  }

  print("Measured Heading Text Height: $totalHeight pixels\n");

  return totalHeight;
}

Widget buildHeading(String heading) {
  // Remove HTML tags
  String plainText = heading.replaceAll(RegExp(r'<[^>]*>'), '').trim();

  // Adjust the heading style based on the heading level
  TextStyle headingStyle;
  if (heading.contains(RegExp(r'<h[1][^>]*>'))) {
    headingStyle = TextStyle(
        fontSize: ConfigMap.config[fontSize]!.heading1FontSize,
        fontWeight: FontWeight.bold);
  } else if (heading.contains(RegExp(r'<h[2][^>]*>'))) {
    headingStyle = TextStyle(
        fontSize: ConfigMap.config[fontSize]!.heading2FontSize,
        fontWeight: FontWeight.bold);
  } else if (heading.contains(RegExp(r'<h[3][^>]*>'))) {
    headingStyle = TextStyle(
        fontSize: ConfigMap.config[fontSize]!.heading3FontSize,
        fontWeight: FontWeight.bold);
  } else if (heading.contains(RegExp(r'<h[4][^>]*>'))) {
    headingStyle = TextStyle(
        fontSize: ConfigMap.config[fontSize]!.heading4FontSize,
        fontWeight: FontWeight.bold);
  } else if (heading.contains(RegExp(r'<h[5][^>]*>'))) {
    headingStyle = TextStyle(
        fontSize: ConfigMap.config[fontSize]!.heading5FontSize,
        fontWeight: FontWeight.bold);
  } else if (heading.contains(RegExp(r'<h[6][^>]*>'))) {
    headingStyle = TextStyle(
        fontSize: ConfigMap.config[fontSize]!.heading6FontSize,
        fontWeight: FontWeight.bold);
  } else {
    headingStyle = TextStyle(
        fontSize: ConfigMap.config[fontSize]!
            .heading6FontSize); // Default style for unrecognized headings
  }
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      plainText,
      style: headingStyle,
    ),
  );
}
