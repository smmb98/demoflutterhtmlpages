import 'package:demohtmlpages/services/html_parser.dart';
import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:html/parser.dart' as htmlParser;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String htmlData =
      '''<h4 style="color: rgba(0, 0, 0, 0.87); background-color: rgb(250, 250, 250);">A Magical Journey: Harry Potter</h4><h2 style="color: rgba(0, 0, 0, 0.87); letter-spacing: 0.25px; background-color: rgb(250, 250, 250);">Chapter 1: The Boy Who Lived</h2><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> In a distant galaxy, there existed a planet named Lumaria. On Lumaria, a young scientist named Stella devoted her days to studying the mesmerizing glowberries that lit up the night sky. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> One evening, while conducting an experiment, Stella accidentally created a portal to a parallel universe. Through the shimmering portal, she glimpsed a world filled with breathtaking landscapes and mysterious creatures. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> Intrigued, Stella stepped through the portal and found herself in the Enchanted Realm. The air was filled with magic, and the trees whispered ancient secrets. Determined to learn more, Stella embarked on a quest to unravel the mysteries of this mystical realm. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> Along her journey, Stella encountered a wise old wizard who offered guidance. He revealed that Lumaria and the Enchanted Realm were connected by a delicate balance of cosmic energies. Stella's experiment had disrupted this balance, and now she held the key to restoring harmony. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> Armed with newfound knowledge, Stella set out to collect essence crystals scattered across the Enchanted Realm. Each crystal held a unique power that, when combined, could mend the fabric of the cosmic balance. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> As Stella gathered the essence crystals, she encountered challenges and made allies among mythical creatures. A mischievous pixie guided her through the Whispering Woods, and a gentle dragon provided her with safe passage across the Crystal Lake. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> With each crystal she collected, the Enchanted Realm sparkled with renewed vitality. The once-fading glow of the glowberries regained its brilliance, casting a magical radiance across the entire realm. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> Finally, as Stella placed the last essence crystal into the cosmic altar, a surge of energy rippled through the air. Lumaria and the Enchanted Realm realigned, restoring the delicate balance that bound the two worlds together. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> Grateful for Stella's efforts, the enchanted creatures of the realm gathered to bid her farewell. With a heart full of gratitude, Stella stepped back through the portal, returning to her home on Lumaria. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> From that day on, Stella continued her scientific pursuits, forever cherishing the memories of the Enchanted Realm and the cosmic adventure that bridged two worlds. </p>''';

  const MyHomePage({super.key});

  // double getAvailableHeight(BuildContext context) {
  //   double screenHeight = MediaQuery.of(context).size.height;
  //   double appBarHeight = AppBar().preferredSize.height;
  //   double availableHeight =
  //       screenHeight - appBarHeight - (screenHeight * 0.15);
  //   return availableHeight;
  // }

  // List<List<String>> parseHTML(String html, BuildContext context) {
  //   final document = htmlParser.parse(html);
  //   List<String> paragraphs = document.body!.children
  //       .map((element) => element.outerHtml)
  //       .where((html) => html.isNotEmpty)
  //       .toList();

  //   List<List<String>> pages = [];
  //   List<String> currentPage = [];

  //   double availableHeight = getAvailableHeight(context);
  //   double currentPageHeight = 0;

  //   for (String paragraph in paragraphs) {
  //     double paragraphHeight = calculateParagraphHeight(paragraph);

  //     // Handle heading tags
  //     if (paragraph.contains(RegExp(r'<h[1-6][^>]*>'))) {
  //       // Heading tag found, handle it differently
  //       double headingHeight = calculateHeadingHeight(paragraph);
  //       if (currentPageHeight + headingHeight <= availableHeight) {
  //         currentPage.add(paragraph);
  //         currentPageHeight += headingHeight;
  //       } else {
  //         pages.add(List.from(currentPage));
  //         currentPage.clear();
  //         currentPage.add(paragraph);
  //         currentPageHeight = headingHeight;
  //       }
  //     } else {
  //       // Regular paragraph
  //       if (currentPageHeight + paragraphHeight <= availableHeight) {
  //         currentPage.add(paragraph);
  //         currentPageHeight += paragraphHeight;
  //       } else {
  //         pages.add(List.from(currentPage));
  //         currentPage.clear();
  //         currentPage.add(paragraph);
  //         currentPageHeight = paragraphHeight;
  //       }
  //     }
  //   }

  //   // Add the remaining paragraphs to the last page
  //   if (currentPage.isNotEmpty) {
  //     pages.add(List.from(currentPage));
  //   }

  //   return pages;
  // }

  // double calculateHeadingHeight(String heading) {
  //   // Remove HTML tags
  //   String plainText = heading.replaceAll(RegExp(r'<[^>]*>'), '');

  //   // Calculate the number of words in the heading
  //   List<String> words = plainText.split(' ');
  //   int numberOfWords = words.length;

  //   // Assuming each word takes up 10 logical pixels for simplicity
  //   double wordWidth = 10.0;

  //   // Calculate the heading height based on the number of words
  //   double headingHeight = numberOfWords * wordWidth;

  //   // Adjust the heading height based on the heading level
  //   double fontSize;
  //   if (heading.contains('<h1>')) {
  //     fontSize = 32.0;
  //   } else if (heading.contains('<h2>')) {
  //     fontSize = 28.0;
  //   } else if (heading.contains('<h3>')) {
  //     fontSize = 24.0;
  //   } else if (heading.contains('<h4>')) {
  //     fontSize = 20.0;
  //   } else if (heading.contains('<h5>')) {
  //     fontSize = 18.0;
  //   } else if (heading.contains('<h6>')) {
  //     fontSize = 16.0;
  //   } else {
  //     fontSize = 16.0; // Default size for unrecognized headings
  //   }

  //   // Adjust the heading height based on the font size
  //   headingHeight += fontSize * 1.5; // Adjust as needed

  //   return headingHeight;
  // }

  // double calculateParagraphHeight(String paragraph) {
  //   String plainText = paragraph.replaceAll(RegExp(r'<[^>]*>'), '');

  //   // Assuming each line takes up 20 logical pixels for simplicity
  //   // double lineHeight = 45.0; // For 32px
  //   double lineHeight = 25.0; // For 16px

  //   // Extracting font size from the style attribute
  //   // final styleRegex = RegExp(r'font-size: (\d+)px');
  //   // final match = styleRegex.firstMatch(plainText);
  //   // double fontSize = match != null ? double.parse(match.group(1)!) : 16.0;

  //   // Split the paragraph into words to estimate the number of lines
  //   List<String> words = plainText.split(' ');
  //   int numberOfWords = words.length;

  //   // Assuming an average of 10 words per line for simplicity
  //   // int wordsPerLine = 5; // For 32px
  //   int wordsPerLine = 10; // For 16px
  //   int numberOfLines = (numberOfWords / wordsPerLine).ceil();

  //   // Calculating total height based on the number of lines and font size
  //   double totalHeight = numberOfLines * lineHeight;

  //   return totalHeight;
  // }

  @override
  Widget build(BuildContext context) {
    // double availableHeight = getAvailableHeight(context);
    // print("Available Height: $availableHeight");

    List<List<String>> pages = parseHTML(htmlData, context);
    // Print the parsed 2D array
    // for (List<String> page in pages) {
    //   print(page);
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal Paginated HTML'),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.red, width: 20),
        // ),
        child: PageView.builder(
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return buildPage(pages[index]);
          },
        ),
      ),
    );
  }

  // Widget buildPage(List<String> elements) {
  //   return SingleChildScrollView(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: elements.map((element) {
  //         if (element.contains(RegExp(r'<h[1-6][^>]*>'))) {
  //           // Heading tag found, handle it differently
  //           return buildHeading(element);
  //         } else {
  //           // Regular paragraph
  //           return buildParagraph(element);
  //         }
  //       }).toList(),
  //     ),
  //   );
  // }

  // Widget buildHeading(String heading) {
  //   // Remove HTML tags
  //   String plainText = heading.replaceAll(RegExp(r'<[^>]*>'), '');

  //   // Adjust the heading style based on the heading level
  //   TextStyle headingStyle;
  //   if (heading.contains(RegExp(r'<h[1][^>]*>'))) {
  //     headingStyle =
  //         const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold);
  //   } else if (heading.contains(RegExp(r'<h[2][^>]*>'))) {
  //     headingStyle =
  //         const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold);
  //   } else if (heading.contains(RegExp(r'<h[3][^>]*>'))) {
  //     headingStyle =
  //         const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold);
  //   } else if (heading.contains(RegExp(r'<h[4][^>]*>'))) {
  //     headingStyle =
  //         const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  //   } else if (heading.contains(RegExp(r'<h[5][^>]*>'))) {
  //     headingStyle =
  //         const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  //   } else if (heading.contains(RegExp(r'<h[6][^>]*>'))) {
  //     headingStyle =
  //         const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
  //   } else {
  //     headingStyle = const TextStyle(
  //         fontSize: 16.0); // Default style for unrecognized headings
  //   }
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Text(
  //       plainText,
  //       style: headingStyle,
  //     ),
  //   );
  // }

  // Widget buildParagraph(String paragraph) {
  //   // Remove HTML tags
  //   String plainText = paragraph.replaceAll(RegExp(r'<[^>]*>'), '');

  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Text(
  //       plainText,
  //       style: const TextStyle(fontSize: 16.0),
  //     ),
  //   );
  // }
}
