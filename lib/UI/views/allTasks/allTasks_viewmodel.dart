import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class AllTasksViewModel extends BaseViewModel {
  AllTasksViewModel(BuildContext context);

  int selectedIndex = 1;
  bool sideMenu = false;

  void onTapBottomBar(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future onReady() async {}

  List<String> catName = <String>[
    "Название категории",
    "Название категории",
    "Название категории"
  ];
  List<String> executorName = <String>[
    "Иванов Владимир Сергеевич",
    "Иванов Владимир Сергеевич",
    "Иванов Владимир Сергеевич"
  ];
  List<String> taskDesc = <String>[
    "Проснувшись однажды утром после беспокойного сна,...",
    "Проснувшись однажды утром после беспокойного сна,...",
    "Проснувшись однажды утром после беспокойного сна,...",
  ];
  List<String> price = <String>["500", "500", "500"];

  void showSideMenu() {
    sideMenu = true;
    notifyListeners();
  }

  void closeSideMenu() {
    sideMenu = false;
    notifyListeners();
  }
}
