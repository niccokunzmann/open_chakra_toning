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
 * This is the about page.
 * See https://pub.dev/documentation/flutter_about_page/latest/
 */

import "package:flutter/material.dart";
import "package:open_chakra_toning/ui/widgets/app_bar.dart";

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder.buildAppBar(context, [], back: true),
      body: Text("test"),
    );
  }

  static AppMenuItem getMenuItem() {
    return AppMenuItem("menu.about", (BuildContext context) {
      // push the new page
      // see https://blog.logrocket.com/flutter-appbar-tutorial/
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AboutPage();
      }));
    });
  }
}
