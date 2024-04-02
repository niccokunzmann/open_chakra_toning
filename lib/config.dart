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

import 'package:flutter_svg/flutter_svg.dart';

class Config {
  static Uri viewProject =
      Uri.parse("https://github.com/niccokunzmann/open_chakra_toning");
  static Uri viewWebsite =
      Uri.parse("https://niccokunzmann.github.io/open_chakra_toning/");
  static Uri reportIssues =
      Uri.parse("https://github.com/niccokunzmann/open_chakra_toning/issues");
  // ignore: non_constant_identifier_names
  static String SVGIcon = "assets/img/icon/icon.svg";
  static SvgPicture getSVGIcon({double? height}) {
    return SvgPicture.asset(SVGIcon, height: height);
  }
}
