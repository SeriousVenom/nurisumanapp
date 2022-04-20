import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class AllExecutorsViewModel extends BaseViewModel {
  AllExecutorsViewModel(BuildContext context) {}

  int selectedIndex = 2;
  bool filterOpen = false;
  bool sideMenu = false;

  List<bool> catCheck = <bool>[false, false, false, false, false];

  List<String> executorNames = <String>[
    "Иванов Владимир Сергеевич",
    "Петров Олег Анатольевичь",
    "Сидоров Иван Александрович",
    "Иванов Сергей Петрович"
  ];

  List<String> executorAvatars = <String>[
    "images/ava_min.png",
    "images/ava3.png",
    "images/ava4.png",
    "images/ava5.png"
  ];

  List<String> executorDesc = <String>[
    "Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от...",
    "Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от...",
    "Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от...",
    "Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от..."
  ];

  List<String> filterCat = <String>[
    "Категория номер один",
    "Категория номер два",
    "Категория номер три",
    "Категория номер четыре",
    "Категория номер пять"
  ];

  List<String> filterSubCat = <String>[
    "Подкатегория 1",
    "Подкатегория 2",
    "Подкатегория 3",
    "Подкатегория 4",
    "Подкатегория 5"
  ];

  Future onReady() async {}

  void onTapBottomBar(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void filter() {
    filterOpen = true;
    notifyListeners();
  }

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
