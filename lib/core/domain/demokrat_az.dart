class NewsSite {
  static const String demokratAZ = 'https://demokrat.az/az/menu/';

  static Uri pageUrl(String category) {
    return Uri.parse(demokratAZ + category);
  }
}
