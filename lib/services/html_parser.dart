// ignore: library_prefixes
import 'package:demohtmlpages/Config/config_map.dart';
import 'package:demohtmlpages/services/heading_parser.dart';
import 'package:demohtmlpages/services/paragraph_parser.dart';
// ignore: library_prefixes
import 'package:html/parser.dart' as htmlParser;
import 'package:flutter/material.dart';

import 'media_parser.dart';

Map<String, double> getAvailableDeviceHeightAndWidth(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  print("screenHeight: $screenHeight");
  print("screenWidth: $screenWidth");

  double appBarHeight = AppBar().preferredSize.height;

  double availableHeight = screenHeight - appBarHeight;
  availableHeight = availableHeight - (availableHeight * 0.15);
  print("availableHeight: $availableHeight");
  return {'screenHeight': availableHeight, 'screenWidth': screenWidth};
}

List<List<String>> parseHTML(String html, BuildContext context) {
  final document = htmlParser.parse(html);
  List<String> htmlContent = document.body!.children
      .map((element) => element.outerHtml)
      .where((html) => html.isNotEmpty)
      .toList();

  List<List<String>> pages = [];
  List<String> currentPage = [];

  var {'screenHeight': screenHeight, 'screenWidth': screenWidth} =
      getAvailableDeviceHeightAndWidth(context);

  double currentPageHeight = 0;

  for (String htmlElement in htmlContent) {
    if (!RegExp(r'<(\w+)[^>]*>\s*</\1>').hasMatch(htmlElement)) {
      // Handle heading tags
      if (htmlElement.contains(RegExp(r'<h[1-6][^>]*>'))) {
        // Heading tag found, handle it differently
        double headingHeight = calculateHeadingHeight(htmlElement, screenWidth);
        // print("headingHeight: $headingHeight");
        if (currentPageHeight + headingHeight <= screenHeight) {
          currentPage.add(htmlElement);
          currentPageHeight += headingHeight;
        } else {
          pages.add(List.from(currentPage));
          currentPage.clear();
          currentPage.add(htmlElement);
          currentPageHeight = headingHeight;
        }
      } else if (htmlElement.contains('<br>')) {
        double lineBreak = ConfigMap().getParagraphLineSize() + 16;
        // print("headingHeight: $headingHeight");
        if (currentPageHeight + lineBreak <= screenHeight) {
          currentPage.add(htmlElement);
          currentPageHeight += lineBreak;
        } else {
          pages.add(List.from(currentPage));
          currentPage.clear();
          currentPage.add(htmlElement);
          currentPageHeight = lineBreak;
        }
      } else if (htmlElement.contains('<img')) {
        double heightRelativeToRatio = calculateMediaHeight(html, screenWidth);

        if (currentPageHeight + heightRelativeToRatio <= screenHeight) {
          currentPage.add(htmlElement);
          currentPageHeight += heightRelativeToRatio;
        } else {
          pages.add(List.from(currentPage));
          currentPage.clear();
          currentPage.add(htmlElement);
          currentPageHeight = heightRelativeToRatio;
        }
      } else if (htmlElement.contains('<video')) {
        double heightRelativeToRatio = calculateMediaHeight(html, screenWidth);

        if (currentPageHeight + heightRelativeToRatio <= screenHeight) {
          currentPage.add(htmlElement);
          currentPageHeight += heightRelativeToRatio;
        } else {
          pages.add(List.from(currentPage));
          currentPage.clear();
          currentPage.add(htmlElement);
          currentPageHeight = heightRelativeToRatio;
        }
      } else if (htmlElement.contains(RegExp(r'<p[^>]*>'))) {
        // Regular paragraph
        double paragraphHeight =
            calculateParagraphHeight(htmlElement, screenWidth);

        // print("paragraphHeight: $paragraphHeight");
        double availableHeight = screenHeight - currentPageHeight;

        if (currentPageHeight + paragraphHeight <= screenHeight) {
          currentPage.add(htmlElement);
          currentPageHeight += paragraphHeight;
        } else if (availableHeight > ConfigMap().getParagraphLineSize() + 16) {
          // print(ConfigMap().getParagraphLineSize() + 16);
          // double availableHeight = screenHeight - currentPageHeight;
          // print("availableHeight = screenHeight - currentPageHeight");
          // print("$availableHeight = $screenHeight - $currentPageHeight");

          var {
            'paragraphFirstPart': paragraphFirstPart,
            'paragraphSecondPart': paragraphSecondPart,
          } = splitParagraphIntoLines(
              htmlElement, screenWidth, availableHeight, paragraphHeight);

          currentPage.add(paragraphFirstPart);

          pages.add(List.from(currentPage));
          currentPage.clear();
          currentPage.add(paragraphSecondPart);
          currentPageHeight =
              calculateParagraphHeight(paragraphSecondPart, screenWidth);
        } else {
          pages.add(List.from(currentPage));
          currentPage.clear();
          currentPage.add(htmlElement);
          currentPageHeight = paragraphHeight;
        }
      }
      // print("Page: ${pages.length}");
      // print("currentPageHeight: $currentPageHeight");
      // print("\n");
    }
  }
  // Add the remaining paragraphs to the last page
  if (currentPage.isNotEmpty) {
    pages.add(List.from(currentPage));
  }

  return pages;
}

