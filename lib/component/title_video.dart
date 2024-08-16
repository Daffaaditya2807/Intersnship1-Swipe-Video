import 'package:flutter/material.dart';

Widget titleVidio(String title, IconData icon, Color boxColor,
    {double marginLeft = 0}) {
  return Container(
    margin: EdgeInsets.only(left: marginLeft),
    decoration:
        BoxDecoration(color: boxColor, borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            width: 5,
          ),
          Icon(
            icon,
            color: Colors.white,
          )
        ],
      ),
    ),
  );
}
