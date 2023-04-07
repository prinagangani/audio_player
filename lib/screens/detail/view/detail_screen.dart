import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../audio/provider/audio_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  AudioProvider? at, af;
  @override
  Widget build(BuildContext context) {
    at = Provider.of<AudioProvider>(context, listen: true);
    af = Provider.of<AudioProvider>(context, listen: false);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("${af!.name[index]}"),centerTitle: true,backgroundColor: Colors.black,),
        body: Stack(
          children: [
            Container(
              height: double.infinity,width: double.infinity,child: Image.asset("${af!.image[index]}",fit: BoxFit.cover,),),
            Container(
              height: double.infinity,width: double.infinity,color: Colors.grey.withOpacity(0.6),
            ),
            PlayerBuilder.isPlaying(player: at!.assetsAudioPlayer, builder: (context, isPlaying) {
              return Column(
                children: [
                  Spacer(),
                  Center(
                    child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Container(height: 400,width: 350,child: Image.asset("${at!.image[index]}",fit: BoxFit.cover,)),),
                  ),
                  Spacer(),
                  PlayerBuilder.currentPosition(player: at!.assetsAudioPlayer, builder: (context, position) {
                    return Container(
                      height: 110,width: double.infinity,decoration: BoxDecoration(color: Colors.grey.shade50),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(onPressed: () {
                                af!.back();
                              }, icon: Icon(Icons.skip_previous)),
                              IconButton(onPressed: () {
                                af!.play();
                              }, icon: Icon(Icons.play_arrow_sharp)),
                              IconButton(onPressed: () {
                                af!.next();
                              }, icon: Icon(Icons.skip_next)),
                            ],
                          ),
                          Slider(value: 0.5, onChanged: (value) {
                            at!.assetsAudioPlayer.seek(Duration(seconds: value.toInt()));
                          },activeColor: Colors.black,inactiveColor: Colors.grey.shade700,),
                          Row(
                            children: [
                              Text("${position.inSeconds}"),
                              Spacer(),
                              Text("${at!.time.inSeconds}"),
                            ],
                          ),
                        ],
                      ),
                    );
                  },)
                ],
              );
            },)
          ],
        ),
      ),
    );
  }
}
