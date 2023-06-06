import 'package:flutter/material.dart';
import 'dart:io';

import 'package:video_player/video_player.dart';

class ConfirmVideoScreen extends StatefulWidget {

  File videoFile;
  String videoPath;
  ConfirmVideoScreen({super.key,required this.videoFile, required this.videoPath});
 

  @override
  State<ConfirmVideoScreen> createState() => _ConfirmVideoScreenState();
}

class _ConfirmVideoScreenState extends State<ConfirmVideoScreen> {

  late VideoPlayerController videoController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      videoController=VideoPlayerController.file(widget.videoFile);

    });

    videoController.initialize();
    videoController.play();
    videoController.setVolume(1);
    videoController.setLooping(true);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          children: [
            const SizedBox(height: 30,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.5,
              child: VideoPlayer(videoController),
            ),
            const SizedBox(height: 30,),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
