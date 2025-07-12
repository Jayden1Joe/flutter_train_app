import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/seat_page.dart';

class SelectSeat extends StatelessWidget {
  const SelectSeat(this.departure, this.arrival, {super.key});

  final String departure;
  final String arrival;

  @override
  Widget build(BuildContext context) {
    String alertMessage = '';
    if (departure.isEmpty && arrival.isEmpty) {
      alertMessage = '출발역과 도착역을 선택해주세요';
    } else if (departure.isEmpty) {
      alertMessage = '출발역을 선택해주세요';
    } else if (arrival.isEmpty) {
      alertMessage = '도착역을 선택해주세요';
    }
    return ElevatedButton(
      onPressed: () {
        if (departure.isNotEmpty && arrival.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SeatPage(departure, arrival),
            ), //도착역과 출발역의 정보를 가지고 좌석 예매 페이지로 전환
          );
        } else {
          showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text(alertMessage),
                actions: [
                  CupertinoDialogAction(
                    child: Text('확인'),
                    onPressed: () {
                      Navigator.pop(context); // pop을 두번 실행해서 초기 홈페이지로 돌아감.
                    },
                  ),
                ],
              );
            },
          );
        }
      },
      child: Text(
        '좌석 선택',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minimumSize: Size(double.infinity, 58),
      ),
    );
  }
}
