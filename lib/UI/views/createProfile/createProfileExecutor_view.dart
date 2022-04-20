import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nurisuman/UI/views/loadingScreen.dart';
import 'package:nurisuman/UI/views/profile/profileCustomer_view.dart';
import 'package:stacked/stacked.dart';
import 'createProfile_viewmodel.dart';

class CreateProfileExecutorView extends StatelessWidget {
  const CreateProfileExecutorView({Key? key}) : super(key: key);

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
                "Создание профиля исполнителя",
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
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(1, 160, 226, 1),
                                Color.fromRGBO(104, 209, 253, 1),
                              ],
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 7),
                              )
                            ]),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Выбрать город',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 140),
                  const ImageIcon(
                    AssetImage('images/icons/map.png'),
                    color: Color.fromRGBO(0, 89, 165, 1),
                  )
                ],
              ),
            )
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Возраст',
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
                      AssetImage('images/icons/age.png'),
                      color: Color.fromRGBO(0, 89, 165, 1),
                    ),
                    focusColor: Colors.black,
                    hintText: 'Ваш возраст',
                    hintStyle: TextStyle(
                        fontFamily: "Ubuntu",
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                style: const TextStyle(
                    fontFamily: "Ubuntu",
                    color: Color.fromRGBO(91, 91, 126, 1),
                    fontWeight: FontWeight.bold),
                keyboardType: TextInputType.number,
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
                'Образование',
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
                      AssetImage('images/icons/faq.png'),
                      color: Color.fromRGBO(0, 89, 165, 1),
                    ),
                    focusColor: Colors.black,
                    hintText: 'Высшее / Среднее / Начальное',
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
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Опыт работы',
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
                      AssetImage('images/icons/support.png'),
                      color: Color.fromRGBO(0, 89, 165, 1),
                    ),
                    focusColor: Colors.black,
                    hintText: 'Заполните поле',
                    hintStyle: TextStyle(
                        fontFamily: "Ubuntu",
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                style: const TextStyle(
                    fontFamily: "Ubuntu",
                    color: Color.fromRGBO(91, 91, 126, 1),
                    fontWeight: FontWeight.bold),
                maxLines: 6,
              ),
            ),
          ],
        ),
        ExpansionTile(
          expandedAlignment: Alignment.center,
          title: const Text(
            'Паспортные данные',
            style: TextStyle(
                fontFamily: "Ubuntu",
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Фамилия',
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
                        contentPadding: EdgeInsets.only(left: 15, top: 15)),
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
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Имя',
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
                        contentPadding: EdgeInsets.only(left: 15, top: 15)),
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
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Отчество',
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
                        contentPadding: EdgeInsets.only(left: 15, top: 15)),
                    style: const TextStyle(
                        fontFamily: "Ubuntu",
                        color: Color.fromRGBO(91, 91, 126, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        'Дата рождения',
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
                          right: 200, left: 30, bottom: 30, top: 8),
                      child: TextFormField(
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15),
                              hintText: 'ДД.ММ.ГГГГ',
                              hintStyle: TextStyle(
                                  fontFamily: "Ubuntu",
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold)),
                          style: const TextStyle(
                              fontFamily: "Ubuntu",
                              color: Color.fromRGBO(91, 91, 126, 1),
                              fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          inputFormatters: [model.maskFormatter]),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 200),
                      child: Text(
                        'Пол',
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
                          right: 30, left: 200, bottom: 30, top: 8),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.only(left: 15),
                            hintText: 'МУЖ / ЖЕН',
                            hintStyle: TextStyle(
                                fontFamily: "Ubuntu",
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                        style: const TextStyle(
                            fontFamily: "Ubuntu",
                            color: Color.fromRGBO(91, 91, 126, 1),
                            fontWeight: FontWeight.bold),
                        maxLength: 3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        'Серия',
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
                          right: 200, left: 30, bottom: 30, top: 8),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.only(left: 15, top: 15)),
                        style: const TextStyle(
                            fontFamily: "Ubuntu",
                            color: Color.fromRGBO(91, 91, 126, 1),
                            fontWeight: FontWeight.bold),
                        maxLength: 4,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 200),
                      child: Text(
                        'Номер',
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
                          right: 30, left: 200, bottom: 30, top: 8),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            counterText: "",
                            contentPadding: EdgeInsets.only(left: 15, top: 15)),
                        style: const TextStyle(
                            fontFamily: "Ubuntu",
                            color: Color.fromRGBO(91, 91, 126, 1),
                            fontWeight: FontWeight.bold),
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Кем выдан',
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
                        contentPadding: EdgeInsets.only(left: 15, top: 15)),
                    style: const TextStyle(
                        fontFamily: "Ubuntu",
                        color: Color.fromRGBO(91, 91, 126, 1),
                        fontWeight: FontWeight.bold),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              width: 310,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 7),
                    )
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Image(image: AssetImage('images/facepass.png')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 10),
                    child: Text(
                      'Сфотографируйте лицевую сторону',
                      style:
                          TextStyle(color: Colors.black, fontFamily: "Ubuntu"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: 310,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 7),
                    )
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Image(image: AssetImage('images/backpass.png')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 10),
                    child: Text(
                      'Сфотографируйте обратную сторону',
                      style:
                          TextStyle(color: Colors.black, fontFamily: "Ubuntu"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 50,
              width: 310,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 7),
                    )
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Image(image: AssetImage('images/selfie.png')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 10),
                    child: Text(
                      'Сфотографируйтесь с паспортом',
                      style:
                          TextStyle(color: Colors.black, fontFamily: "Ubuntu"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(right: 220),
              child: Text(
                'Примечание:',
                style: TextStyle(
                    color: Colors.red,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Text(
                'За предоставление заведомо ложных данных, предусматривается наказание согласно действующего законодательства Республики Таджикистан.',
                style: TextStyle(color: Colors.grey, fontFamily: "Ubuntu"),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Checkbox(
                    checkColor: Colors.white,
                    value: model.passAgreeCheck,
                    onChanged: (bool? value) {
                      model.passAgree(value);
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 65, right: 30, top: 10),
                  child: Text(
                    'Я согласен(на) предоставить персональные данные для хранения и обработки.',
                    style: TextStyle(color: Colors.grey, fontFamily: "Ubuntu"),
                  ),
                ),
              ],
            ),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Text(
                'Адрес проживания',
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
                      AssetImage('images/icons/location.png'),
                      color: Color.fromRGBO(0, 89, 165, 1),
                    ),
                    focusColor: Colors.black,
                    hintText: 'Город, улица, дом, корпус, квартира',
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
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 10),
              child: Text(
                'Семейное положение',
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
                child: DropdownButton<String>(
                  value: model.dropdownValue,
                  icon: const ImageIcon(
                      AssetImage('images/icons/arrow_bottom.png'),
                      color: Color.fromRGBO(0, 89, 165, 1)),
                  isExpanded: true,
                  style: const TextStyle(
                      fontFamily: "Ubuntu",
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  underline: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  onChanged: (String? newValue) {
                    model.newValue(newValue);
                  },
                  items: <String>['В браке', 'Холост']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: model.sickCheck,
                          onChanged: (bool? value) {
                            model.sick(value);
                          }),
                      const Text(
                        'Хронические заболевания',
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: model.crimeCheck,
                          onChanged: (bool? value) {
                            model.crime(value);
                          }),
                      const Text(
                        'Судимости',
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
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
                                    index: 0,
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
      ],
    ),
  );
}
