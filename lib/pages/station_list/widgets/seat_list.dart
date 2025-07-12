import 'package:flutter/material.dart';

Column seatList(BuildContext context, String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: () {
          Navigator.pop(context, text); //선택된 역이름을 가지고 뒤로가기
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          width: double.infinity,
          color: Theme.of(context).focusColor,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text, //넘겨받은 역이름 표시
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      Divider(color: Colors.grey[300]),
    ],
  );
}
