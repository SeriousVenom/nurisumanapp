import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class OrderViewModel extends BaseViewModel {
  OrderViewModel(BuildContext context);

  int selectedIndex = 0;
  bool sideMenu = false;
  bool filterOpen = false;
  double sliderPrice = 10;
  bool process = false;
  bool send = false;
  bool paid = false;
  bool delivered = false;

  void processCheck(value) {
    process = value;
    notifyListeners();
  }

  void sendCheck(value) {
    send = value;
    notifyListeners();
  }

  void paidCheck(value) {
    paid = value;
    notifyListeners();
  }

  void deliveredCheck(value) {
    delivered = value;
    notifyListeners();
  }

  List<String> image = [
    'images/earpods.png',
    'images/earpods.png',
    'images/earpods.png'
  ];

  List<String> name = [
    'Наушники Earpods',
    'Наушники Earpods',
    'Наушники Earpods'
  ];
  List<String> price = ['500 р', '500 р', '500 р'];
  List<String> desc = [
    'Душа моя озарена неземной радостью, как эти чудесные весенние...',
    'Душа моя озарена неземной радостью, как эти чудесные весенние...',
    'Душа моя озарена неземной радостью, как эти чудесные весенние...'
  ];

  List<String> seller = [
    'Иван Иванович Иванов',
    'Иван Иванович Иванов',
    'Иван Иванович Иванов'
  ];

  void onTapBottomBar(int index) {
    selectedIndex = index;
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

  void openFilter() {
    filterOpen = true;
    notifyListeners();
  }

  void closeFilter() {
    filterOpen = false;
    notifyListeners();
  }

  void sliderFilter(value) {
    sliderPrice = value;
    notifyListeners();
  }

  Future onReady() async {}
}
