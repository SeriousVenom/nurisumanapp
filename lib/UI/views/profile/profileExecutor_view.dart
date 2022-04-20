import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:nurisuman/UI/views/profile/profile_viewmodel.dart';
import 'package:nurisuman/UI/views/widgets.dart';
import 'package:stacked/stacked.dart';

class ProfileViewExecutorRoute extends MaterialPageRoute {
  ProfileViewExecutorRoute()
      : super(builder: (context) => ProfileExecutorView());
}

class ProfileExecutorView extends StatefulWidget {
  bool executor = true;

  ProfileExecutorView({Key? key}) : super(key: key);

  @override
  State<ProfileExecutorView> createState() => _ProfileExecutorViewState();
}

class _ProfileExecutorViewState extends State<ProfileExecutorView> {
  bool executor = true;

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

const List<String> passwordNames = <String>[
  "Серия/Номер: ",
  "Выдан: ",
  "Место рождения: ",
  "Дата рождения: ",
  "Пол: "
];

const List<String> passwordData = <String>[
  "7002 123456",
  "Таким то о-м полиции, такого то района, такого то города",
  "г. Тула",
  "01.01.2006",
  "Муж"
];

const List<String> reviewDate = <String>[
  "19-05-2021",
  "19-05-2021",
  "19-05-2021"
];

const List<String> reviewName = <String>[
  "Наименование заказчика",
  "Наименование заказчика",
  "Наименование заказчика"
];

const List<String> reviewDesc = <String>[
  "Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от...",
  "Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от...",
  "Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от..."
];

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
                        'images/avatar.png',
                        height: 130,
                        width: 127,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, bottom: 15, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Иванов',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Color.fromRGBO(91, 91, 126, 1)),
                          ),
                          const Text(
                            'Петр Николаевич',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Color.fromRGBO(91, 91, 126, 1)),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: const <Widget>[
                              Text('Возраст: ',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(91, 91, 126, 1))),
                              Text('25 лет',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(91, 91, 126,
                                          1))) //later data from api
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Семейное положение: ',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(91, 91, 126, 1))),
                          const Text('в браке',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(
                                      91, 91, 126, 1))) //later data from api
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              //баннер который будет отбражаться после загрузки
              onTap: () {},
              child: Card(
                margin: const EdgeInsets.all(15),
                child: Image.asset('images/banner.png'),
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
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30), bottom: Radius.circular(30)),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(0, 89, 165, 1),
                    Color.fromRGBO(1, 160, 226, 1)
                  ])),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: <Widget>[
                          const ImageIcon(
                            AssetImage('images/icons/education.png'),
                            size: 30,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 25),
                          RichText(
                              text: const TextSpan(children: <TextSpan>[
                            TextSpan(text: 'Образование: '),
                            TextSpan(
                                text: 'высшее',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ])),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Theme(
                      data: ThemeData(
                        dividerColor: Colors.transparent,
                        unselectedWidgetColor: Colors.white,
                        colorScheme:
                            const ColorScheme.dark(primary: Colors.white),
                      ),
                      child: const ExpansionTile(
                        leading: ImageIcon(
                          AssetImage('images/icons/exp_work.png'),
                          size: 30,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Опыт работы',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 70, right: 20),
                            child: Text(
                              'Также как постоянный количественный рост и сфера нашей активности не даёт нам иного выбора, кроме определения глубокомысленных рассуждений.',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Theme(
                      data: ThemeData(
                        dividerColor: Colors.transparent,
                        unselectedWidgetColor: Colors.white,
                        colorScheme:
                            const ColorScheme.dark(primary: Colors.white),
                      ),
                      child: ExpansionTile(
                        leading: CircleAvatar(
                          radius: 16,
                          child: Image.asset('images/ava_min.png'),
                        ),
                        title: const Text(
                          'Паспортные данные',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        children: <Widget>[
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: passwordNames.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 70, right: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      RichText(
                                          text: TextSpan(children: <TextSpan>[
                                        TextSpan(text: passwordNames[index]),
                                        TextSpan(
                                            text: passwordData[index],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ])),
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
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
                          Container(
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                        TextSpan(text: 'Хронические заболевания: '),
                        TextSpan(
                            text: 'нет',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ])),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                        TextSpan(text: 'Судимости: '),
                        TextSpan(
                            text: 'нет',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ])),
                    ),
                    const SizedBox(height: 25),
                    Center(
                      //кнопка создания баннера которая отображается до загрузки баннера
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
                            onTap: () {
                              _loadBannerWidget(context);
                            },
                            child: const Text(
                              'Создать баннер',
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
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            ListView.builder(
                //отзывы, создаются динамически
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: reviewName.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 7),
                      )
                    ]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                    decoration: const BoxDecoration(
                                        color: Color.fromRGBO(1, 160, 226, 0.1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        reviewDate[index],
                                        style: const TextStyle(
                                            color:
                                                Color.fromRGBO(1, 160, 226, 1)),
                                      ),
                                    )),
                                const SizedBox(width: 15),
                                Text(reviewName[index])
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Separator(),
                            const SizedBox(height: 5),
                            const StarRating(
                              rating: 3.5,
                            ),
                            const SizedBox(height: 5),
                            Text(reviewDesc[index]),
                            const SizedBox(height: 10),
                            Center(
                              child: Container(
                                height: 40,
                                width: 180,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(1, 160, 226, 1),
                                      Color.fromRGBO(104, 209, 253, 1)
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
                                      'Читать полностью',
                                      style: TextStyle(
                                        fontFamily: "Ubuntu",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 15)
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
