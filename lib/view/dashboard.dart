import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_vidio/component/list_vidio.dart';
import 'package:swipe_vidio/component/textfield_search.dart';
import 'package:swipe_vidio/component/title_video.dart';
import 'package:swipe_vidio/res/list_color.dart';

import '../controller/video_manager.dart';
import 'main_video.dart';

class DashboardVideo extends StatefulWidget {
  const DashboardVideo({super.key});

  @override
  State<DashboardVideo> createState() => _DashboardVideoState();
}

class _DashboardVideoState extends State<DashboardVideo> {
  final TextEditingController _controller = TextEditingController();
  final videoManager = Get.put(VideoManager());

  void navigateToMainVideo(BuildContext context, int index, String collection) {
    Get.to(() => MainVideo(
          selectedIndex: index,
          collectionName: collection,
        )); // Pass the index to MainVideo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: primaryColor),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    searchTextField(_controller),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 5,
              color: blueBlack,
            ),
            const SizedBox(
              height: 5,
            ),
            titleVidio("Trending", Icons.trending_up, purple1Color,
                marginLeft: 20),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 240,
              child: Obx(() => ListView.builder(
                    itemCount: videoManager.videoController.length,
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return listVideo(
                          8,
                          videoManager.videoController[index],
                          () => navigateToMainVideo(
                              context, index, "trending_video"));
                    },
                  )),
            ),
            const Divider(
              thickness: 15,
              color: blueBlack,
            ),
            const SizedBox(
              height: 10,
            ),
            titleVidio("New Videos", Icons.hotel_class, secondaryColor,
                marginLeft: 20),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 240,
              child: Obx(() => ListView.builder(
                    itemCount: videoManager.videoController2.length,
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return listVideo(
                          8,
                          videoManager.videoController2[index],
                          () => navigateToMainVideo(
                              context, index, "news_video"));
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
