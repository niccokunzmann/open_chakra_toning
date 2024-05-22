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
/*
 * This page shows the chakra and information about it.
 */

import 'package:flutter/material.dart';
import 'package:open_chakra_toning/model/chakras.dart';
import 'package:open_chakra_toning/ui/widgets/app_bar.dart';
import 'package:open_chakra_toning/ui/widgets/button_with_text.dart';
import 'package:open_chakra_toning/ui/widgets/text_section.dart';

class ChakraView extends StatelessWidget {
  final Chakra chakra;
  ChakraView(this.chakra);

  @override
  Widget build(BuildContext context) {
    // inspiration taken from https://docs.flutter.dev/ui/layout/tutorial
    return Scaffold(
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                Expanded(
                  /*1*/
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*2*/
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          chakra.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "${chakra.frequency.toInt()}Hz",
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                /*3*/
                ButtonWithText(
                    color: Theme.of(context).primaryColor,
                    icon: Icons.play_arrow,
                    labelKey: "button.play"),
              ],
            ),
          ),
          TextSection(descriptionKey: "chakra.description.${chakra.id}")
        ])));
  }

  AppBar buildAppBar(BuildContext context) {
    var appBar = AppBarBuilder.buildAppBar(context, [],
        back: true, title: Text(chakra.name));
    return appBar;
  }
}
