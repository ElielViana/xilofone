import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    
  @override
  // ignore: must_call_super
  initState(){
    audioCache = AudioCache(prefix: 'assets/audio/');
  }

  var cores = [Colors.red,Colors.orange,Colors.yellow,Colors.green,Color.fromARGB(255, 52, 138, 73),Colors.blue,Colors.purple];

  AudioCache audioCache = AudioCache();
  
  playLocal(index) async {
    await audioCache.play("note$index.wav");
  }
  
  @override
  Widget build(BuildContext context) {   

    return MaterialApp(
        theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Column(
        children: [
          XylophoneKey(cores[0],1),
          XylophoneKey(cores[1],2),
          XylophoneKey(cores[2],3),
          XylophoneKey(cores[3],4),
          XylophoneKey(cores[4],5),
          XylophoneKey(cores[5],6),
          XylophoneKey(cores[6],7)
        ],
      )
    );
  }

    Expanded XylophoneKey(Color cor, int index){//Widget criado para poder ser reutilizado.
    return Expanded(
    child: Material(
      child: InkWell(
        onTap:(){
            playLocal(index);
        },
        child: Container(
            color: cor,
            height: 105,
        ),
      ),
    ),   
    );
  }
}

