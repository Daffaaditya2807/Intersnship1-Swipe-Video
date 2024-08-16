import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_vidio/res/font_size.dart';
import 'package:swipe_vidio/res/list_color.dart';
import 'package:video_player/video_player.dart';

import '../component/costume_button.dart';
import '../controller/main_video_manager.dart';

class MainVideo extends StatefulWidget {
  final int selectedIndex;
  final String collectionName;
  MainVideo({required this.selectedIndex, required this.collectionName});

  @override
  State<MainVideo> createState() => _MainVideoState();
}

class _MainVideoState extends State<MainVideo> {
  late final MainVideoManager videoController;
  late final PageController pageController;

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoController =
        Get.put(MainVideoManager(collectionName: widget.collectionName));

    pageController = PageController(initialPage: widget.selectedIndex);
    videoController.activeVideoIndex.value = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Obx(() {
          if (videoController.videoControllers.isNotEmpty &&
              widget.selectedIndex < videoController.videoControllers.length) {
            if (widget.selectedIndex !=
                videoController.activeVideoIndex.value) {
              videoController.videoControllers[widget.selectedIndex].pause();
            } else {
              videoController.videoControllers[widget.selectedIndex].play();
            }
            return pageScroll();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }

  PageView pageScroll() {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videoController.videos.length,
      controller: pageController,
      onPageChanged: videoController.changeActiveVideo,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              var controller = videoController.videoControllers[index];
              if (controller.value.isPlaying) {
                controller.pause();
              } else {
                controller.play();
              }
            },
            child: videoView(index));
      },
    );
  }

  Widget playPause(VideoPlayerController controller) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, VideoPlayerValue value, child) {
        if (value.isBuffering) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (value.isPlaying) {
          return Container(); // No icon shown when playing
        } else {
          return Center(
            child: Icon(
              Icons.play_arrow_rounded,
              size: 50,
              color: Colors.grey.shade100.withOpacity(0.5),
            ),
          );
        }
      },
    );
  }

  Widget videoProgressIndicator(VideoPlayerController controller) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, VideoPlayerValue value, child) {
        return SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 2.0,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 10.0),
          ),
          child: Slider(
            value: value.position.inSeconds.toDouble(),
            min: 0,
            max: value.duration.inSeconds.toDouble(),
            onChanged: (newValue) {
              controller.seekTo(Duration(seconds: newValue.toInt()));
            },
          ),
        );
      },
    );
  }

  Widget videoView(int index) {
    return Stack(
      children: [
        VideoPlayer(videoController.videoControllers[index]),
        playPause(videoController.videoControllers[index]),
        SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buttonBack(() {
                Get.back();
              }),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    buttonReaction(emot: "🤣", value: "12"),
                    buttonReaction(emot: "😱", value: "1"),
                    buttonReaction(emot: "😎", value: "0"),
                    buttonReaction(emot: "🥰", value: "111"),
                    buttonReaction(emot: "🥵", value: "22"),
                    buttonReaction(emot: "🤢", value: "16"),
                  ],
                ),
              ),
              buttonUrgent()
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      videoController.videos[index].title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: largeFont),
                    ),
                  ),
                  SizedBox(
                    width: 340,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        videoController.videos[index].description,
                        style: const TextStyle(
                            color: Colors.white, fontSize: normalFont),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 10),
                      child: videoProgressIndicator(
                          videoController.videoControllers[index]),
                    ),
                  )
                ],
              ),
            )),
        Positioned(
            right: 10,
            bottom: 120,
            child: Column(
              children: [
                buttonProfile(),
                const SizedBox(
                  height: 15,
                ),
                buttonBookmark(),
                const SizedBox(
                  height: 15,
                ),
                buttonShare(),
                const SizedBox(
                  height: 15,
                ),
              ],
            ))
      ],
    );
  }
}
