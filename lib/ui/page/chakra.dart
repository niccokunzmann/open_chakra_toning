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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_chakra_toning/model/chakras.dart';
import 'package:open_chakra_toning/ui/widgets/app_bar.dart';

class ChakraView extends StatelessWidget {
  final Chakra chakra;
  ChakraView(this.chakra);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context), body: Center(child: chakra.iconSVG()));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBarBuilder.buildAppBar(context, [], back: true);
  }
}
