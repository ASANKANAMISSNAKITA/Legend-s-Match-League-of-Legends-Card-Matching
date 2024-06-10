import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_memory_game/views/difficulty_screen.dart';
// ignore: unused_import
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_memory_game/views/start_game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Memory Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartGameScreen(),
    );
  }
}
