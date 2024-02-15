// ignore: library_prefixes
import 'package:demohtmlpages/Config/config_map.dart';
import 'package:demohtmlpages/services/heading_parser.dart';
import 'package:demohtmlpages/services/paragraph_parser.dart';
// ignore: library_prefixes
import 'package:html/parser.dart' as htmlParser;
import 'package:flutter/material.dart';

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
    } else if (htmlElement.contains(RegExp(r'<p[^>]*>'))) {
      // Regular paragraph
      double paragraphHeight =
          calculateParagraphHeight(htmlElement, screenWidth);

      // print("paragraphHeight: $paragraphHeight");

      if (currentPageHeight + paragraphHeight <= screenHeight) {
        currentPage.add(htmlElement);
        currentPageHeight += paragraphHeight;
      } else if (currentPageHeight > ConfigMap().getParagraphLineSize() + 16) {
        double availableHeight = screenHeight - currentPageHeight;

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
  // Add the remaining paragraphs to the last page
  if (currentPage.isNotEmpty) {
    pages.add(List.from(currentPage));
  }

  return pages;
}

Widget buildPage(List<String> htmlElements) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: htmlElements.map((htmlElement) {
        if (htmlElement.contains(RegExp(r'<h[1-6][^>]*>'))) {
          // Heading tag found, handle it differently
          return buildHeading(htmlElement);
        } else {
          // Regular paragraph
          return buildParagraph(htmlElement);
        }
      }).toList(),
    ),
  );
}
