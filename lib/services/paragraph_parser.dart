import 'dart:ui';
import 'package:demohtmlpages/services/html_parser.dart';
import 'package:flutter/material.dart';
import '../Config/config_map.dart';

double calculateParagraphHeight(String paragraph, double screenWidth) {
  String plainText = paragraph
      .replaceAll(RegExp(r'<[^>]*>'), '')
      .replaceAll("&nbsp;", ' ')
      .replaceAll("&#160;", ' ');

  ParagraphBuilder paragraphBuilder = ParagraphBuilder(
    ParagraphStyle(
      fontSize: ConfigMap().getParagraphFontSize(),
      textDirection: TextDirection.ltr,
    ),
  )..addText(plainText);

  // Create a Paragraph with constraints
  Paragraph constrainedParagraph = paragraphBuilder.build()
    ..layout(ParagraphConstraints(width: screenWidth - 16));

  // Get the actual height of the rendered text
  double totalHeight = constrainedParagraph.height + 16;

  return totalHeight;
}

Widget buildParagraph(String paragraph) {
  String plainText = paragraph
      .replaceAll(RegExp(r'<p[^>]*>'), '')
      .replaceAll('</p>', '')
      .trim()
      .replaceAll("&nbsp;", ' ')
      .replaceAll("&#160;", ' ');
  List<TextSpan> spans = parseFormattingTags(plainText);

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: TextStyle(
            fontSize: ConfigMap().getParagraphFontSize(), color: Colors.black),
        children: spans,
      ),
    ),
  );
}

Map<String, dynamic> splitParagraphIntoLines(String paragraph,
    double screenWidth, double availableHeight, double paragraphHeight) {
  String plainText = paragraph
      .replaceAll(RegExp(r'<[^>]*>'), '')
      .replaceAll("&nbsp;", ' ')
      .replaceAll("&#160;", ' ');
  // Split the paragraph into words
  List<String> words = plainText.split(' ');

  // Initialize variables
  double currentHeight = ConfigMap().getParagraphLineSize();
  String currentWords = "";

  for (int i = 0; i < words.length; i++) {
    String word = words[i];
    ParagraphBuilder paragraphBuilder = ParagraphBuilder(
      ParagraphStyle(
        fontSize: ConfigMap().getParagraphFontSize(),
        textDirection: TextDirection.ltr,
      ),
    );

    paragraphBuilder.addText("$currentWords $word");
    Paragraph constrainedParagraph = paragraphBuilder.build()
      ..layout(ParagraphConstraints(width: screenWidth - 16));

    // Get the actual height of the rendered text
    double currentLinesHeight = constrainedParagraph.height;
    // print("currentLinesHeight: $currentLinesHeight");
    if (currentHeight < currentLinesHeight) {
      currentHeight = currentLinesHeight;
      // print("////currentLinesHeight + 16: ");
      // print(currentLinesHeight);
    }
    if (currentLinesHeight + 16 < availableHeight) {
      currentWords = "$currentWords $word";
      // print(currentWords);
    } else {
      break;
    }
  }

  Map<String, String> result = conversionToHTML(paragraph, currentWords);
  var {
    'paragraphFirstPart': paragraphFirstPart,
    'paragraphSecondPart': paragraphSecondPart
  } = result;

  return {
    'paragraphFirstPart': paragraphFirstPart,
    'paragraphSecondPart': paragraphSecondPart,
  };
}

Map<String, String> conversionToHTML(String paragraph, String splittedText) {
  String firstParagraphlastWord = splittedText.trim().split(' ').last;
  int countOfFirstParagraphLastWord = 0;
  for (String word in splittedText.trim().split(' ')) {
    if (word.replaceAll(RegExp(r'<[^>]*>'), '') == firstParagraphlastWord) {
      countOfFirstParagraphLastWord++;
    }
  }
  // print(
  //     'firstParagraphlastWord $firstParagraphlastWord appears $countOfFirstParagraphLastWord times.');

  // Replace HTML tags with '^' characters
  String cleanedParagraph = paragraph.replaceAllMapped(RegExp(r'<[^>]*>'),
      (match) => match.group(0)!.replaceAll(RegExp(r'\S'), '^'));

  // print("cleanedParagraph");
  // print(cleanedParagraph);

  int indexOfFirstParagraphLastWord = -1;
  for (int i = 0; i < countOfFirstParagraphLastWord; i++) {
    indexOfFirstParagraphLastWord = cleanedParagraph.indexOf(
        firstParagraphlastWord, indexOfFirstParagraphLastWord + 1);
    if (indexOfFirstParagraphLastWord == -1) {
      break; // Return -1 if the word is not found before reaching the n-th occurrence
    }
  }

  // Check for unclosed tags before the last occurrence index
  List<String> unclosedTags = [];
  for (int i = 0; i < indexOfFirstParagraphLastWord; i++) {
    if (paragraph[i] == '<') {
      int endIndex = paragraph.indexOf('>', i);
      String tag = paragraph.substring(i + 1, endIndex);
      if (!tag.startsWith('/')) {
        unclosedTags.add(tag.split(' ')[0]);
      } else {
        String closingTag = tag.substring(1).split(' ')[0];
        unclosedTags.remove(closingTag);
      }
      i = endIndex;
    }
  }

  // Close unclosed tags
  String closingTags = unclosedTags.reversed.map((tag) => '</$tag>').join();

  // Create the final fixed HTML by splitting at the last occurrence index and adding closing tags
  String paragraphFirstPart =
      paragraph.substring(0, indexOfFirstParagraphLastWord) +
          firstParagraphlastWord +
          closingTags;

  // Extract remaining HTML
  String paragraphSecondPart = paragraph
      .substring(indexOfFirstParagraphLastWord + firstParagraphlastWord.length);

  // Add opening tags of the closed tags after the last word
  String openingTags = unclosedTags.map((tag) => '<$tag>').join();

  // Prepend opening tags to the remaining HTML
  paragraphSecondPart = '$openingTags$paragraphSecondPart'.trim();
  return {
    'paragraphFirstPart': paragraphFirstPart,
    'paragraphSecondPart': paragraphSecondPart
  };
}
