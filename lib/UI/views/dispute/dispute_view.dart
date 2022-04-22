import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurisuman/UI/views/dispute/dispute_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';

class DisputeView extends StatelessWidget {
  const DisputeView({Key? key}) : super(key: key);

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
                  body: _disputeView(context, model),
                ),
              ));
        });
  }
}

_disputeView(BuildContext context, DisputeViewModel model) {
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
        Row(
          children: <Widget>[
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Сумма запрашивоемой претензии:',
                  style: TextStyle(
                      color: Color.fromRGBO(51, 62, 99, 1),
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              height: MediaQuery.of(context).size.height / 16,
              width: MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 15))
                ],
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromRGBO(249, 249, 255, 1),
                    Color.fromRGBO(255, 255, 255, 1)
                  ],
                ),
              ),
              child: const Center(
                child: Text(
                  '500 р',
                  style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "Ubuntu",
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(20),
          child: Separator(),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Претензия:',
            style: TextStyle(
                color: Color.fromRGBO(51, 62, 99, 1),
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Text(
            'Банальные, но неопровержимые выводы, а также интерактивные прототипы призывают нас к новым свершениям, которые, в свою очередь, должны быть превращены в посмешище, хотя само их существование приносит несомненную пользу обществу.',
            style: TextStyle(
                color: Colors.grey.shade500,
                fontFamily: "Ubuntu",
                fontSize: 16),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(0, 89, 165, 1),
                  Color.fromRGBO(1, 160, 226, 1)
                ],
              ),
            ),
            child: const Center(
              child: Text(
                '27.05.2021',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Покупатель',
            style: TextStyle(
                color: Color.fromRGBO(91, 91, 126, 1),
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
        Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'images/mess_customer.png',
                scale: 3.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 8,
                  top: MediaQuery.of(context).size.height / 28,
                  right: MediaQuery.of(context).size.width / 4),
              child: const Text(
                'Банальные, но неопровержимые выводы, а также интерактивные прототипы призывают нас к новым свершениям, которые, в свою очередь.',
                style: TextStyle(color: Colors.grey, fontFamily: "Ubuntu"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 8.5,
                  left: MediaQuery.of(context).size.width / 1.5),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '20:23',
                    style: TextStyle(
                        color: Colors.grey.shade500, fontFamily: "Ubuntu"),
                  )),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Продавец',
              style: TextStyle(
                  color: Color.fromRGBO(91, 91, 126, 1),
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'images/mess_seller.png',
                scale: 3.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 8,
                  top: MediaQuery.of(context).size.height / 28,
                  left: MediaQuery.of(context).size.width / 4),
              child: const Text(
                'Банальные, но неопровержимые выводы, а также интерактивные прототипы призывают нас к новым свершениям, которые, в свою очередь.',
                style: TextStyle(color: Colors.grey, fontFamily: "Ubuntu"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 8.5,
                  right: MediaQuery.of(context).size.width / 9),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '20:23',
                    style: TextStyle(
                        color: Colors.grey.shade500, fontFamily: "Ubuntu"),
                  )),
            ),
          ],
        ),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(0, 89, 165, 1),
                  Color.fromRGBO(1, 160, 226, 1)
                ],
              ),
            ),
            child: const Center(
              child: Text(
                'Сегодня',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Покупатель',
            style: TextStyle(
                color: Color.fromRGBO(91, 91, 126, 1),
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
        Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'images/mess_customer.png',
                scale: 3.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 8,
                  top: MediaQuery.of(context).size.height / 28,
                  right: MediaQuery.of(context).size.width / 4),
              child: const Text(
                'Банальные, но неопровержимые выводы, а также интерактивные прототипы призывают нас к новым свершениям, которые, в свою очередь.',
                style: TextStyle(color: Colors.grey, fontFamily: "Ubuntu"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 8.5,
                  left: MediaQuery.of(context).size.width / 1.5),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '20:23',
                    style: TextStyle(
                        color: Colors.grey.shade500, fontFamily: "Ubuntu"),
                  )),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Продавец',
              style: TextStyle(
                  color: Color.fromRGBO(91, 91, 126, 1),
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'images/mess_seller.png',
                scale: 3.5,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 8,
                  top: MediaQuery.of(context).size.height / 28,
                  left: MediaQuery.of(context).size.width / 4),
              child: const Text(
                'Банальные, но неопровержимые выводы, а также интерактивные прототипы призывают нас к новым свершениям, которые, в свою очередь.',
                style: TextStyle(color: Colors.grey, fontFamily: "Ubuntu"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 8.5,
                  right: MediaQuery.of(context).size.width / 9),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '20:23',
                    style: TextStyle(
                        color: Colors.grey.shade500, fontFamily: "Ubuntu"),
                  )),
            ),
          ],
        ),
        const SizedBox(height: 20),
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
                  '+ ДОБАВИТЬ ДОВОД',
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
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 220,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(0, 15))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 10),
                child: Text(
                  'Текст довода',
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
                    right: 30, left: 30, bottom: 15, top: 8),
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
                          left: MediaQuery.of(context).size.width / 1.3,
                          top: 10),
                      child: const ImageIcon(
                        AssetImage('images/icons/error.png'),
                        color: Color.fromRGBO(0, 89, 165, 1),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.only(left: 100, right: 100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(1, 160, 226, 1),
                          Color.fromRGBO(104, 209, 253, 1)
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Отправить',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Ubuntu",
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
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
                begin: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(34, 208, 145, 1),
                  Color.fromRGBO(172, 247, 202, 1)
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  'Помощь администрации',
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20)
      ],
    ),
  );
}
