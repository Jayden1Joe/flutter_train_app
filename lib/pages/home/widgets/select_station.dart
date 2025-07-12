import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/station_list/station_list_page.dart';

GestureDetector selectStation(
  BuildContext context,
  String title,
  String station,
  void Function(String) onSelected, {
  String? excludeStation,
}) {
  return GestureDetector(
    onTap: () async {
      final selected = await Navigator.push<String>(
        //async await으로 페이지에서 돌아올때 반환 된 값을 selected라는 변수에 저장
        context,
        MaterialPageRoute(
          builder: (_) => StationListPage(
            title,
            excludeStation: excludeStation,
          ), //출발역, 도착역 등 제목과 출발역과 도착역에서 이미 선택해 제외해야하는 역이 있으면 그 정보를 넘겨줌.
        ),
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
        ), //역 선택의 기본값은 '' 빈 문자열로 지정됨 빈문자열일 경우 '선택'을 표시, 값이 지정되었으면 그 값을 표시.
      ],
    ),
  );
}
