import 'package:flutter_clean_coded/src/core/localization/languages/chinese_language.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_enums.dart';

AppLocale appDefaultLocale = AppLocale.english;

String getLocaleText(text) {
  if (appDefaultLocale == AppLocale.chinese) {
    text = getChineseLanguage(text);
  }
  return text;
}

// Create a lowercase version of the map for lookups
Map<String, String> lowercaseChineseTranslations = {
  for (var entry in chineseTranslations.entries)
    entry.key.toLowerCase(): entry.value
};

// Function to get the Chinese translation for a given key
String getChineseLanguage(String key) {
  String normalizedKey = key.toLowerCase();
  return lowercaseChineseTranslations[normalizedKey] ?? key;
}
