import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurisuman/UI/views/goods/myGoods_view.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';
import 'addGood_viewmodel.dart';

class AddGoodView extends StatelessWidget {
  const AddGoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddGoodViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => AddGoodViewModel(context),
        builder: (context, model, child) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
              value: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness
                      .dark), //прозрачность statusbar и установка тёмных иконок
              child: GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(
                      context); //расфокус textfield при нажатии на экран
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Scaffold(
                  extendBody: true,
                  extendBodyBehindAppBar: true,
                  appBar: model.sideMenu == false
                      ? customAppBar(context, model)
                      : null,
                  bottomNavigationBar: model.sideMenu == false
                      ? customBottomBar(context, model)
                      : null,
                  body: _addView(context, model),
                ),
              ));
        });
  }
}

_addView(BuildContext context, AddGoodViewModel model) {
  return Stack(
    children: <Widget>[
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
        child: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                'Добавить товар',
                style: TextStyle(
                    color: Color.fromRGBO(51, 62, 99, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 40, top: 20),
                  child: Text(
                    'Загрузить одну или несколько фотографий',
                    style: TextStyle(
                        color: Colors.grey, fontFamily: "Ubuntu", fontSize: 12),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.05),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  margin: const EdgeInsets.only(
                      right: 40, left: 40, bottom: 5, top: 8),
                  child: Stack(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15),
                            focusColor: Colors.black,
                            hintText: 'Загрузить',
                            hintStyle: TextStyle(
                                fontFamily: "Ubuntu",
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                        style: const TextStyle(
                            fontFamily: "Ubuntu",
                            color: Color.fromRGBO(91, 91, 126, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 5),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            height: 32,
                            width: 32,
                            child: Image.asset('images/icons/pin_2.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 40, top: 20),
                  child: Text(
                    'Название товара',
                    style: TextStyle(
                        color: Colors.grey, fontFamily: "Ubuntu", fontSize: 12),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.05),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  margin: const EdgeInsets.only(
                      right: 40, left: 40, bottom: 5, top: 8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15, top: 15),
                      focusColor: Colors.black,
                    ),
                    style: const TextStyle(
                        fontFamily: "Ubuntu",
                        color: Color.fromRGBO(91, 91, 126, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 40, top: 20),
                  child: Text(
                    'Цена товара',
                    style: TextStyle(
                        color: Colors.grey, fontFamily: "Ubuntu", fontSize: 12),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.05),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  margin: const EdgeInsets.only(
                      right: 40, left: 40, bottom: 30, top: 8),
                  child: Stack(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 15, top: 15),
                          focusColor: Colors.black,
                        ),
                        style: const TextStyle(
                            fontFamily: "Ubuntu",
                            color: Color.fromRGBO(91, 91, 126, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15, right: 10),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'руб.',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(222, 235, 240, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.23)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(6.0)),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'images/image.png',
                        width: 40,
                      ),
                    ),
                    const Text(
                      'Категория',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(51, 62, 99, 1),
                          fontSize: 16),
                    ),
                    const SizedBox(width: 120),
                    Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.blue.shade700,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    'Опишите заказ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.05),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  margin: const EdgeInsets.only(
                      right: 50, left: 50, bottom: 30, top: 8),
                  child: Stack(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 15, top: 15),
                          focusColor: Colors.black,
                        ),
                        maxLines: 5,
                        style: const TextStyle(
                            fontFamily: "Ubuntu",
                            color: Color.fromRGBO(91, 91, 126, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 1.5,
                            top: 10),
                        child: const ImageIcon(
                          AssetImage('images/icons/Pan.png'),
                          color: Color.fromRGBO(0, 89, 165, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyGoodsView()));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 80, right: 80),
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 15,
                        offset: const Offset(0, 15))
                  ],
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 150, 143, 1),
                      Color.fromRGBO(229, 67, 45, 1)
                    ],
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'ДОБАВИТЬ ТОВАР',
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      model.sideMenu == true
          ? customSideMenu(context, model)
          : const SizedBox(),
    ],
  );
}
