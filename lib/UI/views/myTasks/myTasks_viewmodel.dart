import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class MyTasksViewModel extends BaseViewModel {
  MyTasksViewModel(BuildContext context);

  int selectedIndex = 1;
  bool sideMenu = false;
  bool filterOpen = false;
  bool value = false;
  int val = 1;

  void radioButtonChoice(value) {
    val = value;
    notifyListeners();
  }

  void onTapBottomBar(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future onReady() async {}

  List<String> catName = [
    "Название категории",
    "Название категории",
    "Название категории"
  ];

  List<bool> catCheck = <bool>[false, false, false, false];

  List<String> date = ["19-05-2021", "19-05-2021", "19-05-2021"];

  List<String> time = ["12:00", "12:00", "12:00"];

  List<String> desc = [
    "Проснувшись однажды утром после беспокойного сна,...",
    "Проснувшись однажды утром после беспокойного сна,...",
    "Проснувшись однажды утром после беспокойного сна,..."
  ];

  List<String> filterCat = <String>[
    "Выбор исполнителя",
    "Исполнение задания",
    "Подтверждение задания",
    "Задание завершено"
  ];

  void catCheckValue(index, value) {
    catCheck[index] = value;
    notifyListeners();
  }

  void openFilter() {
    filterOpen = true;
    notifyListeners();
  }

  void closeFilter() {
    filterOpen = false;
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
