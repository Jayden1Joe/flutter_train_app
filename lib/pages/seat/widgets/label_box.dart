import 'package:flutter/material.dart';

SizedBox labelBox(String text, {Alignment alignment = Alignment.center}) {
  //기본 얼라인은 센터, 필요시 네임드 파라미터로 지정 가능.
  return SizedBox(
    width: 54,
    height: 58,
    child: Align(
      alignment: alignment,
      child: Text(text, style: TextStyle(fontSize: 18)),
    ),
  );
}
