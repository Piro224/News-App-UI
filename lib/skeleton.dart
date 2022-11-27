// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  final double? height, width, fontSize;
  final child, color;

  const Skeleton({
    Key? key,
    this.width,
    this.height,
    this.child,
    this.color, 
    this.fontSize = 14,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        // color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        child,
        style:  TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: color,
        ),
        maxLines: 2,
      ),
    );
  }
}
