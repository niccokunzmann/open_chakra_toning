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

import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;

class Files {
  static List<String>? _files;

  static Future<List<String>> get files async {
    if (_files != null) {
      return _files!;
    }
    Map<String, List<String>> jsonFiles =
        json.decode((await rootBundle.loadString('AssetManifest.json')));
    _files = jsonFiles.keys.toList();
    return _files!;
  }

  static Future<List<String>> get languages async {
    RegExp jsonFileRegExp = RegExp(r"assets/i18n/[a-zA-Z_]+\.json\$");
    return (await files)
        .where((e) => jsonFileRegExp.matchAsPrefix(e) != null)
        .map((e) => path.basenameWithoutExtension(e))
        .toList();
  }
}
