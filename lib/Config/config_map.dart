enum HeadingType { h1, h2, h3, h4, h5, h6 }

class ConfigMap {
  static final ConfigMap _singleton = ConfigMap._internal();
  late double _fontSize;

  factory ConfigMap() {
    return _singleton;
  }

  ConfigMap._internal() {
    _fontSize = 16.0;
  }

  double get fontSize => _fontSize;

  void setFontSize(double size) {
    _fontSize = size;
  }

  double getParagraphFontSize() {
    switch (_fontSize) {
      case 14.0:
        return 14.0;
      case 16.0:
        return 16.0;
      case 18.0:
        return 18.0;
      default:
        return 16.0; // Default to 16.0 if fontSize is not one of the specified values
    }
  }

  double getHeadingFontSize(HeadingType type) {
    switch (_fontSize) {
      case 14.0:
        return _getHeadingFontSizeFor14px(type);
      case 16.0:
        return _getHeadingFontSizeFor16px(type);
      case 18.0:
        return _getHeadingFontSizeFor18px(type);
      default:
        return _getHeadingFontSizeFor16px(
            type); // Default to 16.0 if fontSize is not one of the specified values
    }
  }

  double _getHeadingFontSizeFor14px(HeadingType type) {
    switch (type) {
      case HeadingType.h1:
        return 30.0;
      case HeadingType.h2:
        return 26.0;
      case HeadingType.h3:
        return 22.0;
      case HeadingType.h4:
        return 18.0;
      case HeadingType.h5:
        return 16.0;
      case HeadingType.h6:
        return 14.0;
    }
  }

  double _getHeadingFontSizeFor16px(HeadingType type) {
    switch (type) {
      case HeadingType.h1:
        return 32.0;
      case HeadingType.h2:
        return 28.0;
      case HeadingType.h3:
        return 24.0;
      case HeadingType.h4:
        return 20.0;
      case HeadingType.h5:
        return 18.0;
      case HeadingType.h6:
        return 16.0;
    }
  }

  double _getHeadingFontSizeFor18px(HeadingType type) {
    switch (type) {
      case HeadingType.h1:
        return 34.0;
      case HeadingType.h2:
        return 30.0;
      case HeadingType.h3:
        return 26.0;
      case HeadingType.h4:
        return 22.0;
      case HeadingType.h5:
        return 20.0;
      case HeadingType.h6:
        return 18.0;
    }
  }
}
