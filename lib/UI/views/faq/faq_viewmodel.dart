import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class FaqViewModel extends BaseViewModel {
  FaqViewModel(BuildContext context);
  bool sideMenu = false;
  int selectedIndex = 1;
  final ScrollController scrollControllerFirst = ScrollController();
  final ScrollController scrollControllerSecond = ScrollController();

  void onTapBottomBar(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future onReady() async {}

  List<String> faqNames = <String>[
    "Как создать задание",
    "Как выбрать исполнителя",
    "Как договориться о сделке",
    "Как стать исполнителем",
    "Как стать продавцом"
  ];

  void goButton(index) {
    index++;
    notifyListeners();
  }

  void showSideMenu() {
    sideMenu = true;
    notifyListeners();
  }

  void closeSideMenu() {
    sideMenu = false;
    notifyListeners();
  }
}
