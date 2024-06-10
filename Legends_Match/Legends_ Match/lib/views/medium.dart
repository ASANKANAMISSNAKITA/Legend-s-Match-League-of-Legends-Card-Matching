// ignore_for_file: camel_case_types
// ignore: unused_import
import 'package:flutter_memory_game/model/data2.dart' as data;
// ignore: unused_import
import 'package:flutter_memory_game/views/shuffledImageSource.dart';
import 'dart:async';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_memory_game/model/data2.dart';
import 'package:flutter_memory_game/views/game_over_screen.dart';
// ignore: unused_import

class MediumDifficulty extends StatefulWidget {
  const MediumDifficulty({super.key});

  @override
  State<MediumDifficulty> createState() => _MediumDifficultyState();
}

class _MediumDifficultyState extends State<MediumDifficulty> {
  // ignore: prefer_final_fields
  int _score = 0;
  int _tries = 0;
  int _previousIndex = -1;
  // ignore: unused_field
  int _time = 3;
  int gameDuration = -3;
  bool _flip = false;
  bool _start = false;
  bool _wait = false;
  late bool _isFinished;
  late Timer _timer;
  late Timer _durationTimer;
  late int _left;
  late List _data;
  late List<bool> _cardFlips;
  late List<GlobalKey<FlipCardState>> _cardStateKeys;

  void startDuration() {
    _durationTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        gameDuration = (gameDuration + 1);
      });
    });
  }

  void startGameAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _start = true;
        _timer.cancel();
      });
    });
  }

  void initializeGameData() {
    List shuffledImagePaths = data.createShuffledListFromImageSource2();
    _data = shuffledImagePaths;
    _cardFlips = List.filled(shuffledImagePaths.length, true);
    _cardStateKeys = List.generate(
        shuffledImagePaths.length, (index) => GlobalKey<FlipCardState>());
    _time = 3;
    _left = shuffledImagePaths.length ~/ 2; // corrected here
    _isFinished = false;
  }

  @override
  void initState() {
    startTimer();
    startDuration();
    startGameAfterDelay();
    initializeGameData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _durationTimer.cancel();
  }

  Widget getItem(int index) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(_data[index])),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final theme = Theme.of(context).textTheme;
    return _isFinished
        ? GameOverScreen(
            duration: gameDuration, score: _score, tries: _tries,
          )
        : Scaffold(
            backgroundColor: const Color.fromARGB(255, 8, 28, 34),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Text(
                              '                                  ', // Display the score here
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          Image.asset(
                            "assets/images/trophy.png",
                            height: 50,
                            width: 70,
                          ),
                          Text('$_score', // Display the score here
                              style: const TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        ],
                      ),
                    ),
                    GridView.builder(
                      padding: const EdgeInsets.all(8),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (context, index) => _start
                          ? FlipCard(
                              key: _cardStateKeys[index],
                              onFlip: () {
                                if (!_flip) {
                                  _flip = true;
                                  _previousIndex = index;
                                } else {
                                  _flip = false;
                                  if (_previousIndex != index) {
                                    if (_data[_previousIndex] != _data[index]) {
                                      _wait = true;
                                      _score -= 1;
                                      _tries += 1;

                                      Future.delayed(
                                          const Duration(milliseconds: 1500),
                                          () {
                                        _cardStateKeys[_previousIndex]
                                            .currentState!
                                            .toggleCard();
                                        _previousIndex = index;
                                        _cardStateKeys[_previousIndex]
                                            .currentState!
                                            .toggleCard();

                                        Future.delayed(
                                            const Duration(milliseconds: 160),
                                            () {
                                          setState(() {
                                            _wait = false;
                                          });
                                        });
                                      });
                                    } else {
                                      _cardFlips[_previousIndex] = false;
                                      _cardFlips[index] = false;
                                      debugPrint("$_cardFlips");
                                      setState(() {
                                        _left -= 1;
                                        _score += 10;
                                        _tries += 1;
                                      });
                                      if (_cardFlips.every((t) => t == false)) {
                                        debugPrint("Won");
                                        Future.delayed(
                                            const Duration(milliseconds: 160),
                                            () {
                                          setState(() {
                                            _isFinished = true;
                                            _start = false;
                                          });
                                          _durationTimer.cancel();
                                        });
                                      }
                                    }
                                  }
                                }
                                setState(() {});
                              },
                              flipOnTouch: _wait ? false : _cardFlips[index],
                              direction: FlipDirection.HORIZONTAL,
                              front: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      "assets/images/image_cover.png",
                                    ),
                                  ),
                                ),
                                margin: const EdgeInsets.all(4.0),
                              ),
                              back: getItem(index))
                          : getItem(index),
                      itemCount: _data.length,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Remaining: $_left',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          Text('Time: ${gameDuration}s',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          Text('Tries: $_tries',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

void startTimer() {}
