import 'dart:ui';

import 'package:get/get.dart';
import 'package:ionmobile/localizations/id_ID.dart';

import 'en_US.dart';

class LocalizationService extends Translations {
  LocalizationService();
  static const fallbackLocale = Locale('en', 'US');

  static const listLocaleSupport = [Locale('en', 'US'), Locale('id', 'ID')];

  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale);
  }

  static Locale _getLocaleFromLanguage({String langCode = 'en'}) {
    Locale locale = fallbackLocale;
    switch (langCode) {
      case 'en':
        locale = const Locale('en', 'US');
        break;
      case 'in':
        locale = const Locale('id', 'ID');
        break;
    }
    return locale;
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'id_ID': idID,
      };
}
