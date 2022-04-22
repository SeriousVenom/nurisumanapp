import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DisputeViewModel extends BaseViewModel {
  DisputeViewModel(BuildContext context);
  int selectedIndex = 0;
  bool sideMenu = false;

  Future onReady() async {}

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
}
