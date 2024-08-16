import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoManager extends GetxController {
  var videoController = <VideoPlayerController>[].obs;
  var videoController2 = <VideoPlayerController>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchVideos();
    fetchVideos2();
  }

  void fetchVideos() async {
    var collection = FirebaseFirestore.instance.collection('trending_video');
    var snapshot = await collection.get();
    var urls =
        snapshot.docs.map((doc) => doc.data()['urlVideo'] as String).toList();

    videoController.clear();

    for (var url in urls) {
      var controller = VideoPlayerController.networkUrl(Uri.parse(url));
      await controller.initialize();
      videoController.add(controller);
    }
  }

  void fetchVideos2() async {
    var collection = FirebaseFirestore.instance.collection('news_video');
    var snapshot = await collection.get();
    var urls =
        snapshot.docs.map((doc) => doc.data()['urlVideo'] as String).toList();

    videoController2.clear();

    for (var url in urls) {
      var controller = VideoPlayerController.networkUrl(Uri.parse(url));
      await controller.initialize();
      videoController2.add(controller);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    videoController.forEach((controller) {
      controller.dispose();
    });
    videoController2.forEach((controller) {
      controller.dispose();
    });
    super.onClose();
  }
}
