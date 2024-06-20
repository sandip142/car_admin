import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CctvController extends GetxController {

  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void onInit() {
     videoPlayerController  = VideoPlayerController.asset("Assets/video/video.mp4");
    chewieController = ChewieController(videoPlayerController: videoPlayerController,aspectRatio: 16/9);
    videoPlayerController.setLooping(true);
    videoPlayerController.play();
    videoPlayerController.setPlaybackSpeed(2);
    videoPlayerController.play();
    
    super.onInit();
  }

  @override
  void dispose() {
      videoPlayerController.dispose();
    chewieController.dispose();
    
    super.dispose();
  }
}
