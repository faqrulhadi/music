import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(   
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String durasi = "00:00:00";
  AudioPlayer audioPlayer;

  _MainPageState()
  {
    audioPlayer = AudioPlayer();
    audioPlayer.onAudioPositionChanged.listen((duration){
      setState((){
        durasi = duration.toString();
      }); 
  });
  audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  }

  void playsound(String url) async{
    await audioPlayer.play(url);
  }
  void pauseSound()async{
    await audioPlayer.pause();
  }
  void stopSound()async{
    await audioPlayer.stop();
  }
  void resumeSound()async{
    audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Music")),
      body: Center(
        child: Column(
          
          children: <Widget>[
            RaisedButton(
              child: Text("play"), onPressed: () {
                playsound("https://cldup.com/yrskJKJDHz.mp3?download=OneRepublic%20-%20Counting%20Stars.mp3");
              print(durasi);},),
            RaisedButton(
              child: Text("pause"),  onPressed: () {
                pauseSound();
              },),
            RaisedButton(
              child: Text("stop"),  onPressed: () {
                stopSound();
              },),
            RaisedButton(
              child: Text("resume"),  onPressed: () {
                resumeSound();
              },),
            Text(durasi, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))
          ]
        ),
      ),
    );
  }
}
