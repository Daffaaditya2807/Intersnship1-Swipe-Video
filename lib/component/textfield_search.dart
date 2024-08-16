import 'package:flutter/material.dart';
import 'package:swipe_vidio/res/list_color.dart';

Widget searchTextField(TextEditingController controller) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [blueBlack, blueBlack2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      borderRadius: BorderRadius.circular(25.0),
    ),
    child: TextField(
      controller: controller,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(
              color: Colors.grey.shade500, fontWeight: FontWeight.normal),
          labelStyle: const TextStyle(color: Colors.white),
          fillColor: Colors.transparent,
          filled: true,
          suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
    ),
  );
}
