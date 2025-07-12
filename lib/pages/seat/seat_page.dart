import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/widgets/label_box.dart';
import 'package:flutter_train_app/pages/seat/widgets/reserve.dart';
import 'package:flutter_train_app/pages/seat/widgets/seat.dart';

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
          //출발역, 도착역 표시
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
          //선택됨, 선택안됨 색깔 안내
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
                  color: Theme.of(context).cardColor,
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
                //A-D열 표시 제목행
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
                //1-20행 반복
                for (int i = 1; i <= 20; i++) seatRow(i),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: reserve(
              selectedCol: selectedCol,
              selectedRow: selectedRow,
            ), //선택된 열과 행 값을 가지고 예약 확인 박스를 띄움.
          ),
        ],
      ),
    );
  }

  //좌석 행 생성 위젯
  Row seatRow(int rowNum) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        seat(
          rowNum: rowNum,
          col: 'A',
          selectedRow: selectedRow,
          selectedCol: selectedCol,
          onSelected: (row, col) {
            //선택시, 선택된 행 열을 부모 위젯에게 전달.
            setState(() {
              selectedRow = row;
              selectedCol = col;
            });
          },
          context: context,
        ),
        seat(
          rowNum: rowNum,
          col: 'B',
          selectedRow: selectedRow,
          selectedCol: selectedCol,
          onSelected: (row, col) {
            setState(() {
              selectedRow = row;
              selectedCol = col;
            });
          },
          context: context,
        ),
        labelBox(rowNum.toString()),
        seat(
          rowNum: rowNum,
          col: 'C',
          selectedRow: selectedRow,
          selectedCol: selectedCol,
          onSelected: (row, col) {
            setState(() {
              selectedRow = row;
              selectedCol = col;
            });
          },
          context: context,
        ),
        seat(
          rowNum: rowNum,
          col: 'D',
          selectedRow: selectedRow,
          selectedCol: selectedCol,
          onSelected: (row, col) {
            setState(() {
              selectedRow = row;
              selectedCol = col;
            });
          },
          context: context,
        ),
      ],
    );
  }
}
