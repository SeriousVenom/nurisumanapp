import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class PushViewModel extends BaseViewModel {
  PushViewModel(BuildContext context);

  int selectedIndex = 1;
  bool sideMenu = false;

  void onTapBottomBar(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<String> pushNames = <String>[
    "Новая заявка по подписке",
    "Новое предложение к заявке пользователя",
    "Новое сообщение в чате",
    "Пополнение баланса",
    "Вас выбрали исполнителем",
    "Задание завершено",
    "Задание принято",
    "Задание принято"
  ];

  List<String> pushData = <String>[
    "19-05-2021 14:43",
    "19-05-2021 13:43",
    "19-05-2021 12:43",
    "19-05-2021 12:10",
    "18-05-2021 15:43",
    "18-05-2021 14:43",
    "18-05-2021 12:11",
    "18-05-2021 11:25"
  ];

  Future onReady() async {}

  void showSideMenu() {
    sideMenu = true;
    notifyListeners();
  }

  void closeSideMenu() {
    sideMenu = false;
    notifyListeners();
  }
}
