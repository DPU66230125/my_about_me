import 'package:flutter/material.dart';
import 'package:video_url_validator/video_url_validator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPresentation extends StatefulWidget {
  const VideoPresentation({super.key});

  @override
  State<VideoPresentation> createState() => _VideoPresentationState();
}

class _VideoPresentationState extends State<VideoPresentation> {
  late YoutubePlayerController controller;
  var validator = VideoURLValidator();
  late String youtubePath = "https://www.youtube.com/watch?v=es7XtrloDIQ";
  late bool validateStatus =
      validator.validateYouTubeVideoURL(url: youtubePath);

  @override
  void initState() {
    if (validateStatus == true) {
      controller = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(youtubePath)!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("วิดีโอแนะนำตัว"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Column(
                  children: [
                    if (validateStatus == true)
                      YoutubePlayer(
                        controller: controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.amber,
                        progressColors: const ProgressBarColors(
                            playedColor: Colors.amber,
                            handleColor: Colors.amberAccent),
                      ),
                    if (validateStatus == false)
                      const Center(
                        child: Text('ไม่มีวิดีโอนี้'),
                      )
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
