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
import "package:flutter_svg/flutter_svg.dart";
import "package:open_chakra_toning/ui/widgets/app_menu_item.dart";
import 'package:package_info_plus/package_info_plus.dart';
import "package:flutter_translate/flutter_translate.dart";
import "package:open_chakra_toning/config.dart";
import "package:open_chakra_toning/ui/widgets/app_bar.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutTheApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBuilder.buildAppBar(context, [], back: true),
        body: ListView(children: [
          Container(
            height: 20,
          ),
          Config.getSVGIcon(height: 120),
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
          createLink("about.translate", Config.viewTranslations,
              FontAwesomeIcons.language),
          createLink(
              "about.view-website", Config.viewWebsite, FontAwesomeIcons.globe),
          InkWell(
              onTap: () async {
                PackageInfo packageInfo = await PackageInfo.fromPlatform();
                _launchURL(Config.getVersionUrl(packageInfo.version));
              },
              child: createItemWidget(
                  FaIcon(
                    FontAwesomeIcons.github,
                    color: Colors.black,
                  ),
                  "about.version")),
          InkWell(
              onTap: () async {
                PackageInfo packageInfo = await PackageInfo.fromPlatform();

                showLicensePage(
                    // ignore: use_build_context_synchronously
                    context: context,
                    applicationIcon: Config.getSVGIcon(height: 120),
                    applicationVersion: packageInfo.version);
              },
              child: createItemWidget(
                  FaIcon(
                    FontAwesomeIcons.fileCircleCheck,
                    color: Colors.black,
                  ),
                  "about.license")),
          InkWell(
              onTap: () {
                _launchURL(Config.viewAssets);
              },
              child: createItemWidget(
                  Row(
                    children: [
                      SvgPicture.asset("assets/img/license/cc.svg", height: 24),
                      SvgPicture.asset("assets/img/license/by.svg", height: 24),
                      SvgPicture.asset("assets/img/license/sa.svg", height: 24)
                    ],
                  ),
                  "about.license-content")),
          createLink("about.view-privacy-policy", Config.viewPrivacyPolicy,
              FontAwesomeIcons.userLock),
        ]));
  }

  static AppMenuItem getMenuItem() {
    return AppMenuItem(Icons.question_mark, "menu.about",
        (BuildContext context) {
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
