import 'config_map_interface.dart';

class ConfigMap {
  static Map<double, ConfigMapInterface> defaultConfig = {
    14.0: ConfigMapInterface(
      paragraphFontSize: 14.0,
      paragraphLineHeight: 21.0,
      paragraphWordsPerLine: 11.0,
    ),
    16.0: ConfigMapInterface(
      paragraphFontSize: 16.0,
      paragraphLineHeight: 25.0,
      paragraphWordsPerLine: 10.0,
    ),
    18.0: ConfigMapInterface(
      paragraphFontSize: 18.0,
      paragraphLineHeight: 25.0,
      paragraphWordsPerLine: 8.0,
    ),
    // Add more entries for other font sizes
  };
  static Map<double, ConfigMapInterface> config = {
    14.0: ConfigMapInterface(
      paragraphFontSize: 14.0,
      paragraphLineHeight: 21.0,
      paragraphWordsPerLine: 12.0,
    ),
    16.0: ConfigMapInterface(
      paragraphFontSize: 16.0,
      paragraphLineHeight: 25.0,
      paragraphWordsPerLine: 10.0,
    ),
    18.0: ConfigMapInterface(
      paragraphFontSize: 18.0,
      paragraphLineHeight: 25.0,
      paragraphWordsPerLine: 8.0,
    ),
    // Add more entries for other font sizes
  };

  static adjustParagraphWordsPerLine(double screenWidth, double fontSize) {
    // int wordsPerLineAdjustment = 0;
    // int LineHeightAdjustment = 0;

    // if (screenWidth < 375) {
    //   wordsPerLineAdjustment = -1;
    //   LineHeightAdjustment = 3;
    // } else if (screenWidth < 425) {
    //   wordsPerLineAdjustment = 0;
    //   LineHeightAdjustment = 0;
    // } else if (screenWidth < 470) {
    //   wordsPerLineAdjustment = 1;
    //   LineHeightAdjustment = 1;
    // } else if (screenWidth < 530) {
    //   wordsPerLineAdjustment = 2;
    //   LineHeightAdjustment = 2;
    // } else if (screenWidth < 585) {
    //   wordsPerLineAdjustment = 3;
    //   LineHeightAdjustment = 3;
    // } else if (screenWidth < 635) {
    //   wordsPerLineAdjustment = 4;
    //   LineHeightAdjustment = 4;
    // } else if (screenWidth < 690) {
    //   wordsPerLineAdjustment = 5;
    //   LineHeightAdjustment = 5;
    // } else if (screenWidth < 740) {
    //   wordsPerLineAdjustment = 0;
    //   LineHeightAdjustment = 6;
    // } else if (screenWidth < 795) {
    //   wordsPerLineAdjustment = 7;
    //   LineHeightAdjustment = 7;
    // }

    // ConfigMap.config[fontSize]!.paragraphWordsPerLine =
    //     ConfigMap.defaultConfig[fontSize]!.paragraphWordsPerLine +
    //         wordsPerLineAdjustment;
    // ConfigMap.config[fontSize]!.paragraphLineHeight =
    //     ConfigMap.defaultConfig[fontSize]!.paragraphLineHeight +
    //         LineHeightAdjustment;

    //   print(
    //       "paragraphWordsPerLine ${ConfigMap.config[fontSize]!.paragraphWordsPerLine}");
    // }
  }
}
