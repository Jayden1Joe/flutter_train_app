import 'package:flutter/material.dart';

Column seatList(BuildContext context, String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: () {
          Navigator.pop(context, text);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          width: double.infinity,
          color: Theme.of(context).focusColor,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      Divider(color: Colors.grey[300]),
    ],
  );
}
