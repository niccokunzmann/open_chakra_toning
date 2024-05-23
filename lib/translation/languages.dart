/*
    Open Chakra Toning
    Copyright (C) 2024  Nicco Kunzmann

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

import 'package:flutter_translate/flutter_translate.dart';
import 'package:open_chakra_toning/translation/translate_preferences.dart';

class Languages {
  /* This is the locale that is used as a base for translation. */
  String get fallbackLocale {
    return 'en';
  }

  /* This is the locale that is used to display the app when first started. */
  String get defaultLocale {
    return 'en';
  }

  /* This is a list of possible locales in assets/i18n */
  List<String> get locales {
    return ['en', 'de', 'it'];
  }

  Future<LocalizationDelegate> createLocalizationDelegate() {
    return LocalizationDelegate.create(
        fallbackLocale: fallbackLocale,
        supportedLocales: locales,
        preferences: TranslatePreferences(defaultLocale));
  }
}
