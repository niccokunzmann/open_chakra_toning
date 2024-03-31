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

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_chakra_toning/app_bar.dart';
import 'chakras.dart';
import 'package:audioplayers/audioplayers.dart';

void main() async {
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en', supportedLocales: ['en']);

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
  bool isPlaying = false;

  void updatePlayState() {
    isPlaying = player.state == PlayerState.playing ||
        player.state == PlayerState.completed;
  }

  _MyHomePageState() {
    player.setReleaseMode(ReleaseMode.loop);
    player.setPlayerMode(PlayerMode
        .lowLatency); // see https://github.com/bluefireteam/audioplayers/blob/main/getting_started.md#player-mode
    player.onPlayerStateChanged.listen((event) {
      setState(() {
        updatePlayState();
      });
    });
  }

  double get actualChakraMapHeight {
    return min(MediaQuery.of(context).size.height - toolbarHeight,
        MediaQuery.of(context).size.width);
  }

  double get chakraMapScale {
    return actualChakraMapHeight / currentlyPlayingChakra.mapHeightPx;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder.buildAppBar(context),
      body: Center(
        child: getChakraMap(),
      ),
      /* floatingActionButton: FloatingActionButton(
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
      ), // This trailing comma makes auto-formatting nicer for build methods.*/
    );
  }

  double get toolbarHeight => AppBarBuilder.toolbarHeight;

  Widget getChakraMap() {
    List<Widget> widgets = [
      SvgPicture.asset(currentlyPlayingChakra.iconAssetPath,
          height: actualChakraMapHeight),
      SvgPicture.asset("assets/img/chakra-map/glow.svg",
          height: actualChakraMapHeight),
      SvgPicture.asset(currentlyPlayingChakra.mapAssetPath,
          height: actualChakraMapHeight),
    ];
    for (var chakra in chakras.chakras) {
      if (chakraIsPlaying(chakra)) {
        int glowScale = 2;
        widgets.add(Positioned(
            top: (chakra.position.y - chakra.iconHeightPx / 2 * glowScale) *
                chakraMapScale,
            left: (chakra.position.x - chakra.iconHeightPx / 2 * glowScale) *
                chakraMapScale,
            child: SvgPicture.asset("assets/img/chakra-icons/glow.svg",
                height: chakra.iconHeightPx * glowScale * chakraMapScale)));
      }
      widgets.add(getChakraButton(chakra));
    }
    return Stack(
      alignment: Alignment.topLeft,
      children: widgets,
    );
  }

  bool chakraIsPlaying(Chakra chakra) =>
      isPlaying && chakra == currentlyPlayingChakra;
  Widget getChakraButton(Chakra chakra) {
    SvgPicture svg = SvgPicture.asset(chakra.iconAssetPath,
        height: chakra.iconHeightPx * chakraMapScale);
    List<Widget> pictures = [
      GestureDetector(
          onTapDown: (details) {
            setState(() {
              if (chakraIsPlaying(chakra)) {
                player.stop();
              } else {
                chakra.playSoundWith(player);
              }
              currentlyPlayingChakra = chakra;
              updatePlayState();
            });
          },
          child: svg)
    ];
    return Positioned(
        // see https://stackoverflow.com/a/63337878/1320237
        top: (chakra.position.y - chakra.iconHeightPx / 2) * chakraMapScale,
        left: (chakra.position.x - chakra.iconHeightPx / 2) * chakraMapScale,
        child: Stack(children: pictures));
  }
}
