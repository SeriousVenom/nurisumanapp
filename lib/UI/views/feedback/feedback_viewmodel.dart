import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class FeedbackViewModel extends BaseViewModel {
  FeedbackViewModel(BuildContext context);

  int selectedIndex = 1;
  bool sideMenu = false;

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
