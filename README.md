# flutter_train_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# 홈페이지

홈페이지 에선, 출발역과 도착역을 선택하는 페이지로 넘어갈 수 있는 버튼, 두개의 역을 선택 후 좌선 선택으로 넘어갈 수 있는 버튼이 있습니다.

출발역과 도착역 사이의 버튼을 누르면 서로 바꿀 수 있습니다.

출발역, 도착역 중 하나라도 선택하지 않고 좌석 선택 버튼을 누르면 역을 선택하라는 알람이 뜹니다.

# 역 리스트 페이지

출발역과 도착역 중 하나의 버튼을 누르면 들어갈 수 있는 페이지 입니다.

총 11개의 역이 있으며, 출발역 혹은 도착역에서 하나의 역을 선택하면, 선택된 역은 도착역 혹은 출발역에서 보이지 않습니다. 부산에서 부산으로 가는 역은 없겠죠?

# 좌석 선택 페이지

좌석을 선택할 수 있는 페이지 입니다. 하나의 좌석을 선택할 수 있으며, 선택된 좌석의 색깔은 보라색으로 변합니다.
예매하기 버튼을 누르면 선택한 좌석의 열과 행이 표시되며, 취소를 누르면 이전 단계로 돌아가고, 확인을 누르면 홈페이지로 돌아갑니다.

좌석을 선택하지 않고 예마하기 버튼을 누르면 좌석을 선택하라는 알람이 뜹니다.