class ConfigMapInterface {
  double paragraphFontSize = 16.0;
  double paragraphLineHeight = 19.0;

  // Variables for heading 1 to 6
  double heading1FontSize = 32.0;
  double heading1LineHeight = 38.0;

  double heading2FontSize = 28.0;
  double heading2LineHeight = 28.0;

  double heading3FontSize = 24.0;
  double heading3LineHeight = 26.0;

  double heading4FontSize = 20.0;
  double heading4LineHeight = 24.0;

  double heading5FontSize = 18.0;
  double heading5LineHeight = 22.0;

  double heading6FontSize = 16.0;
  double heading6LineHeight = 20.0;

  ConfigMapInterface({
    required this.paragraphFontSize,
    required this.paragraphLineHeight,
    required this.heading1FontSize,
    required this.heading1LineHeight,
    required this.heading2FontSize,
    required this.heading2LineHeight,
    required this.heading3FontSize,
    required this.heading3LineHeight,
    required this.heading4FontSize,
    required this.heading4LineHeight,
    required this.heading5FontSize,
    required this.heading5LineHeight,
    required this.heading6FontSize,
    required this.heading6LineHeight,
  });
}
