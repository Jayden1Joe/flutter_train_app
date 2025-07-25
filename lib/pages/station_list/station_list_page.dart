import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/station_list/widgets/seat_list.dart';

class StationListPage extends StatefulWidget {
  StationListPage(this.title, {super.key, this.excludeStation});

  String title;
  final String? excludeStation;

  @override
  State<StationListPage> createState() => _StationListPageState();
}

class _StationListPageState extends State<StationListPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> allStations = [
      '수서',
      '동탄',
      '평택지제',
      '천안아산',
      '오송',
      '대전',
      '김천구미',
      '동대구',
      '경주',
      '울산',
      '부산',
    ];
    final stations = widget.excludeStation == null
        ? allStations
        : allStations
              .where((s) => s != widget.excludeStation)
              .toList(); //제외할 아이템이 있을시, 제외한 리스트를 반환.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          for (String station in stations) seatList(context, station),
        ], //역 리스트의 아이템을 반복해서 리스트를 표시
      ),
      backgroundColor: Theme.of(context).focusColor,
    );
  }
}
