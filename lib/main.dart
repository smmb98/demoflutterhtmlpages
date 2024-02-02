import 'package:demohtmlpages/services/html_parser.dart';
import 'package:flutter/material.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

double fontSize = 16.0;

class MyHomePageState extends State<MyHomePage> {
  final String htmlData =
      '''<p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> In a distant galaxy, there existed a planet named Lumaria. On Lumaria, a young scientist named Stella devoted her days to studying the mesmerizing glowberries that lit up the night sky. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> One evening, while conducting an experiment, Stella accidentally created a portal to a parallel universe. Through the shimmering portal, she glimpsed a world filled with breathtaking landscapes and mysterious creatures. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> Intrigued, Stella stepped through the portal and found herself in the Enchanted Realm. The air was filled with magic, and the trees whispered ancient secrets. Determined to learn more, Stella embarked on a quest to unravel the mysteries of this mystical realm. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> Along her journey, Stella encountered a wise old wizard who offered guidance. He revealed that Lumaria and the Enchanted Realm were connected by a delicate balance of cosmic energies. Stella's experiment had disrupted this balance, and now she held the key to restoring harmony. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> Armed with newfound knowledge, Stella set out to collect essence crystals scattered across the Enchanted Realm. Each crystal held a unique power that, when combined, could mend the fabric of the cosmic balance. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> As Stella gathered the essence crystals, she encountered challenges and made allies among mythical creatures. A mischievous pixie guided her through the Whispering Woods, and a gentle dragon provided her with safe passage across the Crystal Lake. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> With each crystal she collected, the Enchanted Realm sparkled with renewed vitality. The once-fading glow of the glowberries regained its brilliance, casting a magical radiance across the entire realm. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> Finally, as Stella placed the last essence crystal into the cosmic altar, a surge of energy rippled through the air. Lumaria and the Enchanted Realm realigned, restoring the delicate balance that bound the two worlds together. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> Grateful for Stella's efforts, the enchanted creatures of the realm gathered to bid her farewell. With a heart full of gratitude, Stella stepped back through the portal, returning to her home on Lumaria. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> From that day on, Stella continued her scientific pursuits, forever cherishing the memories of the Enchanted Realm and the cosmic adventure that bridged two worlds. </p>''';
  List<List<String>> pages = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<List<String>> pages = parseHTML(htmlData, context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal Paginated HTML'),
        actions: [
          PopupMenuButton<double>(
            onSelected: (value) {
              setState(() {
                fontSize = value;
              });
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 14.0,
                  child: Text('Font Size: 14'),
                ),
                const PopupMenuItem(
                  value: 16.0,
                  child: Text('Font Size: 16'),
                ),
                const PopupMenuItem(
                  value: 18.0,
                  child: Text('Font Size: 18'),
                ),
              ];
            },
          ),
        ],
      ),
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return buildPage(pages[index]);
        },
      ),
    );
  }
}
