import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class TaskViewViewModel extends BaseViewModel {
  TaskViewViewModel(BuildContext context);

  int selectedIndex = 1;
  bool sideMenu = false;
  bool executorChoice = true;

  void onTapBottomBar(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future onReady() async {}

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

  List<String> date = [
    "19-05-2021",
    "19-05-2021",
    "19-05-2021",
    "19-05-2021",
    "19-05-2021",
    "19-05-2021"
  ];

  List<String> time = [
    "14:43",
    "14:43",
    "14:43",
    "14:43",
    "14:43",
    "14:43",
  ];

  void showSideMenu() {
    sideMenu = true;
    notifyListeners();
  }

  void closeSideMenu() {
    sideMenu = false;
    notifyListeners();
  }
}
