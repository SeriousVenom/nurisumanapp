import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  ProfileViewModel(BuildContext context);

  int selectedIndex = 4;
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
