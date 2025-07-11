import 'package:flutter/material.dart';

SizedBox labelBox(String text, {Alignment alignment = Alignment.center}) {
  return SizedBox(
    width: 54,
    height: 58,
    child: Align(
      alignment: alignment,
      child: Text(text, style: TextStyle(fontSize: 18)),
    ),
  );
}
