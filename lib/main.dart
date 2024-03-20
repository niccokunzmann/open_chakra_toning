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
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'chakras.dart';
import 'package:audioplayers/audioplayers.dart';

void main() async {
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en_US', supportedLocales: ['en_US', 'es', 'fa']);

  runApp(LocalizedApp(delegate, MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        title: translate("app.title"),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MaterialApp(
          title: translate("app.title"),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ChakraPicture chakras = ChakraPictures().getChakraPicture();
  final player = AudioPlayer();
  Chakra currentlyPlayingChakra = NoChakra();

  bool get isPlaying {
    return player.state == PlayerState.playing ||
        player.state == PlayerState.completed;
  }

  _MyHomePageState() {
    player.setReleaseMode(ReleaseMode.loop);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(translate("app.title")),
      ),
      body: Center(
        child: FittedBox(
          alignment: Alignment.topCenter,
          fit: BoxFit.fill,
          child: GestureDetector(
            onTapDown: (details) {
              setState(() {
                Chakra chakra = chakras.findClosestTo(Point(
                    x: details.localPosition.dx, y: details.localPosition.dy));
                if (isPlaying && chakra == currentlyPlayingChakra) {
                  player.stop();
                } else {
                  currentlyPlayingChakra = chakra;
                  currentlyPlayingChakra.playSoundWith(player);
                }
              });
            },
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: 1,
                  minHeight:
                      1), // from https://stackoverflow.com/a/60993103/1320237
              child:
                  SvgPicture.asset(chakras.imageAssetPath, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (isPlaying) {
              player.pause();
            } else {
              currentlyPlayingChakra.playSoundWith(player);
            }
          });
        },
        tooltip:
            isPlaying ? translate("button.pause") : translate("button.play"),
        child: SvgPicture.asset(currentlyPlayingChakra.iconAssetPath),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
