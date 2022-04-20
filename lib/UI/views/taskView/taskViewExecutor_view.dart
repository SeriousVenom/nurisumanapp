import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurisuman/UI/views/taskView/taskViewMapCustomer_view.dart';
import 'package:nurisuman/UI/views/taskView/taskViewMapExecutor_view.dart';
import 'package:nurisuman/UI/views/taskView/taskView_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';

class TaskViewExecutorView extends StatelessWidget {
  const TaskViewExecutorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskViewViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => TaskViewViewModel(context),
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
                  body: _taskView(context, model),
                ),
              ));
        });
  }
}

_taskView(BuildContext context, TaskViewViewModel model) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
    child: ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 170,
                margin: const EdgeInsets.only(top: 8, bottom: 8, left: 15),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(1, 160, 226, 1),
                      Color.fromRGBO(104, 209, 253, 1),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 50, right: 50, top: 10, bottom: 10),
                    child: Text(
                      'Описание',
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TaskViewMapExecutorView()));
              },
              child: Container(
                width: 170,
                padding: const EdgeInsets.only(
                    left: 50, right: 50, top: 8, bottom: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 3, color: const Color.fromRGBO(1, 160, 226, 1)),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      'Карта',
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(1, 160, 226, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 15))
          ]),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20, top: 10, bottom: 10),
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        height: 30,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.lightBlue.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Название категории',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 89, 165, 1)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Container(
                          width: 45,
                          height: 47,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage('images/avatarSeller.png'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              'Заказчик',
                              style: TextStyle(
                                  color: Colors.grey, fontFamily: "Ubuntu"),
                            ),
                            Text(
                              'Иванов Владимир Сергеевич',
                              style: TextStyle(
                                  color: Color.fromRGBO(91, 91, 126, 1),
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ]),
                      const SizedBox(width: 25),
                      SvgPicture.asset('images/svg/points.svg')
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Separator(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Text(
                      'Душа моя озарена неземной радостью, как эти чудесные весенние утра, которыми я наслаждаюсь от всего сердца. Я совсем один и блаженствую в здешнем краю, словно созданном для таких, как я. Я так счастлив, мой друг, так упоен ощущением покоя, что искусство мое страдает от этого. Ни одного штриха не мог бы я сделать, а никогда не был таким большим художником, как в эти минуты. Когда от милой моей долины поднимается пар и полдневное солнце стоит над непроницаемой чащей темного леса и лишь редкий луч проскальзывает в его святая святых, а я лежу в высокой траве',
                      style: TextStyle(
                          color: Colors.grey.shade500, fontFamily: "Ubuntu"),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Separator(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 5, top: 5, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset('images/svg/wallet_02.svg'),
                        RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Цена: ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "Ubuntu")),
                              TextSpan(
                                  text: '500',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: "Ubuntu")),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Separator(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25, top: 5),
                    child: Text('Написать отклик',
                        style: TextStyle(
                            color: Colors.grey, fontFamily: "Ubuntu")),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.05),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    margin: const EdgeInsets.only(
                        right: 25, left: 25, bottom: 15, top: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Текст отлика',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding:
                            EdgeInsets.only(left: 15, right: 15, top: 15),
                        focusColor: Colors.black,
                      ),
                      maxLines: 5,
                      style: const TextStyle(
                          fontFamily: "Ubuntu",
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 60, right: 60),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(229, 67, 45, 1),
                            Color.fromRGBO(255, 150, 143, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 60, right: 60, top: 10, bottom: 10),
                          child: Text(
                            'ОТКЛИКНУТЬСЯ',
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}

_taskStatus(String image, String text) {
  return Stack(
    children: <Widget>[
      Image.asset(
        image,
        height: 72,
        width: 72,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 72, top: 20),
        child: Text(
          text,
          style: const TextStyle(
              color: Color.fromRGBO(91, 91, 126, 1),
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: "Ubuntu"),
        ),
      )
    ],
  );
}
