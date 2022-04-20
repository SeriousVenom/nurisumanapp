import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class AddGoodViewModel extends BaseViewModel {
  AddGoodViewModel(BuildContext context);

  int selectedIndex = 0;
  bool sideMenu = false;

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

  Future onReady() async {}
}
