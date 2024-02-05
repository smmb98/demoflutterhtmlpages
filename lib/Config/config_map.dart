import 'config_map_interface.dart';

class ConfigMap {
  static final Map<double, ConfigMapInterface> defaultConfig = {
    14.0: ConfigMapInterface(
      paragraphFontSize: 14.0,
      paragraphLineHeight: 16.0,
    ),
    16.0: ConfigMapInterface(
      paragraphFontSize: 16.0,
      paragraphLineHeight: 19.0,
    ),
    18.0: ConfigMapInterface(
      paragraphFontSize: 18.0,
      paragraphLineHeight: 21.0,
    ),
    // Add more entries for other font sizes
  };
  static Map<double, ConfigMapInterface> config = {
    14.0: ConfigMapInterface(
      paragraphFontSize: 14.0,
      paragraphLineHeight: 16.0,
    ),
    16.0: ConfigMapInterface(
      paragraphFontSize: 16.0,
      paragraphLineHeight: 19.0,
    ),
    18.0: ConfigMapInterface(
      paragraphFontSize: 18.0,
      paragraphLineHeight: 21.0,
    ),
    // Add more entries for other font sizes
  };
}
