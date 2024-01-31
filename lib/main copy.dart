// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;

// import 'package:flutter_html/flutter_html.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final GlobalKey _htmlKey = GlobalKey();

//   double appBarHeight = 0.1; // 10% from the top

//   @override
//   Widget build(BuildContext context) {
//     // Measure screen size
//     double screenHeight =
//         ui.window.physicalSize.height / ui.window.devicePixelRatio;
//     print("screenHeight");
//     print(screenHeight);
//     print("\n");
//     double screenWidth =
//         ui.window.physicalSize.width / ui.window.devicePixelRatio;
//     print("screenWidth");
//     print(screenWidth);
//     print("\n");

//     // Calculate available height for content
//     double availableHeight = screenHeight - (appBarHeight * screenHeight);
//     print("availableHeight");
//     print(availableHeight);
//     print("\n");

//     // TODO: Add your HTML paragraphs dynamically
//     String htmlContent =
//         "<p>This is the first paragraph. It's quite long, but should still fit on the first page.</p><p>This is the second paragraph. It's a bit shorter than the first.</p><p>This is the third paragraph. It's even shorter, but still relevant.</p><p>This is the fourth paragraph. This pushes us closer to the page limit.</p><p>This is the fifth paragraph. We'll see if it goes to the next page.</p><p>This is the sixth paragraph. And now we're definitely on the second page.</p>";

//     // TODO: Split HTML content into paragraphs
//     List<String> paragraphs =
//         htmlContent.split("<p>").map((e) => "<p>$e").toList();
//     print("paragraphs");
//     print(paragraphs.toString());
//     print("\n");

//     // TODO: Create 2D array for pages and distribute paragraphs
//     List<List<String>> pages =
//         distributeParagraphs(paragraphs, availableHeight);
//     print("pages");
//     print(pages.toString());
//     print("\n");

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HTML Paragraphs'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             for (List<String> page in pages)
//               Container(
//                 height: availableHeight,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     for (String paragraph in page)
//                       // Render paragraphs using flutter_html package
//                       Html(data: paragraph),
//                     SizedBox(height: 20.0), // Add space between paragraphs
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   List<List<String>> distributeParagraphs(
//       List<String> paragraphs, double availableHeight) {
//     List<List<String>> pages = [];
//     List<String> currentPage = [];
//     double currentPageHeight = 0.0;

//     for (String paragraph in paragraphs) {
//       // TODO: Render paragraphs as widgets (you can use Html package) to get the height
//       double paragraphHeight = calculateParagraphHeight(paragraph);

//       // Check if the paragraph can fit in the current page
//       if (currentPageHeight + paragraphHeight <= availableHeight) {
//         currentPage.add(paragraph);
//         currentPageHeight += paragraphHeight;
//       } else {
//         // Move to the next page
//         pages.add(currentPage);
//         currentPage = [paragraph];
//         currentPageHeight = paragraphHeight;
//       }
//     }

//     // Add the last page if it's not empty
//     if (currentPage.isNotEmpty) {
//       pages.add(currentPage);
//     }

//     return pages;
//   }

// // TODO: Implement the function to calculate the height of a paragraph
//   double calculateParagraphHeight(String paragraph) {
//     final htmlWidget = Html(key: _htmlKey, data: paragraph);

//     // Build the widget and force it to layout
//     final RenderBox renderBox =
//         _htmlKey.currentContext!.findRenderObject()! as RenderBox;
//     renderBox.layout(BoxConstraints(maxWidth: double.infinity));
//     // Return a placeholder height for now, you can replace this with the actual value
//     return 30.0;
//   }
// }
