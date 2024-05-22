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
/* This is initially copied from https://docs.flutter.dev/ui/layout/tutorial
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.descriptionKey,
  });

  final String descriptionKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        translate(descriptionKey),
        softWrap: true,
      ),
    );
  }
}
