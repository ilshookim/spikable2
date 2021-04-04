import 'ui.dart';

class AppLocale extends Translations {
  static final Map<String, String> enUS = {
    'hello': 'Hello!',
  };

  static final Map<String, String> koKR = {
    'hello': '안녕!',
  };

  static final Locale defaultLocale = supportLocales[0];
  static final Locale fallbackLocale = supportLocales[1];
  static final supportLanguages = [
    'English',
    '한국어',
  ];
  static final supportLocales = [
    Locale('ko', 'KR'),
    Locale('en', 'US'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'ko_KR': koKR,
  };

  void changeLocale(String language) {
    final locale = localeFromLanguage(language);
    Get.updateLocale(locale);
  }

  Locale localeFromLanguage(String language) {
    for (int i = 0; i < supportLanguages.length; i++) {
      if (language == supportLanguages[i]) return supportLocales[i];
    }
    return Get.deviceLocale!;
  }
}
