import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class TermsViewModel extends BaseViewModel {
  TermsViewModel(BuildContext context);

  bool sideMenu = false;
  int selectedIndex = 1;

  void onTapBottomBar(int index) {
    selectedIndex = index;
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
