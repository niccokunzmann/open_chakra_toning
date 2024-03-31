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
import "package:flutter/services.dart";
import "package:flutter_about_page/flutter_about_page.dart";
import "package:flutter_translate/flutter_translate.dart";
import "package:open_chakra_toning/config.dart";
import "package:open_chakra_toning/ui/widgets/app_bar.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AboutTheApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AboutPage ab = AboutPage();
    return Scaffold(
        appBar: AppBarBuilder.buildAppBar(context, [], back: true),
        body: ListView(
          children: [
            Container(
              height: 20,
            ),
            Image.asset(
              "assets/img/icon/icon-256.png",
              height: 120,
            ),
            Container(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  translate("about.description"),
                  textAlign: TextAlign.center,
                )),
            createLink("about.view-project", Config.viewProject,
                FontAwesomeIcons.github),
            createLink("about.report-issue", Config.reportIssues,
                FontAwesomeIcons.github),
            createLink("about.view-website", Config.viewWebsite,
                FontAwesomeIcons.globe),
          ],
        ));
  }

  static AppMenuItem getMenuItem() {
    return AppMenuItem("menu.about", (BuildContext context) {
      // push the new page
      // see https://blog.logrocket.com/flutter-appbar-tutorial/
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return AboutTheApp();
      }));
    });
  }

  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } /*else {
      try {
        Fluttertoast.showToast(
            msg: "Could not open $url",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      } on MissingPluginException catch (error) {
        print('MissingPluginException: $error');
      }
    }*/
  }

  createItemWidget(Widget image, String translationId) {
    // copied from https://github.com/npsulav/flutter_about_page
    // license: https://github.com/npsulav/flutter_about_page/blob/master/LICENSE
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 10),
      child: Row(
        children: [
          image,
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 10),
            child: Text(
              translate(translationId),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Widget createLink(String translationKey, Uri url, IconData icon) {
    return InkWell(
        onTap: () {
          _launchURL(url);
        },
        child: createItemWidget(
            FaIcon(
              icon,
              color: Colors.black,
            ),
            translationKey));
  }
}
