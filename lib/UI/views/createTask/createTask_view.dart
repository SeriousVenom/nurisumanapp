import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';
import 'createTaskMap_View.dart';
import 'createTask_viewmodel.dart';

class CreateTaskView extends StatelessWidget {
  const CreateTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateTaskViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => CreateTaskViewModel(context),
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
                  body: _createTask(context, model),
                ),
              ));
        });
  }
}

_createTask(BuildContext context, CreateTaskViewModel model) {
  return Stack(
    children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
        child: ListView(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Text(
                'Создать задание',
                style: TextStyle(
                    color: Color.fromRGBO(51, 62, 99, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 15,
                      offset: const Offset(0, 10))
                ]),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10, top: 10, bottom: 10),
                              width: 100,
                              child: Text(
                                'Дата/Время исполнения:',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontFamily: "Ubuntu"),
                              ),
                            ),
                            const SizedBox(width: 60),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 5, top: 5),
                                child: Column(
                                  children: const <Widget>[
                                    Text(
                                      'число/месяц/год',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'чч/мм',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          margin: const EdgeInsets.only(left: 25, right: 25),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.centerLeft,
                                colors: [
                                  Color.fromRGBO(222, 235, 240, 0.5),
                                  Color.fromRGBO(255, 255, 255, 0.23),
                                ],
                              ),
                              color: Colors.white,
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
                                'Выбор категория',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(51, 62, 99, 1),
                                    fontSize: 16),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 5),
                              Icon(
                                Icons.arrow_drop_down_circle,
                                color: Colors.blue.shade700,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  'Название заказа',
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
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "Назовите ваш заказ",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "Ubuntu",
                                        fontWeight: FontWeight.bold),
                                    contentPadding: EdgeInsets.only(left: 15),
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
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 30),
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
                                  right: 30, left: 30, bottom: 30, top: 8),
                              child: Stack(
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(left: 15, top: 15),
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
                                        left:
                                            MediaQuery.of(context).size.width /
                                                1.5,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.only(left: 20, bottom: 10),
                                  child: Text(
                                    'Адрес',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "Ubuntu",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        color: Colors.grey.withOpacity(0.05),
                                      ),
                                      margin: const EdgeInsets.only(
                                          right: 15, left: 15, bottom: 20),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Container(
                                                height: 40,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                      colors: [
                                                        Color.fromRGBO(
                                                            1, 160, 226, 1),
                                                        Color.fromRGBO(
                                                            104, 209, 253, 1),
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(10.0),
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.15),
                                                        spreadRadius: 2,
                                                        blurRadius: 8,
                                                        offset:
                                                            const Offset(0, 7),
                                                      )
                                                    ]),
                                                child: Center(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const CreateTaskMapView()));
                                                    },
                                                    child: const Text(
                                                      'Выбрать адрес',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontFamily: "Ubuntu",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4),
                                            const ImageIcon(
                                              AssetImage(
                                                  'images/icons/location.png'),
                                              color:
                                                  Color.fromRGBO(0, 89, 165, 1),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                'Цена',
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
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  suffixIcon: ImageIcon(
                                    AssetImage('images/icons/wallet_02.png'),
                                    color: Color.fromRGBO(0, 89, 165, 1),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 15),
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
                        Container(
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
                                'ОПУБЛИКОВАТЬ',
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
      model.sideMenu == true
          ? customSideMenu(context, model)
          : const SizedBox(),
    ],
  );
}
