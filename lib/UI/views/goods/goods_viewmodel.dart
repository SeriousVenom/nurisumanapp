import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class GoodsViewModel extends BaseViewModel {
  GoodsViewModel(BuildContext context);

  int selectedIndex = 0;
  bool sideMenu = false;
  bool filterOpen = false;
  double sliderPrice = 10;

  List<String> image = [
    'images/earpods.png',
    'images/earpods.png',
    'images/earpods.png',
    'images/earpods.png',
    'images/earpods.png',
    'images/earpods.png',
  ];

  List<String> name = [
    'Наушники Earpods',
    'Наушники Earpods',
    'Наушники Earpods',
    'Наушники Earpods',
    'Наушники Earpods',
    'Наушники Earpods',
  ];
  List<String> price = [
    '500 р',
    '500 р',
    '500 р',
    '500 р',
    '500 р',
    '500 р',
  ];
  List<String> desc = [
    'Душа моя озарена неземной радостью, как эти чудесные весенние...',
    'Душа моя озарена неземной радостью, как эти чудесные весенние...',
    'Душа моя озарена неземной радостью, как эти чудесные весенние...',
    'Душа моя озарена неземной радостью, как эти чудесные весенние...',
    'Душа моя озарена неземной радостью, как эти чудесные весенние...',
    'Душа моя озарена неземной радостью, как эти чудесные весенние...',
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
