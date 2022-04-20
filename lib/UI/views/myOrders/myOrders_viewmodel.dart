import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class MyOrdersViewModel extends BaseViewModel {
  MyOrdersViewModel(BuildContext context);

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
  List<String> names = [
    'Иванов Иван Иванович',
    'Иванов Иван Иванович',
    'Иванов Иван Иванович',
    'Иванов Иван Иванович',
    'Иванов Иван Иванович',
    'Иванов Иван Иванович'
  ];

  List<bool> paid = [true, true, true, true, true, true];
  List<bool> deliver = [true, false, false, true, true, false];

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
