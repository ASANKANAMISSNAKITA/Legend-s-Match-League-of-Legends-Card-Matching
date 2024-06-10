import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatefulWidget {
  final int duration;
  final int tries;
  final int score;
 const GameOverScreen({super.key, required this.duration, required this.tries, required this.score});

  @override
  State<GameOverScreen> createState() => _GameOverScreenState();
}

class _GameOverScreenState extends State<GameOverScreen> {
  bool isConfettiPlaying = true;
  final _confettiController = ConfettiController(
    duration: const Duration(seconds: 12),
  );

  @override
  void initState() {
    super.initState();
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 28, 34),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(35),
            children: [
              const SizedBox(
                height: 55,
              ),
              Image.asset(
                "assets/images/victory.png",
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 175,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "CONGRATULATIONS SUMMONER!",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text:
                        "You've successfully completed the Legends' Match memory game. Your sharp memory and quick thinking have helped you emerge victorious.",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 12.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "YOUR SCORE:",
                    style: TextStyle(
                      color: Color.fromARGB(255, 199, 155, 59),
                      fontSize: 25,
                    ),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    text: "",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: "",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "YOUR TIME:",
                    style: TextStyle(
                      color: Color.fromARGB(255, 199, 155, 59),
                      fontSize: 25,
                    ),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: "",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: "${widget.duration}",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                        ),
                      ),
                      const TextSpan(
                        text: " Seconds",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "YOUR TRIES:",
                    style: TextStyle(
                      color: Color.fromARGB(255, 199, 155, 59),
                      fontSize: 25,
                    ),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: "",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: "${widget.tries}",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                        ),
                      ),
                      const TextSpan(
                        text: " Tries",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
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
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: const Text("           PLAY AGAIN           "),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28),
            child: Row(
              children: [
                const SizedBox(
                  height: 900,
                ),
                const Text(
                    '                                  ', // Display the score here
                    style:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                Image.asset(
                  "assets/images/trophy.png",
                  height: 40,
                  width: 50,
                ),
                Text('${widget.score}', // Display the score here
                    style: const TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 255, 255, 255))),
              ],
            ),
          ),
          ConfettiWidget(
            numberOfParticles: 30,
            minBlastForce: 10,
            maxBlastForce: 20,
            blastDirectionality: BlastDirectionality.explosive,
            confettiController: _confettiController,
            gravity: 0.1,
          ),
        ],
      ),
    );
  }
}
