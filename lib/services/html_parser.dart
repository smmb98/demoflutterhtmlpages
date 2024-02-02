// ignore: library_prefixes
import 'package:demohtmlpages/services/heading_parser.dart';
import 'package:demohtmlpages/services/paragraph_parser.dart';
// ignore: library_prefixes
import 'package:html/parser.dart' as htmlParser;
import 'package:flutter/material.dart';

import '../Config/config_map.dart';
import '../main.dart';

double getAvailableHeightAndWidth(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  ConfigMap.adjustParagraphWordsPerLine(screenWidth, fontSize);

  print("screenHeight: $screenHeight");
  print("screenWidth: $screenWidth");

  double appBarHeight = AppBar().preferredSize.height;
  double availableHeight = screenHeight - appBarHeight - (screenHeight * 0.15);
  print("availableHeight: $availableHeight");
  return availableHeight;
}

List<List<String>> parseHTML(String html, BuildContext context) {
  final document = htmlParser.parse(html);
  List<String> paragraphs = document.body!.children
      .map((element) => element.outerHtml)
      .where((html) => html.isNotEmpty)
      .toList();

  List<List<String>> pages = [];
  List<String> currentPage = [];

  double availableHeight = getAvailableHeightAndWidth(context);
  double currentPageHeight = 0;

  for (String paragraph in paragraphs) {
    // Handle heading tags
    if (paragraph.contains(RegExp(r'<h[1-6][^>]*>'))) {
      // Heading tag found, handle it differently
      double headingHeight = calculateHeadingHeight(paragraph);
      // print("headingHeight: $headingHeight");
      if (currentPageHeight + headingHeight <= availableHeight) {
        currentPage.add(paragraph);
        currentPageHeight += headingHeight;
      } else {
        pages.add(List.from(currentPage));
        currentPage.clear();
        currentPage.add(paragraph);
        currentPageHeight = headingHeight;
      }
    } else if (paragraph.contains(RegExp(r'<p[^>]*>'))) {
      // Regular paragraph
      double paragraphHeight = calculateParagraphHeight(paragraph);

      // print("paragraphHeight: $paragraphHeight");

      if (currentPageHeight + paragraphHeight <= availableHeight) {
        currentPage.add(paragraph);
        currentPageHeight += paragraphHeight;
      } else {
        pages.add(List.from(currentPage));
        currentPage.clear();
        currentPage.add(paragraph);
        currentPageHeight = paragraphHeight;
      }
    }
    // print("Page: ${pages.length}");
    // print("currentPageHeight: $currentPageHeight");
    // print("\n");
  }
  // Add the remaining paragraphs to the last page
  if (currentPage.isNotEmpty) {
    pages.add(List.from(currentPage));
  }

  return pages;
}

Widget buildPage(List<String> elements) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: elements.map((element) {
        if (element.contains(RegExp(r'<h[1-6][^>]*>'))) {
          // Heading tag found, handle it differently
          return buildHeading(element);
        } else {
          // Regular paragraph
          return buildParagraph(element);
        }
      }).toList(),
    ),
  );
}
