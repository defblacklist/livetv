// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VideoOynat(),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VideoOynat(
              //videoPlayerController: VideoPlayerController.network('https://live.duhnet.tv/S2/HLS_LIVE/cnnturknp/playlist.m3u8'),
            )),
          );
        },
        child: Center(child: Text('Open')),
      ),
    );
  }
}

class VideoOynat extends StatefulWidget {


  @override
  State<VideoOynat> createState() => _VideoOynatState();
}

class _VideoOynatState extends State<VideoOynat> {
  ChewieController? _chewieController;
  VideoPlayerController videoPlayerController = VideoPlayerController.network('https://live.duhnet.tv/S2/HLS_LIVE/cnnturknp/playlist.m3u8');
  bool sayfaYuklendi = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chewieController = ChewieController(
        aspectRatio: MediaQuery.of(context).size.width/MediaQuery.of(context).size.height,
        autoPlay: true,
        videoPlayerController: videoPlayerController,
        autoInitialize: true,
        fullScreenByDefault: false,
        showOptions: false,
        errorBuilder: (context, mesaj){
          return Center(
            child: Text(mesaj),
          );
        }
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    _chewieController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chewie(
        controller: _chewieController!,
      ),
    );
  }
}
