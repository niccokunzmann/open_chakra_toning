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
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_chakra_toning/translated_text.dart';

class AppBarBuilder {
  static double get toolbarHeight => kToolbarHeight;

  static AppBar buildAppBar(BuildContext context) {
    return AppBar(
        leading: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: SvgPicture.asset(
              "assets/img/icon/icon.svg",
            )),
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: toolbarHeight,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: TranslatedText("app.title"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              // see https://www.fluttercampus.com/guide/223/popup-menu-on-flutter-appbar/
              itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: TranslatedText("menu.about"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {}
          }),
        ]);
  }
}
