import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel(BuildContext context) {
    //
  }

  bool isObscure = true;
  int id = 0;

  // Logic
  Future onReady() async {}

  void sendSMS() {
    id++;
    notifyListeners();
  }

  void closeMessage() {
    id++;
    notifyListeners();
  }

  var maskFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  void isVisiblePassword() {
    if (isObscure) {
      isObscure = false;
    } else {
      isObscure = true;
    }
    notifyListeners();
  }
}
