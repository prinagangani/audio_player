import 'package:audio_player/screens/audio/provider/audio_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  AudioProvider? at, af;

  @override
  Widget build(BuildContext context) {
    at = Provider.of<AudioProvider>(context, listen: true);
    af = Provider.of<AudioProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text("Music App"),
            backgroundColor: Colors.black,
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: at!.name.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'detail',arguments: index,);
                  af!.initsong();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1,), borderRadius: BorderRadius.circular(12), color: at!.color[index]),

                  child: Container(
                    child: ListTile(
                      leading: Container(height:120,width: 70,child: Image.asset("${at!.image[index]}",fit: BoxFit.cover,)),
                      title: Text("${at!.name[index]}",style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text("${at!.film[index]}",style: TextStyle(letterSpacing: 1),),
                      trailing: Icon(Icons.play_circle),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
