import 'package:flutter/material.dart';
import 'package:tiktok/controllers/upload_video_controller.dart';
import 'package:tiktok/views/widgets/text_input.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

//create stateful widget and provide path and videofile that can use to preview video
class ConfirmVideoScreen extends StatefulWidget {
  File videoFile;
  String videoPath;
  ConfirmVideoScreen(
      {super.key, required this.videoFile, required this.videoPath});

  @override
  State<ConfirmVideoScreen> createState() => _ConfirmVideoScreenState();
}

class _ConfirmVideoScreenState extends State<ConfirmVideoScreen> {
  late VideoPlayerController videoController;
  TextEditingController _songController = TextEditingController();
  TextEditingController _captionController = TextEditingController();
  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      videoController = VideoPlayerController.file(widget.videoFile);
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
          child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            child: VideoPlayer(videoController),
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputField(
                    controller: _songController,
                    labelText: 'Song Name',
                    icon: Icons.music_note,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputField(
                    controller: _captionController,
                    labelText: 'Caption Name',
                    icon: Icons.closed_caption,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () => uploadVideoController.uploadVideo(
                        _songController.text, _captionController.text, widget.videoPath),
                    child: Text('Share!',
                        style: TextStyle(fontSize: 20, color: Colors.white))),
              ],
            ),
          )
        ],
      )),
    );
  }
}
