import 'dart:math';

import 'package:confetti/confetti.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final  _confettiTopCentre = ConfettiController();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _confettiTopCentre.play();
  }

  
  @override
  void dispose(){
    super.dispose();
    _confettiTopCentre.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("Happy Birthday!!",style: font1(),),
                      
                      const SizedBox(height: 40,),
                      
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 7,
                          )
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset("lib/images/man.jpeg",height: 300,)
                        ),
                      ),

                      const SizedBox(height: 10,),
                      Text("Name\n",textAlign: TextAlign.center,style: font1(),),
                      Text("Description",textAlign: TextAlign.center,style: font2(),),
                      

                      const SizedBox(height: 30,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if(isPlaying){
                              _confettiTopCentre.stop();
                            } else {
                              _confettiTopCentre.play();
                            }

                            isPlaying = !isPlaying;
                            
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: Center(child: Text(buttonText())),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        

        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(confettiController: _confettiTopCentre,
          blastDirection: pi/2,// radial value - LEFT
          particleDrag: 0.05, // apply drag to the confetti
          emissionFrequency: 0.05, // how often it should emit
          numberOfParticles: 10, // number of particles to emit
          gravity: 0.05, // gravity - or fall speed
          shouldLoop: false,
          colors: const [
            Colors.green,
            Colors.blue,
            Colors.purple,
            Colors.pink,
            Colors.teal,
          ],
          )
        ),


      ],
    );
  }


  TextStyle font1() {
    return  TextStyle(
      fontSize: 25,
      color: Theme.of(context).colorScheme.tertiary,
    );
  }

  TextStyle font2() {
    return  const  TextStyle(
      fontSize: 20,
      color: Color(0xFFFBFFDC)
    );
  }

  String buttonText() {
    if(isPlaying){
      return "Stop Confetti";
    }
    else {
      return "Let's Celebrate";
    }
  }
}