import 'package:flutter/material.dart';

Widget seat({
  required int rowNum,
  required String col,
  required int? selectedRow,
  required String? selectedCol,
  required void Function(int row, String col) onSelected,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
    child: GestureDetector(
      onTap: () {
        onSelected(rowNum, col);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color:
              selectedCol == col &&
                  selectedRow ==
                      rowNum //선택시 보라색, 미선택시 회색
              ? Colors.purple
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
