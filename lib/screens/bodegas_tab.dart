import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BodegasTab extends StatefulWidget {
  BodegasTab({Key? key}) : super(key: key);

  @override
  State<BodegasTab> createState() => _BodegasTabState();
}

class _BodegasTabState extends State<BodegasTab> {
  VideoPlayerController? controller;
  String dataSource =
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.network(dataSource)
      ..initialize().then((_) {
        setState(() {});
      });

    controller!.play();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("video"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          controller!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: controller!.value.aspectRatio,
                  child: VideoPlayer(controller!),
                )
              : Container(
                  height: 20,
                  width: double.minPositive,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (controller!.value.isPlaying) {
              controller!.pause();
            } else {
              controller!.play();
            }
          });
        },
        child:
            Icon(controller!.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
