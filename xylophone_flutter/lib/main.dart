import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(Xylophone());
}

class Xylophone extends StatefulWidget {
  Xylophone({Key key}) : super(key: key);

  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {

  // this will stop repeated codes in the main project (soundName = numbers of sounds in the assets and playSound representing the repeated code)
  void playSound(int soundName){
    final player = AudioCache();
    player.play('note$soundName.wav');
  }

  Expanded buildKey(soundNumber,colorName){
    return Expanded(
      child: FlatButton(
        onPressed: (){
          playSound(soundNumber);
        },
        color: colorName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
         backgroundColor: Colors.black,
         body: SafeArea(
            child: Column(
             //mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
              buildKey(1, Colors.red),
              buildKey(2, Colors.blue),
              buildKey(3, Colors.amber),
              buildKey(4, Colors.grey),
              buildKey(5, Colors.pinkAccent),
              buildKey(6, Colors.teal),
              buildKey(7, Colors.orange),
             ],
              ),
         ),
       ),
    );
  }
}