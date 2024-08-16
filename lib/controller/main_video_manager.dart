import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../model/model_video.dart';

class MainVideoManager extends GetxController {
  RxList<VideoData> videos = RxList<VideoData>();
  RxList<VideoPlayerController> videoControllers =
      RxList<VideoPlayerController>();
  final String collectionName;
  var activeVideoIndex = Rxn<int>();

  MainVideoManager({required this.collectionName});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchVideos();
  }

  void fetchVideos() async {
    var collection = FirebaseFirestore.instance.collection(collectionName);
    var snapshot = await collection.get();

    videos.clear();
    videoControllers.clear();

    print('Documents fetched: ${snapshot.docs.length}');

    for (var document in snapshot.docs) {
      var data = document.data() as Map<String, dynamic>;
      VideoData videoData = VideoData(
        url: data['urlVideo'],
        title: data['title'],
        description: data['description'],
      );
      VideoPlayerController controller =
          VideoPlayerController.networkUrl(Uri.parse(videoData.url))
            ..setLooping(true);
      await controller.initialize().then((_) {
        print('Controller initialized for video: ${videoData.url}');
        videos.add(videoData);
        videoControllers.add(controller);
        update();
      }).catchError((e) {
        print("error initalizing controller : $e");
      });
    }
  }

  void changeActiveVideo(int index) {
    if (activeVideoIndex.value != null && activeVideoIndex.value != index) {
      // Pause and reset the currently playing video
      videoControllers[activeVideoIndex.value!].pause();
      videoControllers[activeVideoIndex.value!].seekTo(Duration.zero);
    }
    // Play the new active video
    videoControllers[index].play();
    activeVideoIndex.value = index; // Update the active index
    update(); // Update the UI if needed
  }

  @override
  void onClose() {
    videoControllers.forEach((controller) {
      controller.dispose();
    });
    super.onClose();
  }
}
