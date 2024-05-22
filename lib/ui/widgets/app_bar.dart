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
import 'package:open_chakra_toning/config.dart';
import 'package:open_chakra_toning/ui/widgets/translated_text.dart';

class AppMenuItem {
  final String translationKey;
  final void Function(BuildContext context) onClick;

  AppMenuItem(this.translationKey, this.onClick);

  Widget getMenuWidget() {
    return TranslatedText(translationKey);
  }
}

class AppBarBuilder {
  static double get toolbarHeight => kToolbarHeight;

  static AppBar buildAppBar(BuildContext context, List<AppMenuItem> menuItems,
      {bool back = false, Widget? title}) {
    List<Widget> actions = [];
    if (menuItems.isNotEmpty) {
      actions.add(getMenuButton(context, menuItems));
    }
    Widget icon = back ? BackButton() : Config.getSVGIcon();
    return AppBar(
        leading: Padding(padding: EdgeInsets.only(left: 16.0), child: icon),
        titleSpacing: 0,
        // automaticallyImplyLeading: false,
        toolbarHeight: toolbarHeight,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: title ?? TranslatedText("app.title"),
        centerTitle: true,
        actions: actions);
  }

  static Widget getMenuButton(
      BuildContext context, List<AppMenuItem> menuItems) {
    return PopupMenuButton(
        // see https://www.fluttercampus.com/guide/223/popup-menu-on-flutter-appbar/
        itemBuilder: (context) {
      List<PopupMenuItem<Object>> menuItemWidgets = [];
      for (int i = 0; i < menuItems.length; i++) {
        menuItemWidgets.add(
          PopupMenuItem<int>(
            value: i,
            child: menuItems[i].getMenuWidget(),
          ),
        );
      }
      return menuItemWidgets;
    }, onSelected: (value) {
      menuItems[int.parse(value.toString())].onClick(context);
    });
  }
}
