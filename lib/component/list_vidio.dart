import 'package:flutter/material.dart';
import 'package:swipe_vidio/res/font_size.dart';
import 'package:video_player/video_player.dart';

Widget listVideo(double marginHorizontal, VideoPlayerController vidioController,
    VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: marginHorizontal),
      child: Stack(
        children: [
          Container(
            width: 130,
            height: 220,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: vidioController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: vidioController.value.aspectRatio,
                      child: VideoPlayer(vidioController),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5)),
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "😎",
                  style: TextStyle(fontSize: extraLargeFont),
                ),
              )),
            ),
          )
        ],
      ),
    ),
  );
}
