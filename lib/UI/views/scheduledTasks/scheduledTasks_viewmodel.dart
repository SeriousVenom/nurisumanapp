import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ScheduledTasksViewModel extends BaseViewModel {
  ScheduledTasksViewModel(BuildContext context);

  bool sideMenu = false;
  int selectedIndex = 1;

  void onTapBottomBar(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<String> executorNames = [
    "Иванов Владимир Сергеевич",
    "Иванов Владимир Сергеевич",
    "Иванов Владимир Сергеевич",
    "Иванов Владимир Сергеевич",
    "Иванов Владимир Сергеевич",
    "Иванов Владимир Сергеевич"
  ];
  List<String> executorDesc = [
    "Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от...",
    "Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от...",
    "Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от...",
    "Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от...",
    "Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от...",
    "Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от..."
  ];

  List<String> executorAvatars = [
    "images/avatarSeller.png",
    "images/avatarSeller.png",
    "images/avatarSeller.png",
    "images/avatarSeller.png",
    "images/avatarSeller.png",
    "images/avatarSeller.png"
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
