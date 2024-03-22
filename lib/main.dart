import 'package:demohtmlpages/Config/config_map.dart';
import 'package:demohtmlpages/scroll_behavior.dart';
import 'package:demohtmlpages/services/html_parser.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey _pageViewKey = GlobalKey();

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

class MyHomePageState extends State<MyHomePage> {
  final String htmlData =
      // '''<h1>The Mysterious Adventures of Pink Panther</h1><p><img src="http://54.80.143.7/images/image-1711002483953-183249048.jpg" data-media-width="1280" data-media-height="720" style="display: block; margin-left: auto; margin-right: auto; width: 100%; height: auto;"></p><p><img src="http://54.80.143.7/images/image-1711002484159-987337610.jpg" data-media-width="720" data-media-height="1280" style="display: block; margin-left: auto; margin-right: auto; width: 100%; height: auto;"></p><p>dummy text</p><p>Chapter 1</p><p>As the sun rose over the bustling city of Paris, a mysterious figure in a pink suit prowled the streets. With a sly grin on his face, the Pink Panther was on the hunt for his next thrilling adventure.</p><p>Chapter 2</p><p>With a twinkle in his eye, the Pink Panther strolled through the Louvre, admiring the priceless works of art. But he wasn't just there for sightseeing. Hidden among the masterpieces was a clue to a long-lost treasure.</p><p><br></p><p>Chapter 3</p><p>Following the cryptic clues, the Pink Panther found himself on a daring chase through the streets of Paris. From the rooftops to the underground catacombs, he used all his cunning and wit to outsmart his adversaries.</p><p>Chapter 4</p><p>But danger lurked around every corner, and the Pink Panther soon found himself face to face with his arch-nemesis, the crafty Inspector Clouseau. With the treasure within reach, would the Pink Panther be able to escape unscathed?</p><p></p><h1>The Pink Panther Strikes Again</h1><p></p><p>Chapter 1</p><p>After the thrilling escapade in Paris, the Pink Panther set his sights on a new challenge. This time, he found himself in the exotic streets of Morocco, where a priceless jewel was said to be hidden.</p><p>Chapter 2</p><p>With the sun beating down on him, the Pink Panther navigated the bustling markets and winding alleyways of Marrakech. As he pieced together the clues, he realized that he wasn't the only one after the jewel.</p><p>Chapter 3</p><p>A band of ruthless thieves were hot on his trail, and the Pink Panther knew he had to act fast. With the help of his loyal sidekick, the bumbling Inspector Clouseau, he set out to retrieve the jewel and outwit the thieves once and for all.</p><p>Chapter 4</p><p>As the sun set over the desert, the Pink Panther stood victorious, the jewel gleaming in his hand. With a mischievous smile, he disappeared into the night, ready for his next great adventure.</p>''';
      // '''<h1>The Mysterious Adventures of Pink Panther</h1><p><img src="http://54.80.143.7/images/image-1709810989811-543541795.jpg" data-media-width="770" data-media-height="500" style="display: block; margin-left: auto; margin-right: auto; width: 100%; height: auto;"></p><p><video src="http://54.80.143.7/videos/video-1710850736835-976253624.mp4" data-media-width="720" data-media-height="1280" controls="" style="display: block; margin-left: auto; margin-right: auto; width: 50%;">l</video></p><p>Chapter 1</p><p>As the sun rose over the bustling city of Paris, a mysterious figure in a pink suit prowled the streets. With a sly grin on his face, the Pink Panther was on the hunt for his next thrilling adventure.</p><p>Chapter 2</p><p>With a twinkle in his eye, the Pink Panther strolled through the Louvre, admiring the priceless works of art. But he wasn't just there for sightseeing. Hidden among the masterpieces was a clue to a long-lost treasure.</p><p><br></p><p>Chapter 3</p><p>Following the cryptic clues, the Pink Panther found himself on a daring chase through the streets of Paris. From the rooftops to the underground catacombs, he used all his cunning and wit to outsmart his adversaries.</p><p>Chapter 4</p><p>But danger lurked around every corner, and the Pink Panther soon found himself face to face with his arch-nemesis, the crafty Inspector Clouseau. With the treasure within reach, would the Pink Panther be able to escape unscathed?</p><p></p><h1>The Pink Panther Strikes Again</h1><p></p><p>Chapter 1</p><p>After the thrilling escapade in Paris, the Pink Panther set his sights on a new challenge. This time, he found himself in the exotic streets of Morocco, where a priceless jewel was said to be hidden.</p><p>Chapter 2</p><p>With the sun beating down on him, the Pink Panther navigated the bustling markets and winding alleyways of Marrakech. As he pieced together the clues, he realized that he wasn't the only one after the jewel.</p><p>Chapter 3</p><p>A band of ruthless thieves were hot on his trail, and the Pink Panther knew he had to act fast. With the help of his loyal sidekick, the bumbling Inspector Clouseau, he set out to retrieve the jewel and outwit the thieves once and for all.</p><p>Chapter 4</p><p>As the sun set over the desert, the Pink Panther stood victorious, the jewel gleaming in his hand. With a mischievous smile, he disappeared into the night, ready for his next great adventure.</p>''';
      '''<h1>The Rise of AI Models</h1><p>In the fast-paced world of technology, Artificial Intelligence (AI) has become a prominent force, revolutionizing various industries and changing the way we live our lives. One of the most fascinating aspects of AI is the development of AI models, which have the ability to learn from data and make predictions or decisions based on that data.</p><p><br></p><p><img src="http://54.80.143.7/images/image-1710850516138-725050606.jpg" data-media-width="5000" data-media-height="5000" style="display: block; margin-left: auto; margin-right: auto; width: 100%; height: auto;"></p><h2>Understanding AI Models</h2><p>AI models are mathematical algorithms that are trained on large datasets to identify patterns and make predictions. These models use techniques such as machine learning and neural networks to process data and make decisions without being explicitly programmed to do so. This ability to learn and adapt makes AI models incredibly powerful tools in fields such as healthcare, finance, and transportation.</p><p><br></p><p><img src="http://54.80.143.7/images/image-1711025654992-223030915.jpg" data-media-width="232" data-media-height="130" style="display: block; margin-left: auto; margin-right: auto; width: 100%; height: auto;"></p><h2>The Advancements in AI Models</h2><p>Over the years, AI models have made significant advancements, with researchers continuously pushing the boundaries of what AI can achieve. From image recognition and natural language processing to autonomous vehicles and personalized recommendations, AI models are being utilized in a wide range of applications, improving efficiency and accuracy in various tasks.</p><h2>The Impact of AI Models</h2><p>The widespread adoption of AI models has had a profound impact on society, leading to increased automation, enhanced decision-making, and improved outcomes in numerous areas. However, with this progress comes ethical considerations, as the use of AI models raises questions about privacy, bias, and accountability.<br><br></p><p><video src="http://54.80.143.7/videos/video-1711025674138-747123775.mp4" controls data-media-width="640" data-media-height="360" style="display: block; margin-left: auto; margin-right: auto; width: 100%; height: auto;">Your browser does not support the video tag.</video></p><h2>The Future of AI Models</h2><p>As technology continues to evolve, the future of AI models looks promising, with the potential to further revolutionize industries and improve the quality of life for people around the world. From predictive analytics and personalized medicine to smart cities and environmental sustainability, the possibilities are endless with AI models leading the way.<br></br><p><video src="http://54.80.143.7/videos/video-1710850736835-976253624.mp4" controls data-media-width="720" data-media-height="1280" style="display: block; margin-left: auto; margin-right: auto; width: 100%; height: auto;">Your browser does not support the video tag.</video></p><h2>Conclusion</h2><p>In conclusion, AI models are powerful tools that have the potential to reshape the way we work, live, and interact with the world around us. By harnessing the capabilities of AI models, we can unlock new opportunities, solve complex problems, and create a brighter future for generations to come.</p>''';
  // '''<h1 style="color: rgba(0, 0, 0, 0.87); text-align: start;">The Grim Reaper</h1><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">Once upon a time, in a realm shrouded in darkness, there&nbsp;<span style="font-weight: bolder;">dwelled</span>&nbsp;a fearsome and enigmatic figure known as&nbsp;<i>the Grim Reaper</i>.</p><h2 style="color: rgba(0, 0, 0, 0.87); letter-spacing: 0.25px; text-align: start;">The Solitary Guardian of Souls</h2><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">Beneath a cloak of ebony, with skeletal hands and a face concealed by shadows, the Grim Reaper existed as the eternal master of death. Tasked with harvesting the souls of the departed, this spectral being held a significant role in the balance between life and the great unknown.</p><h3 style="color: rgba(0, 0, 0, 0.87); text-align: start;">A Life of Intrigue</h3><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">From the dawn of time, the Grim Reaper wandered through the mortal realm, invisible to the living. Legends whispered of sightings during the witching hour, when the moon draped the world in an otherworldly glow.</p><h3 style="color: rgba(0, 0, 0, 0.87); text-align: start;">The Harvest of Souls</h3><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">With each soul whose time had come, the Grim Reaper would appear before them, wielding a scythe that shimmered with an ethereal aura. A single stroke from this mystic weapon severed the ties of life, setting the souls free from their earthly shackles.</p><h2 style="color: rgba(0, 0, 0, 0.87); letter-spacing: 0.25px; text-align: start;">The Weight of Existence</h2><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">The burden of taking lives weighed heavily upon the <span>Grim Reaper\'s bony</span> shoulders. Constantly surrounded by the <i><b>sorrow</b></i> and grief of the bereaved, this dark <i>entity yearned for <b>solace and</b> redemption</i>, ever questioning the purpose of its existence.</p><h1 style="color: rgba(0, 0, 0, 0.87); text-align: start;">The Light of Compassion</h1><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">Through countless aeons of performing its mournful duty, the Grim Reaper began to perceive the sorrowful beauty hidden within mortality. With a heart as cold as ice beginning to thaw, the Reaper's touch grew gentle, its presence becoming a bittersweet comfort in the final moments.</p><h2 style="color: rgba(0, 0, 0, 0.87); letter-spacing: 0.25px; text-align: start;">A Neverending Cycle</h2><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">As the sun sets, and darkness blankets the land, the Grim Reaper continues to roam, embracing the eternal dance between life and death. Forever bound to its duty, the Reaper perseveres, hoping to offer solace and ease the transition into the great beyond1 great beyond2 great beyond3 great beyond4 great beyond5 great beyond6 great beyond7 great beyond8 great beyond9 great beyond10 great beyond11 great beyond12 great beyond13 great beyond14 great beyond15 great beyond16 great beyond17 great beyond18 great beyond19 great beyond20 great beyond21 great beyond22 great beyond23 great beyond24 great beyond25 great beyond26 great beyond27 great beyond28 great beyond29 great beyond30 great beyond31 great beyond32 great beyond33 great beyond34 great beyond35 great beyond36 great beyond37 great beyond38 great beyond39 great beyond40 great beyond41 great beyond42 great beyond43 great beyond44 great beyond45 great beyond46 great beyond47 great beyond48 great beyond49 great beyond50 great beyond51 great beyond52 great beyond53 great beyond54 great beyond55 great beyond56 great beyond57 great beyond58.</p>''';
  // '''<h1 style="color: rgba(0, 0, 0, 0.87); text-align: start;">The Grim Reaper</h1><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">Once upon a time, in a realm shrouded in darkness, there&nbsp;<span style="font-weight: bolder;">dwelled</span>&nbsp;a fearsome and enigmatic figure known as&nbsp;<i>the Grim Reaper</i>.</p><h2 style="color: rgba(0, 0, 0, 0.87); letter-spacing: 0.25px; text-align: start;">The Solitary Guardian of Souls</h2><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">Beneath a cloak of ebony, with skeletal hands and a face concealed by shadows, the Grim Reaper existed as the eternal master of death. Tasked with harvesting the souls of the departed, this spectral being held a significant role in the balance between life and the great unknown.</p><h3 style="color: rgba(0, 0, 0, 0.87); text-align: start;">A Life of Intrigue</h3><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">From the dawn of time, the Grim Reaper wandered through the mortal realm, invisible to the living. Legends whispered of sightings during the witching hour, when the moon draped the world in an otherworldly glow.</p><h3 style="color: rgba(0, 0, 0, 0.87); text-align: start;">The Harvest of Souls</h3><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">With each soul whose time had come, the Grim Reaper would appear before them, wielding a scythe that shimmered with an ethereal aura. A single stroke from this mystic weapon severed the ties of life, setting the souls free from their earthly shackles.</p><h2 style="color: rgba(0, 0, 0, 0.87); letter-spacing: 0.25px; text-align: start;">The Weight of Existence</h2><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">The burden of taking lives weighed heavily upon the Grim Reaper's bony shoulders. Constantly surrounded by the sorrow and grief of the bereaved, this dark entity yearned for solace and redemption, ever questioning the purpose of its existence.</p><h1 style="color: rgba(0, 0, 0, 0.87); text-align: start;">The Light of Compassion</h1><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">Through countless aeons of performing its mournful duty, the Grim Reaper began to perceive the sorrowful beauty hidden within mortality. With a heart as cold as ice beginning to thaw, the Reaper's touch grew gentle, its presence becoming a bittersweet comfort in the final moments.</p><h2 style="color: rgba(0, 0, 0, 0.87); letter-spacing: 0.25px; text-align: start;">A Neverending Cycle</h2><p style="color: rgba(0, 0, 0, 0.87); font-family: Roboto, sans-serif; text-align: start;">As the sun sets, and darkness blankets the land, the Grim Reaper continues to roam, embracing the eternal dance between life and death. Forever bound to its duty, the Reaper perseveres, hoping to offer solace and ease the transition into the great beyond.</p>''';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal Paginated HTML'),
        actions: [
          PopupMenuButton<double>(
            onSelected: (value) {
              setState(() {
                ConfigMap().setFontSize(value);
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          List<List<String>> pages =
              parseHTML(htmlData.replaceAllMapped(
      RegExp(r'<video\b[^>]*>'),
      (match) {
        var videoTag = match.group(0)!;
        return videoTag.replaceAll('controls', '');
      },
    ), constraints);

          return PageView.builder(
            key: _pageViewKey, // Assign the global key
            scrollBehavior: AppScrollBehavior(),
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return buildPage(pages[index], constraints);
            },
          );
        },
      ),
    );
  }

}
