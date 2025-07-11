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
        context,
        MaterialPageRoute(
          builder: (_) =>
              StationListPage(title, excludeStation: excludeStation),
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
        Text(station.isEmpty ? '선택' : station, style: TextStyle(fontSize: 40)),
      ],
    ),
  );
}
