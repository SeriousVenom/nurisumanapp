import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class CategorySelectViewModel extends BaseViewModel {
  CategorySelectViewModel(BuildContext context);

  int selectedIndex = 1;
  bool sideMenu = false;

  void onTapBottomBar(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<String> cat = <String>[
    "Категория номер один",
    "Категория номер два",
    "Категория номер три",
    "Категория номер четыре",
    "Категория номер пять"
  ];

  List<String> subCat = <String>[
    "Подкатегория 1",
    "Подкатегория 2",
    "Подкатегория 3",
    "Подкатегория 4",
    "Подкатегория 5"
  ];

  List<bool> catSwitch = <bool>[false, false, false, false, false];

  void catSwitchValue(index, value) {
    catSwitch[index] = value;
    notifyListeners();
  }

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
