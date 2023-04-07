
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioProvider extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration time = Duration(seconds: 0);
  bool button = false;


  List<Color> color = [
    Colors.blue.shade300,
    Colors.blue.shade500,
    Colors.blue.shade700,
    Colors.green.shade400,
    Colors.green.shade600,
    Colors.green.shade800,
    Colors.pink.shade100,
    Colors.pink.shade300,
    Colors.pink.shade500,
    Colors.pink.shade700,
  ];

  List song = [
    "assets/audio/song1.mp3",
    "assets/audio/song2.mp3",
    "assets/audio/chasni.mp3",
    "assets/audio/kabira.mp3",
    "assets/audio/mereyara.mp3",
    "assets/audio/pehla.mp3",
    "assets/audio/phir.mp3",
    "assets/audio/rab.mp3",
    "assets/audio/kesariya.mp3",
    "assets/audio/bedardiya.mp3",
  ];

  List name = [
    "Apna Banale",
    "Deva Deva",
    "Chasni",
    "Kabira",
    "Mere Yaara",
    "Pehla Pehla Pyaar",
    "Phir Kabhi",
    "Rab Maneya",
    "Kesariya",
    "O Bedardiya",
  ];

  List image = [
    "assets/images/apna bana.jpg",
    "assets/images/deva.jpeg",
    "assets/images/chasni.jpeg",
    "assets/images/kabira.jpeg",
    "assets/images/mereyara.jpeg",
    "assets/images/pehla.jpeg",
    "assets/images/phir.jpeg",
    "assets/images/rab.jpeg",
    "assets/images/kesariya.jpeg",
    "assets/images/bedardiya.jpeg",
  ];

  List film = [
    "Bhediya",
    "Bhrahmashtra",
    "Bharat",
    "Yeh Jawani Hai Deewani",
    "Sooryavanshi",
    "Kabir Singh",
    "M.S Dhone- The Untold Story",
    "Koi Jaane Na",
    "Bhrahmashtra",
    "Tu Juthhi Main Makkar",
  ];

  void initsong() async {
    assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(Audio("assets/audio/song1.mp3"), autoStart: false);
  }

  void play() async {
    await button == false ? assetsAudioPlayer.play : assetsAudioPlayer.pause();
  }

  void next() async {
    await assetsAudioPlayer.next();
  }

  void back() async {
    await assetsAudioPlayer.previous();
  }

  void duration()
  {
    assetsAudioPlayer.current.listen((event) {
      time = event!.audio.duration;
      notifyListeners();
    });
  }

  void buttonC()
  {
    button = !button;
    notifyListeners();
  }

}
