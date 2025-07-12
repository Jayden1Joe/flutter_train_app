import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class reserve extends StatelessWidget {
  const reserve({
    super.key,
    required this.selectedCol,
    required this.selectedRow,
  });

  final String? selectedCol;
  final int? selectedRow;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (selectedCol != null && selectedRow != null) {
          //좌석이 제대로 선택되었을때만 실행
          showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('예매 하시겠습니까?'),
                content: Text('좌석 $selectedRow-$selectedCol'),
                actions: [
                  CupertinoDialogAction(
                    isDestructiveAction: true,
                    child: Text('취소'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('확인'),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context); // pop을 두번 실행해서 초기 홈페이지로 돌아감.
                    },
                  ),
                ],
              );
            },
          );
        } else {
          showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('좌석을 선택해주세요'),
                actions: [
                  CupertinoDialogAction(
                    child: Text('확인'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minimumSize: Size(MediaQuery.of(context).size.width - 50, 58),
      ),

      child: Text('예매하기', style: TextStyle(fontSize: 18)),
    );
  }
}
