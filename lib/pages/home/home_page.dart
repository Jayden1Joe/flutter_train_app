import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/home/widgets/select_seat.dart';
import 'package:flutter_train_app/pages/home/widgets/select_station.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String departure = '';
  String arrival = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('기차 예매')),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  selectStation(
                    context,
                    '출발역',
                    departure,
                    (val) => setState(() => departure = val),
                    excludeStation: arrival,
                  ),
                  Container(width: 2, height: 50, color: Colors.grey),
                  selectStation(
                    context,
                    '도착역',
                    arrival,
                    (val) => setState(() => arrival = val),
                    excludeStation: departure,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SelectSeat(departure, arrival),
          ],
        ),
      ),
    );
  }
}
