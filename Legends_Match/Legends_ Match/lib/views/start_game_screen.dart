import 'package:flutter/material.dart';
import 'package:flutter_memory_game/views/difficulty_screen.dart';
// ignore: unused_import
import 'package:flutter_memory_game/views/how_to_play.dart';

class StartGameScreen extends StatefulWidget {
  const StartGameScreen({super.key});

  @override
  State<StartGameScreen> createState() => _StartGameScreenState();
}

class _StartGameScreenState extends State<StartGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 28, 34),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          const SizedBox(
            height: 150,
          ),
          Image.asset(
            "assets/images/logo.png",
          ),
          Column(children: [
            const SizedBox(
              height: 150,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/button.png",
                    ),
                  ),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 197, 197, 197)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DifficultySelectionScreen(),
                      ),
                    );
                  },
                  child: const Text("           START GAME           "),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/button.png",
                    ),
                  ),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 197, 197, 197)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const how_to_play(),
                      ),
                    );
                  },
                  child: const Text("           HOW TO PLAY          "),
                ),
              ),
            ),
          ]),
          const SizedBox(
            height: 150,
          ),
          
        ],
      ),
    );
  }
}
