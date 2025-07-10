import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/seat_page.dart';
import 'package:flutter_train_app/pages/station_list/station_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? departure;
  String? arrival;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('기차 예매')),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  selectStation(
                    context,
                    '출발역',
                    departure ?? '',
                    (val) => setState(() => departure = val),
                  ),
                  Container(width: 2, height: 50, color: Colors.grey),
                  selectStation(
                    context,
                    '도착역',
                    arrival ?? '',
                    (val) => setState(() => arrival = val),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (departure != null && arrival != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SeatPage(departure, arrival),
                    ),
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(double.infinity, 58),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector selectStation(
    BuildContext context,
    String title,
    String station,
    void Function(String) onSelected,
  ) {
    return GestureDetector(
      onTap: () async {
        final selected = await Navigator.push<String>(
          context,
          MaterialPageRoute(builder: (_) => StationListPage(title)),
        );
        if (selected != null) {
          onSelected(selected);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            station.isEmpty ? '선택' : station,
            style: TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }
}
