import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:nurisuman/UI/views/profile/profile_viewmodel.dart';
import 'package:nurisuman/UI/views/widgets.dart';
import 'package:stacked/stacked.dart';

class ProfileSellerView extends StatefulWidget {
  ProfileSellerView({Key? key}) : super(key: key);
  bool seller = true;

  @override
  State<ProfileSellerView> createState() => _ProfileSellerViewState();
}

class _ProfileSellerViewState extends State<ProfileSellerView> {
  bool seller = true;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => ProfileViewModel(context),
        onModelReady: (viewModel) => viewModel.onReady(),
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
                  body: _profileWidget(context, model),
                ),
              ));
        });
  }
}

_profileWidget(BuildContext context, ProfileViewModel model) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
    child: Stack(
      children: [
        ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  blurRadius: 15,
                  offset: const Offset(0, 25),
                )
              ]),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                shadowColor: Colors.white,
                margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                      child: Image.asset(
                        'images/avatarSeller.png',
                        height: 45,
                        width: 44,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
                      child: Text(
                        'Иванов Петр Николаевич',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromRGBO(91, 91, 126, 1)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    '"',
                    style: TextStyle(
                        fontSize: 70, color: Color.fromRGBO(212, 25, 0, 1)),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      ' О себе: Также как постоянный количественный рост и сфера нашей активности не даёт нам иного выбора, кроме определения глубокомысленных рассуждений. Не следует, однако, забывать, что высокотехнологичная концепция общественного уклада влечет за собой процесс внедрения и модернизации как самодостаточных, так и внешне зависимых концептуальных решений.',
                      style: TextStyle(
                          fontFamily: "Ubuntu",
                          color: Color.fromRGBO(150, 149, 168, 1)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 450,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(0, 89, 165, 1),
                    Color.fromRGBO(1, 160, 226, 1)
                  ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 25),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const ImageIcon(
                              AssetImage('images/icons/location.png'),
                              size: 30,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 25),
                            Expanded(
                              child: RichText(
                                  text: const TextSpan(children: <TextSpan>[
                                TextSpan(text: 'Адрес проживания: '),
                                TextSpan(
                                    text:
                                        'г. Тула, пр. Ленина, д. 21, корп. 2, кв. 32',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ])),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                height: 30,
                                width: 70,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Center(
                                      child: Text(
                                    'Выбрать',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 30, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
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
                                'Категория',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(51, 62, 99, 1),
                                    fontSize: 16),
                              ),
                              const SizedBox(width: 190),
                              Icon(
                                Icons.arrow_drop_down_circle,
                                color: Colors.blue.shade700,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  width: 20,
                                  height: 20,
                                  color: Colors.white,
                                ),
                                const Icon(
                                  Icons.add_circle,
                                  color: Color.fromRGBO(1, 160, 226, 1),
                                  size: 40,
                                ),
                              ],
                            ),
                            const Text(
                              'Добавить реквизиты банковской карты',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Image.asset(
                                'images/card.png',
                                width: 40,
                                height: 30,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Text(
                                  'Карта',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Корти Мили',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            const SizedBox(width: 25),
                            const Text(
                              '1234 **** **** 5678',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        model.sideMenu == true
            ? customSideMenu(context, model)
            : const SizedBox(),
      ],
    ),
  );
}

_loadBannerWidget(context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close)),
      titlePadding: const EdgeInsets.only(left: 260),
      content: const Padding(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: Text(
          'Загрузите ваш рекламный баннер (jpg)',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(91, 91, 126, 1),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {},
          child: Center(
            child: Container(
              height: 50,
              width: 180,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(34, 208, 145, 1),
                    Color.fromRGBO(172, 247, 202, 1)
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Загрузить баннер',
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
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
