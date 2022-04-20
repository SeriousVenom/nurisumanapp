import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nurisuman/UI/views/profile/profileCustomer_view.dart';
import 'package:stacked/stacked.dart';
import '../loadingScreen.dart';
import 'createProfile_viewmodel.dart';

class CreateProfileCustomerView extends StatelessWidget {
  const CreateProfileCustomerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateProfileViewModel>.reactive(
        viewModelBuilder: () => CreateProfileViewModel(context),
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
                  body: _createProfileWidget(context, model),
                ),
              ));
        });
  }
}

_createProfileWidget(context, CreateProfileViewModel model) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('images/bg.png'),
          fit: BoxFit.cover), //установка фона
    ),
    child: ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(true);
            },
            child: Row(
              children: const <Widget>[
                Icon(Icons.arrow_back_outlined),
                Text(
                  'Назад',
                  style: TextStyle(fontFamily: "Ubuntu"),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Image(
                height: 50,
                width: 50,
                image: AssetImage('images/group.png'),
              ),
            ),
            SizedBox(width: 20),
            Flexible(
              child: Text(
                "Создание профиля заказчика",
                style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(Icons.circle_rounded, size: 10),
            SizedBox(width: 10),
            Text(
              'Загрузить фотографию',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(height: 20),
        Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]),
            child: Center(
              child: GestureDetector(
                onTap: () {},
              ),
            ),
          ),
        ),
        const SizedBox(height: 35),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'ФИО',
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
                    contentPadding: EdgeInsets.only(left: 15, top: 15),
                    suffixIcon: ImageIcon(
                      AssetImage('images/icons/person.png'),
                      color: Color.fromRGBO(0, 89, 165, 1),
                    ),
                    focusColor: Colors.black,
                    hintText: 'Введите ваше ФИО',
                    hintStyle: TextStyle(
                        fontFamily: "Ubuntu",
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                style: const TextStyle(
                    fontFamily: "Ubuntu",
                    color: Color.fromRGBO(91, 91, 126, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ), //ФИО
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'E-mail',
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
                    contentPadding: EdgeInsets.only(left: 15, top: 15),
                    suffixIcon: ImageIcon(
                      AssetImage('images/icons/email.png'),
                      size: 40,
                      color: Color.fromRGBO(0, 89, 165, 1),
                    ),
                    focusColor: Colors.black,
                    hintText: 'Введите ваш E-mail',
                    hintStyle: TextStyle(
                        fontFamily: "Ubuntu",
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                style: const TextStyle(
                    fontFamily: "Ubuntu",
                    color: Color.fromRGBO(91, 91, 126, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ), //Email
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Город',
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
                    contentPadding: EdgeInsets.only(left: 15, top: 15),
                    suffixIconConstraints:
                        BoxConstraints(minHeight: 40, minWidth: 35),
                    suffixIcon: ImageIcon(
                      AssetImage('images/icons/location.png'),
                      color: Color.fromRGBO(0, 89, 165, 1),
                    ),
                    focusColor: Colors.black,
                    hintText: 'Город, улица, дом, корпус, квартира',
                    hintStyle: TextStyle(
                        fontFamily: "Ubuntu",
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                maxLines: 3,
                style: const TextStyle(
                    fontFamily: "Ubuntu",
                    color: Color.fromRGBO(91, 91, 126, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ), //Город
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'О себе',
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
                    contentPadding: EdgeInsets.only(left: 15, top: 15),
                    suffixIcon: ImageIcon(
                      AssetImage('images/icons/info.png'),
                      color: Color.fromRGBO(0, 89, 165, 1),
                    ),
                    focusColor: Colors.black,
                    hintText: 'Краткая информация о себе',
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
            ),
          ],
        ), //ОСебе

        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Row(
            children: [
              Checkbox(
                  value: model.agreeCheck,
                  onChanged: (bool? value) {
                    model.agree(value);
                  }),
              const Text(
                'Пользовательское соглашение',
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Center(
          child: Container(
            height: 50,
            width: 180,
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoadingScreen(
                                index: 1,
                              )));
                },
                child: const Text(
                  'создать',
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
        const SizedBox(height: 15)
      ],
    ),
  );
}
