import 'package:flutter/material.dart';
import 'package:flutter_memory_game/views/hard.dart';
import 'package:flutter_memory_game/views/medium.dart';
// ignore: unused_import
import 'package:flutter_memory_game/views/start_game_screen.dart';
import 'package:flutter_memory_game/views/easy.dart';

class DifficultySelectionScreen extends StatelessWidget {
  const DifficultySelectionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 28, 34, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'assets/images/BackIcons.png',
            height: 200,
            width: 200,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('BACK'),
        titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 199, 155, 59),
          fontSize: 17,
        ),
        backgroundColor: const Color.fromARGB(255, 8, 28, 34),
      ),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          const SizedBox(
            height: 120,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "DIFFICULTY",
              style: const TextStyle(
                color: Color.fromARGB(255, 199, 155, 59),
                fontSize: 35,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: const DecorationImage(
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
                      builder: (context) => const EasyDifficulty(),
                    ),
                  );
                },
                child: const Text("           BEGINNER           "),
              ),
            ),
          ),
          const SizedBox(
            height: 15
            ,
          ),
          Container(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: const DecorationImage(
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
                      builder: (context) => const MediumDifficulty(),
                    ),
                  );
                },
                child: const Text("            MASTER            "),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                image: const DecorationImage(
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
                      builder: (context) => const HardDifficulty(),
                    ),
                  );
                },
                child: const Text("        CHALLENGER       "),
              ),
            ),
          ),
          const SizedBox(
            height: 243,
          ),
        ],
      ),
    );
  }
}
