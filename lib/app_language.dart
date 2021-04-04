import 'lang/ko_KR.dart';
import 'lang/en_US.dart';
import 'app.dart';

class Language extends Translations {
  static final Locale defaultLocale = supportLocales[0];
  static final Locale fallbackLocale = supportLocales[1];
  static final supportLanguages = [
    Global.english,
    Global.korean,
  ];
  static final supportLocales = [
    Locale(Global.ko, Global.KR),
    Locale(Global.en, Global.US),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
    '${Global.en}_${Global.US}': enUS,
    '${Global.ko}_${Global.KR}': koKR,
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
