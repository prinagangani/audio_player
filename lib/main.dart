
import 'package:audio_player/screens/audio/provider/audio_provider.dart';
import 'package:audio_player/screens/audio/view/audio_screen.dart';
import 'package:audio_player/screens/detail/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AudioProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: 'detail',
        routes: {
          '/':(context) => AudioScreen(),
          'detail':(context) => DetailScreen(),
        },
      ),
    ),
  );
}