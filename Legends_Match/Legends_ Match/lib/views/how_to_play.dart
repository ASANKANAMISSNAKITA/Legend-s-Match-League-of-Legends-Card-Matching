import 'package:flutter/material.dart';

class how_to_play extends StatelessWidget {
  const how_to_play({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromRGBO(8, 28, 34, 1),
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
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 199, 155, 59),
          fontSize: 17,
        ),
        backgroundColor: const Color.fromARGB(255, 8, 28, 34),
      ),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          const SizedBox(
            height: 55,
          ),
          
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: "HOW TO PLAY",
              style: TextStyle(
color: Color(0xFFC79B3B),
fontSize: 25,
fontFamily: 'Kadwa',
fontWeight: FontWeight.w400,
height: 0,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            "assets/images/howtoplay.png",
            
          ),
          const SizedBox(
            height: 50,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text:
              "Objective: Match all the tiles that have the same items until there are no more tiles left.",
              style: TextStyle(
                color: Color(0xFFC79B3B),
                fontSize: 15,
                fontFamily: 'Kadwa',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}
