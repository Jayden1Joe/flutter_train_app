import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/seat_page.dart';

class SelectSeat extends StatelessWidget {
  const SelectSeat(this.departure, this.arrival, {super.key});

  final String departure;
  final String arrival;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (departure.isNotEmpty && arrival.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SeatPage(departure, arrival)),
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
