import 'package:flutter/material.dart';
import 'package:swipe_vidio/res/list_color.dart';

Widget buttonBack(VoidCallback onBack) {
  return GestureDetector(
    onTap: onBack,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade700.withOpacity(0.5), shape: BoxShape.circle),
      child: const Padding(
        padding: EdgeInsets.all(5.0),
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
          weight: 2,
        ),
      ),
    ),
  );
}

Widget buttonUrgent() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.grey.shade700.withOpacity(0.5), shape: BoxShape.circle),
    child: const Padding(
      padding: EdgeInsets.all(5.0),
      child: Icon(
        Icons.info_outline_rounded,
        color: Colors.white,
        weight: 2,
      ),
    ),
  );
}

Widget buttonReaction({String? emot, String? value}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Stack(
      children: [
        const SizedBox(
          height: 40,
        ),
        Container(
          width: 30,
          height: 30,
          decoration:
              const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          child: Text(
            value!,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: 15,
          left: 3,
          right: 3,
          child: Text(
            emot!,
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    ),
  );
}

Widget buttonProfile() {
  return Stack(
    children: [
      const SizedBox(
        width: 40,
        height: 60,
      ),
      Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.greenAccent.shade400)),
          child: const Icon(
            Icons.person,
            size: 30,
          )),
      const Positioned(
        top: 40,
        left: 5,
        right: 5,
        child: CircleAvatar(
          backgroundColor: purple1Color,
          radius: 10,
          child: Text(
            "+",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      )
    ],
  );
}

Widget buttonBookmark() {
  return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.purple.shade200.withOpacity(0.5),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.purple.shade600, width: 2)),
      child: const Icon(
        Icons.bookmark_add_outlined,
        color: Colors.white,
        size: 30,
      ));
}

Widget buttonShare() {
  return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.greenAccent.shade100.withOpacity(0.5),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.green.shade600, width: 2)),
      child: const Icon(
        Icons.share_outlined,
        color: Colors.white,
        size: 30,
      ));
}