Widget buildPage(List<String> htmlElements, BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: htmlElements.map((htmlElement) {
        if (htmlElement.contains(RegExp(r'<h[1-6][^>]*>'))) {
          // Heading tag found, handle it differently
          return buildHeading(htmlElement);
        } else if (htmlElement.contains('<br>')) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: ConfigMap().getParagraphLineSize() + 16,
          );
        } else if (htmlElement.contains('<img')) {
          String source = "";
          double imageWidth = 0;
          double imageHeight = 0;
          RegExp regExp = RegExp(
              r'<img src="([^"]+)" data-media-width="(\d+)" data-media-height="(\d+)"');

          RegExpMatch? match = regExp.firstMatch(htmlElement);
          if (match != null) {
            source = match.group(1)!;
            imageWidth = double.parse(match.group(2)!);
            imageHeight = double.parse(match.group(3)!);
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: imageWidth / imageHeight,
              child: Image.network(source),
            ),
          );
        } else if (htmlElement.contains('<video')) {
          String source = "";
          double videoWidth = 0;
          double videoHeight = 0;
          RegExp regExp = RegExp(
              r'<video src="([^"]+)" data-media-width="(\d+)" data-media-height="(\d+)"');

          RegExpMatch? match = regExp.firstMatch(htmlElement);
          if (match != null) {
            source = match.group(1)!;
            videoWidth = double.parse(match.group(2)!);
            videoHeight = double.parse(match.group(3)!);
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: videoWidth / videoHeight,
              child: Container(
                color: Colors.green,
              ),
            ),
          );
        } else {
          // Regular paragraph
          return buildParagraph(htmlElement);
        }
      }).toList(),
    ),
  );
}

List<TextSpan> parseFormattingTags(String htmlContents) {
  List<TextSpan> spans = [];
  RegExp exp = RegExp(r'<(i|b|u|span)[^>]*?>(.*?)<\/\1>');
  int startIndex = 0;

  exp.allMatches(htmlContents).forEach((match) {
    // Process the text before the formatting tag
    if (startIndex < match.start) {
      spans
          .add(TextSpan(text: htmlContents.substring(startIndex, match.start)));
    }

    // Process the content within the formatting tag
    String tag = match.group(1)!;
    String content = match.group(2)!;

    if (tag == 'i') {
      spans.add(TextSpan(
          style: const TextStyle(fontStyle: FontStyle.italic),
          children: parseFormattingTags(content)));
    } else if (tag == 'u') {
      spans.add(TextSpan(
          style: const TextStyle(decoration: TextDecoration.underline),
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
  if (startIndex < htmlContents.length) {
    spans.add(TextSpan(text: htmlContents.substring(startIndex)));
  }

  return spans;
}
