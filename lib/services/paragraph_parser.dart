import 'dart:ui';
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
      text: TextSpan(
        style: TextStyle(
            fontSize: ConfigMap().getParagraphFontSize(), color: Colors.black),
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

  int index = -1;
  for (int i = 0; i < countOfFirstParagraphLastWord; i++) {
    index = cleanedParagraph.indexOf(firstParagraphlastWord, index + 1);
    if (index == -1) {
      break; // Return -1 if the word is not found before reaching the n-th occurrence
    }
  }

  // Check for unclosed tags before the last occurrence index
  List<String> unclosedTags = [];
  for (int i = 0; i < index; i++) {
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
      paragraph.substring(0, index) + firstParagraphlastWord + closingTags;

  // Extract remaining HTML
  String paragraphSecondPart =
      paragraph.substring(index + firstParagraphlastWord.length);

  // Add opening tags of the closed tags after the last word
  String openingTags = unclosedTags.map((tag) => '<$tag>').join();

  // Prepend opening tags to the remaining HTML
  paragraphSecondPart = '$openingTags$paragraphSecondPart'.trim();
  return {
    'paragraphFirstPart': paragraphFirstPart,
    'paragraphSecondPart': paragraphSecondPart
  };
}
