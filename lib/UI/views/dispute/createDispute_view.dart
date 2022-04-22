import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';
import 'dispute_viewmodel.dart';

class CreateDisputeView extends StatelessWidget {
  const CreateDisputeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DisputeViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => DisputeViewModel(context),
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
                  body: _createDisputeView(context, model),
                ),
              ));
        });
  }
}

_createDisputeView(BuildContext context, DisputeViewModel model) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
    child: ListView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(0, 15))
              ]),
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage('images/earpods.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(width: 10),
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 25,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.shade900.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'Заказ № 123456789',
                            style: TextStyle(
                                fontFamily: "Ubuntu",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Наушники Earpods',
                        style: TextStyle(
                            color: Color.fromRGBO(91, 91, 126, 1),
                            fontFamily: "Ubuntu",
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '500 р',
                        style: TextStyle(
                            color: Colors.blue,
                            fontFamily: "Ubuntu",
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Продавец: Иван Иванович Иванов',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontFamily: "Ubuntu",
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 2,
                        top: MediaQuery.of(context).size.height / 11),
                    child: SvgPicture.asset('images/svg/points.svg'),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Текст претензии',
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
                  right: 30, left: 30, bottom: 30, top: 8),
              child: Stack(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15, top: 15),
                        focusColor: Colors.black,
                        hintText: 'Введите текст',
                        hintStyle: TextStyle(
                            fontFamily: "Ubuntu",
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                    maxLines: 6,
                    style: const TextStyle(
                        fontFamily: "Ubuntu",
                        color: Color.fromRGBO(91, 91, 126, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 1.3, top: 10),
                    child: const ImageIcon(
                      AssetImage('images/icons/error.png'),
                      color: Color.fromRGBO(0, 89, 165, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Предполагаемая компенсация',
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
                  right: 30, left: 30, bottom: 30, top: 8),
              child: Stack(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15, top: 15),
                        focusColor: Colors.black,
                        hintText: 'Введите текст',
                        hintStyle: TextStyle(
                            fontFamily: "Ubuntu",
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                    maxLines: 6,
                    style: const TextStyle(
                        fontFamily: "Ubuntu",
                        color: Color.fromRGBO(91, 91, 126, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 1.3, top: 10),
                    child: const ImageIcon(
                      AssetImage('images/icons/repeat.png'),
                      color: Color.fromRGBO(0, 89, 165, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Прикрепить фото',
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
                  right: 30, left: 30, bottom: 30, top: 8),
              child: Stack(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        focusColor: Colors.black,
                        hintText: 'Прикрепить',
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
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 1.3, top: 15),
                    child: const ImageIcon(
                      AssetImage('images/icons/pin.png'),
                      color: Color.fromRGBO(0, 89, 165, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Center(
          child: Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 7),
                )
              ],
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(229, 67, 45, 1),
                  Color.fromRGBO(255, 150, 143, 1)
                ],
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  'ОТПРАВИТЬ СПОР',
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
