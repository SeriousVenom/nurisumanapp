import 'package:flutter/material.dart';
import 'package:nurisuman/UI/views/profile/profileCustomer_view.dart';
import 'package:nurisuman/UI/views/profile/profileExecutor_view.dart';
import 'package:nurisuman/UI/views/profile/profileSeller_view.dart';
import 'package:nurisuman/UI/views/widgets.dart';
import 'package:nurisuman/main.dart';
import 'package:stacked/stacked.dart';

import '../createProfile/createProfileCustomer_view.dart';
import '../createProfile/createProfileExecutor_view.dart';
import '../createProfile/createProfileSeller_view.dart';

class RoleViewModel extends BaseViewModel {
  RoleViewModel(BuildContext context) {
    //
  }
  int id = 0;
  bool executor = false;
  bool customer = false;
  bool seller = false;
  int? profileIndex;
  String? profileType;

  void choiceRole() {
    id++;
    notifyListeners();
  }

  void closeMessage() {
    id++;
    notifyListeners();
  }

  void choiceExecutor(context) {
    profileType = 'Executor';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const CreateProfileExecutorView()));
    notifyListeners();
  }

  typeProfile(context, profile) {
    profileType = profile;
    profileType == 'Executor'
        ? Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProfileExecutorView()))
        : null;
    profileType == 'Customer'
        ? Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProfileCustomerView()))
        : null;
    profileType == 'Seller'
        ? Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProfileSellerView()))
        : null;
    notifyListeners();
    print(profileType);

    return profileType;
  }

  void choiceCustomer(context) {
    profileType = 'Customer';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const CreateProfileCustomerView()));
    notifyListeners();
  }

  void choiceSeller(context) {
    profileType = 'Seller';
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const CreateProfileSellerView()));
    notifyListeners();
  }

  Future onReady() async {}
}
