import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:stacked/stacked.dart';

class CreateProfileViewModel extends BaseViewModel {
  CreateProfileViewModel(BuildContext context) {
    //
  }
  String dropdownValue = 'В браке';
  bool passAgreeCheck = false;
  bool sickCheck = false;
  bool crimeCheck = false;
  bool agreeCheck = false;

  List<String> name = <String>[
    "ФИО",
    "E-mail",
    "Город",
    "О себе",
    "О себе",
    "Возраст",
    "Образование",
    "Опыт работы"
  ];

  newValue(newValue) {
    dropdownValue = newValue!;
    notifyListeners();
  }

  passAgree(value) {
    passAgreeCheck = value;
    notifyListeners();
  }

  sick(value) {
    sickCheck = value;
    notifyListeners();
  }

  crime(value) {
    crimeCheck = value;
    notifyListeners();
  }

  agree(value) {
    agreeCheck = value;
    notifyListeners();
  }

  var maskFormatter = MaskTextInputFormatter(
    mask: '##.##.####',
    filter: {"#": RegExp(r'[0-9]')},
  );
  // Logic
  Future onReady() async {}
}
