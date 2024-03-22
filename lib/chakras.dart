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
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_translate/flutter_translate.dart';

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

  String get id {
    return runtimeType.toString().toLowerCase();
  }

  double distanceTo(Point point) {
    return position.distanceTo(point);
  }

  String get soundAssetPath {
    return "sound/$sound";
  }

  String name() {
    return translate("chakra.name.$id");
  }

  String description() {
    return translate("chakra.description.$id");
  }

  String get iconAssetPath {
    return "assets/img/chakra-icons/$id.svg";
  }

  String get mapAssetPath {
    return "assets/img/chakra-map/$id.svg";
  }

  void playSoundWith(AudioPlayer player) {
    player.play(
      AssetSource(soundAssetPath),
    );
  }
}

class NoChakra extends Chakra {
  NoChakra() : super(position: Point(x: 0, y: 0), sound: "");

  @override
  void playSoundWith(AudioPlayer player) {}
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

  ChakraPicture(
      {required this.root,
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

  Chakra get none {
    return NoChakra();
  }
}

class ChakraPictures {
  ChakraPicture getChakraPicture() {
    return ChakraPicture(
      crown: Crown(
          position: Point(x: 250, y: 63), sound: "solfeggio-voice/963.ogg"),
      thirdEye: ThirdEye(
          position: Point(x: 250, y: 111), sound: "solfeggio-voice/852.ogg"),
      throat: Throat(
          position: Point(x: 250, y: 189), sound: "solfeggio-voice/741.ogg"),
      heart: Heart(
          position: Point(x: 250, y: 248), sound: "solfeggio-voice/639.ogg"),
      solarPlexus: SolarPlexus(
          position: Point(x: 250, y: 300), sound: "solfeggio-voice/528.ogg"),
      sacral: Sacral(
          position: Point(x: 250, y: 354), sound: "solfeggio-voice/417.ogg"),
      root: Root(
          position: Point(x: 250, y: 415), sound: "solfeggio-voice/396.ogg"),
    );
  }
}
