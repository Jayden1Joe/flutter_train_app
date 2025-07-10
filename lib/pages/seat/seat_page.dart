import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  SeatPage(this.departure, this.arrival, {super.key});

  String departure;
  String arrival;

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  bool isSelected = false;
  int? selectedRow;
  String? selectedCol;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  widget.departure,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
              Icon(Icons.arrow_circle_right_outlined, size: 30),
              Expanded(
                child: Text(
                  widget.arrival,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(width: 4),
              Text('선택됨'),
              SizedBox(width: 20),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(width: 4),
              Text('선택안됨'),
            ],
          ),
          SizedBox(
            height:
                MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.bottom -
                250,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    labelBox('A', alignment: Alignment.bottomCenter),
                    labelBox('B', alignment: Alignment.bottomCenter),
                    SizedBox(width: 54, height: 58),
                    labelBox('C', alignment: Alignment.bottomCenter),
                    labelBox('D', alignment: Alignment.bottomCenter),
                  ],
                ),
                for (int i = 1; i <= 20; i++) seatRow(i),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(MediaQuery.of(context).size.width - 50, 58),
              ),

              child: Text('예매하기', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

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

  Row seatRow(int rowNum) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seat(rowNum, 'A'),
        seat(rowNum, 'B'),
        SizedBox(width: 54, height: 58),
        seat(rowNum, 'C'),
        seat(rowNum, 'D'),
      ],
    );
  }

  Widget seat(int rowNum, String col) {
    return col != ''
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
            child: GestureDetector(
              onTap: () {
                selectedCol = col;
                selectedRow = rowNum;
                setState(() {});
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: selectedCol == col && selectedRow == rowNum
                      ? Colors.purple
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
        : labelBox(rowNum.toString());
  }
}
