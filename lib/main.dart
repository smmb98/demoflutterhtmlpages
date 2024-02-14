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
      '''<h1 style="color: rgba(0, 0, 0, 0.87); text-align: start;">The Grim Reaper</h1><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">Once upon a time, in a realm shrouded in darkness, there&nbsp;<span style="font-weight: bolder;">dwelled</span>&nbsp;a fearsome and enigmatic figure known as&nbsp;<i>the Grim Reaper</i>.</p><h2 style="color: rgba(0, 0, 0, 0.87); letter-spacing: 0.25px; text-align: start;">The Solitary Guardian of Souls</h2><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">Beneath a cloak of ebony, with skeletal hands and a face concealed by shadows, the Grim Reaper existed as the eternal master of death. Tasked with harvesting the souls of the departed, this spectral being held a significant role in the balance between life and the great unknown.</p><h3 style="color: rgba(0, 0, 0, 0.87); text-align: start;">A Life of Intrigue</h3><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">From the dawn of time, the Grim Reaper wandered through the mortal realm, invisible to the living. Legends whispered of sightings during the witching hour, when the moon draped the world in an otherworldly glow.</p><h3 style="color: rgba(0, 0, 0, 0.87); text-align: start;">The Harvest of Souls</h3><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">With each soul whose time had come, the Grim Reaper would appear before them, wielding a scythe that shimmered with an ethereal aura. A single stroke from this mystic weapon severed the ties of life, setting the souls free from their earthly shackles.</p><h2 style="color: rgba(0, 0, 0, 0.87); letter-spacing: 0.25px; text-align: start;">The Weight of Existence</h2><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">The burden of taking lives weighed heavily upon the Grim Reaper's bony shoulders. Constantly surrounded by the sorrow and grief of the bereaved, this dark entity yearned for solace and redemption, ever questioning the purpose of its existence.</p><h1 style="color: rgba(0, 0, 0, 0.87); text-align: start;">The Light of Compassion</h1><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">Through countless aeons of performing its mournful duty, the Grim Reaper began to perceive the sorrowful beauty hidden within mortality. With a heart as cold as ice beginning to thaw, the Reaper's touch grew gentle, its presence becoming a bittersweet comfort in the final moments.</p><h2 style="color: rgba(0, 0, 0, 0.87); letter-spacing: 0.25px; text-align: start;">A Neverending Cycle</h2><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">As the sun sets, and darkness blankets the land, the Grim Reaper continues to roam, embracing the eternal dance between life and death. Forever bound to its duty, the Reaper perseveres, hoping to offer solace and ease the transition into the great beyond.</p>''';
  // '''<h1 style="color: rgba(0, 0, 0, 0.87); text-align: start;">The Grim Reaper</h1><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">Once upon a time, <i>italic <b>bold</b></i>, <i><b>italic and bold,</b></i>  <b><i>bold and italic,</i></b> <b>bold,</b> <i>italic,</i> in a realm shrouded in darkness, there&nbsp;<span style="font-weight: bolder;">dwelled</span>&nbsp;a fearsome and enigmatic figure known as&nbsp;<i>the <b>Grim Reaper</b></i> <b><i>asd</i></b> <b>asd</b> <i>asd</i>.</p>''';

  // <h2 style="color: rgba(0, 0, 0, 0.87); letter-spacing: 0.25px; text-align: start;">The Solitary Guardian of Souls</h2><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">Beneath a cloak of ebony, with skeletal hands and a face concealed by shadows, the Grim Reaper existed as the eternal master of death. Tasked with harvesting the souls of the departed, this spectral being held a significant role in the balance between life and the great unknown.</p><h3 style="color: rgba(0, 0, 0, 0.87); text-align: start;">A Life of Intrigue</h3><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">From the dawn of time, the Grim Reaper wandered through the mortal realm, invisible to the living. Legends whispered of sightings during the witching hour, when the moon draped the world in an otherworldly glow.</p><h3 style="color: rgba(0, 0, 0, 0.87); text-align: start;">The Harvest of Souls</h3><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">With each soul whose time had come, the Grim Reaper would appear before them, wielding a scythe that shimmered with an ethereal aura. A single stroke from this mystic weapon severed the ties of life, setting the souls free from their earthly shackles.</p><h2 style="color: rgba(0, 0, 0, 0.87); letter-spacing: 0.25px; text-align: start;">The Weight of Existence</h2><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">The burden of taking lives weighed heavily upon the Grim Reaper's bony shoulders. Constantly surrounded by the sorrow and grief of the bereaved, this dark entity yearned for solace and redemption, ever questioning the purpose of its existence.</p><h1 style="color: rgba(0, 0, 0, 0.87); text-align: start;">The Light of Compassion</h1><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">Through countless aeons of performing its mournful duty, the Grim Reaper began to perceive the sorrowful beauty hidden within mortality. With a heart as cold as ice beginning to thaw, the Reaper's touch grew gentle, its presence becoming a bittersweet comfort in the final moments.</p><h2 style="color: rgba(0, 0, 0, 0.87); letter-spacing: 0.25px; text-align: start;">A Neverending Cycle</h2><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">As the sun sets, and darkness blankets the land, the Grim Reaper continues to roam, embracing the eternal dance between life and death. Forever bound to its duty, the Reaper perseveres, hoping to offer solace and ease the transition into the great beyond.</p>''';

  // '''<h1>My Home Page asda</h1><h2>My Home Page asda</h1><h3>My Home Page asda</h3><h4>My Home Page asda</h4><h5>My Home Page asda</h5><h6>My Home Page asda</h6>''';
  // '''<h2>My Home Page asda asdd assd asdad</h2><h2>My Home Page asda asdd assd asdad</h2><h1>My Home Page asda asdd assd asdad</h1><h1>My Home Page asdaasda asdd assd asdad</h1><h1>My Home Page asdaasda asdd assd asdad</h1><h1>My Home Page asdaasda asdd assd asdad</h1><h1>My Home Page asda asda asdd assd asdad</h1><h1>My Home Page asdaasda asdd assd asdad</h1><h1>My Home Page asdaasda asdd assd asdad</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1><h1>My Home Page asda</h1>''';

  // final String htmlData =
  // '''<p> In a distant galaxy, cat  asdasd dasd asda asdas asdzx</p>''';
  // final String htmlData =
  // '''<p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p><p> In a distant galaxy, cat  asdasd </p>''';
  // final String htmlData =
  // '''<p> In a distant galaxy, cat  asdasd  asdas asdsad adasd asdasdasd asdd asdasd asd asd adas asd</p>''';
  // '''<p> In a distant  asdad asds das dd sd asd ad sd sdasdasd asdasdas asdasd  asdasdas asdasdas asdds  asdasdsd asdasdasd asdasdasd asdasdasdasd asdasd asdasd asdasdasdas asdasdas asdasd as dasd asaddas asdas dasdas asdasdasd asdas asdasdasd asdas asdasdasd asd asdsdad asds asdasdad asdasd adasd asdasd  asdadsdasd asdasd asdasdasd asdzcxc zxcz zxc zxcxczxc zxczx zxczxczzx zxczx xczxcczx zxczxc zxczxc zxczxc zxczxczxc qwzx gfh fghfgh fgh fghfgh ghfgh fhfghfgh fghfgh gfhfgh fghfghf fghgfh fghfh fghfghfgh adasd asdasd zxc asdasd zxczxcas dasd zxc asqwdas dadas asdas zxczxc asdasd zxcxcsadad xczxasd asdasdzxc zxcasd zxczxc asd zxczxad daeqeasd asdasdzxczxx asdsadwqe zxcadadw zxcxz weqwewewq zxcadad xcxzcefds adfasd zxcadad zxczxc adwe zxczx asdwe czxc awdqwe zxczx asd zxcx adawe zxczxc asdqasd zxczxcadwqe In a distant  asdad asds das dd sd asd ad sd sdasdasd asdasdas asdasd  asdasdas asdasdas asdds  asdasdsd asdasdasd asdasdasd asdasdasdasd asdasd asdasd asdasdasdas asdasdas asdasd as dasd asaddas asdas dasdas asdasdasd asdas asdasdasd asdas asdasdasd asd asdsdad asds asdasdad asdasd adasd asdasd  asdadsdasd asdasd asdasdasd asdzcxc zxcz zxc zxcxczxc zxczx zxczxczzx zxczx xczxcczx zxczxc zxczxc zxczxc zxczxczxc qwzx gfh fghfgh fgh fghfgh ghfgh fhfghfgh fghfgh gfhfgh fghfghf fghgfh fghfh fghfghfgh adasd asdasd zxc asdasd zxczxcas dasd zxc asqwdas dadas asdas zxczxc asdasd zxcxcsadad xczxasd asdasdzxc zxcasd zxczxc asd zxczxad daeqeasd asdasdzxczxx asdsadwqe zxcadadw zxcxz weqwewewq zxcadad xcxzcefds adfasd zxcadad zxczxc adwe zxczx asdwe czxc''';
  // '''<p> In a distant galaxy, there existed a planet named Lumaria. On Lumaria, a young scientist named Stella devoted her days to studying the mesmerizing glowberries that lit up the night sky. </p>''';
  // final String htmlData =
  //     '''<p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> In a distant galaxy, there existed a planet named Lumaria. On Lumaria, a young scientist named Stella devoted her days to studying the mesmerizing glowberries that lit up the night sky. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> One evening, while conducting an experiment, Stella accidentally created a portal to a parallel universe. Through the shimmering portal, she glimpsed a world filled with breathtaking landscapes and mysterious creatures. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> Intrigued, Stella stepped through the portal and found herself in the Enchanted Realm. The air was filled with magic, and the trees whispered ancient secrets. Determined to learn more, Stella embarked on a quest to unravel the mysteries of this mystical realm. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> Along her journey, Stella encountered a wise old wizard who offered guidance. He revealed that Lumaria and the Enchanted Realm were connected by a delicate balance of cosmic energies. Stella's experiment had disrupted this balance, and now she held the key to restoring harmony. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> Armed with newfound knowledge, Stella set out to collect essence crystals scattered across the Enchanted Realm. Each crystal held a unique power that, when combined, could mend the fabric of the cosmic balance. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> As Stella gathered the essence crystals, she encountered challenges and made allies among mythical creatures. A mischievous pixie guided her through the Whispering Woods, and a gentle dragon provided her with safe passage across the Crystal Lake. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> With each crystal she collected, the Enchanted Realm sparkled with renewed vitality. The once-fading glow of the glowberries regained its brilliance, casting a magical radiance across the entire realm. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> Finally, as Stella placed the last essence crystal into the cosmic altar, a surge of energy rippled through the air. Lumaria and the Enchanted Realm realigned, restoring the delicate balance that bound the two worlds together. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> Grateful for Stella's efforts, the enchanted creatures of the realm gathered to bid her farewell. With a heart full of gratitude, Stella stepped back through the portal, returning to her home on Lumaria. </p><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif"> From that day on, Stella continued her scientific pursuits, forever cherishing the memories of the Enchanted Realm and the cosmic adventure that bridged two worlds. </p>''';
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
