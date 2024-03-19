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

import 'dart:math';

class Point {
  double x;
  double y;

  Point({required this.x, required this.y});

  double distanceTo(Point point) {
    return sqrt((x - point.x) * (x - point.x) + (y - point.y) * (y - point.y));
  }
}

class Chakra {
  Point position;
  String sound;

  Chakra({required this.position, required this.sound});

  String get name {
    return runtimeType.toString().toLowerCase();
  }

  double distanceTo(Point point) {
    return position.distanceTo(point);
  }

  String get soundAssetPath {
    return "sound/$sound";
  }
}

class NoChakra extends Chakra {
  NoChakra() : super(position: Point(x: 0, y: 0), sound: "") {}
}

class Root extends Chakra {
  Root({required super.position, required super.sound});
}

class Sacral extends Chakra {
  Sacral({required super.position, required super.sound});
}

class SolarPlexus extends Chakra {
  SolarPlexus({required super.position, required super.sound});
}

class Heart extends Chakra {
  Heart({required super.position, required super.sound});
}

class Throat extends Chakra {
  Throat({required super.position, required super.sound});
}

class ThirdEye extends Chakra {
  ThirdEye({required super.position, required super.sound});
}

class Crown extends Chakra {
  Crown({required super.position, required super.sound});
}

class ChakraPicture {
  Root root;
  Sacral sacral;
  SolarPlexus solarPlexus;
  Heart heart;
  Throat throat;
  ThirdEye thirdEye;
  Crown crown;
  String path;

  ChakraPicture(
      {required this.path,
      required this.root,
      required this.sacral,
      required this.solarPlexus,
      required this.heart,
      required this.throat,
      required this.thirdEye,
      required this.crown});

  List<Chakra> get chakras {
    return [root, sacral, solarPlexus, heart, throat, thirdEye, crown];
  }

  Chakra findClosestTo(Point point) {
    return chakras.reduce((chakra1, chakra2) =>
        (chakra1.distanceTo(point) < chakra2.distanceTo(point)
            ? chakra1
            : chakra2));
  }

  String get imageAssetPath {
    return "assets/img/$path";
  }
}

class ChakraPictures {
  ChakraPicture getChakraPicture() {
    return ChakraPicture(
      path: "Chakras_map.svg",
      crown: Crown(position: Point(x: 160, y: 44), sound: "chakra1.mp3"),
      thirdEye: ThirdEye(position: Point(x: 160, y: 80), sound: "chakra2.mp3"),
      throat: Throat(position: Point(x: 160, y: 145), sound: "chakra1.mp3"),
      heart: Heart(position: Point(x: 160, y: 195), sound: "chakra2.mp3"),
      solarPlexus:
          SolarPlexus(position: Point(x: 160, y: 245), sound: "chakra1.mp3"),
      sacral: Sacral(position: Point(x: 160, y: 294), sound: "chakra2.mp3"),
      root: Root(position: Point(x: 160, y: 342), sound: "chakra1.mp3"),
    );
  }
}
