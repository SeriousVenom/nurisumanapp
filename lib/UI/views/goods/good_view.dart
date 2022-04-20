import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';
import 'goods_viewmodel.dart';

class GoodView extends StatelessWidget {
  const GoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GoodsViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => GoodsViewModel(context),
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
                  body: _goodView(context, model),
                ),
              ));
        });
  }
}

_goodView(BuildContext context, GoodsViewModel model) {
  return Stack(
    children: [
      Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
          child: ListView(
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 177,
                    width: 164,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage('images/earpods.png'),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Наушники Earpods',
                            style: TextStyle(
                                color: Color.fromRGBO(51, 62, 99, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            '500 р',
                            style: TextStyle(
                                color: Colors.blue,
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                blurRadius: 15,
                                offset: const Offset(0, 15))
                          ]),
                          child: Row(
                            children: <Widget>[
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(185, 185, 203, 1),
                                      Color.fromRGBO(239, 239, 250, 1)
                                    ],
                                  ),
                                ),
                                height: 30,
                                width: 35,
                                child: const Center(
                                    child: Text(
                                  '-',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Ubuntu",
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                              Container(
                                color: Colors.white,
                                height: 30,
                                width: 40,
                                child: const Center(
                                    child: Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Ubuntu",
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(185, 185, 203, 1),
                                      Color.fromRGBO(239, 239, 250, 1)
                                    ],
                                  ),
                                ),
                                height: 30,
                                width: 35,
                                child: const Center(
                                    child: Text(
                                  '+',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Ubuntu",
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 150,
                          height: 20,
                          child: Separator(),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Информация о продавце',
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: "Ubuntu",
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 33,
                              width: 33,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: const DecorationImage(
                                      image: AssetImage('images/earpods.png'),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 33,
                              width: 33,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: const DecorationImage(
                                      image: AssetImage('images/earpods.png'),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 33,
                              width: 33,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: const DecorationImage(
                                      image: AssetImage('images/earpods.png'),
                                      fit: BoxFit.cover)),
                            ),
                            GestureDetector(
                              child: const Icon(
                                Icons.arrow_back,
                                color: Color.fromRGBO(168, 176, 198, 1),
                              ),
                            ),
                            GestureDetector(
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Color.fromRGBO(51, 62, 99, 1),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'В своём стремлении повысить качество жизни, они забывают, что дальнейшее развитие различных форм деятельности является качественно новой ступенью поставленных обществом задач. Как принято считать, сторонники тоталитаризма в науке являются только методом политического участия и смешаны с не уникальными данными до степени совершенной неузнаваемости, из-за чего возрастает их статус бесполезности. Как уже неоднократно упомянуто, тщательные исследования конкурентов набирают популярность среди определенных слоев населения, а значит, должны быть призваны к ответу.',
                style: TextStyle(
                    color: Colors.grey.shade600, fontFamily: "Ubuntu"),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  'В своём стремлении повысить качество жизни, они забывают, что дальнейшее развитие различных форм деятельности является качественно новой ступенью поставленных обществом задач. Как принято считать, сторонники тоталитаризма в науке являются только методом политического участия и смешаны с не уникальными данными до степени совершенной неузнаваемости, из-за чего возрастает их статус бесполезности. Как уже неоднократно упомянуто, тщательные исследования конкурентов набирают популярность среди определенных слоев населения, а значит, должны быть призваны к ответу.',
                  style: TextStyle(
                      color: Colors.grey.shade600, fontFamily: "Ubuntu")),
              Container(
                height: 40,
                margin: const EdgeInsets.only(left: 80, right: 80, top: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue.shade900.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 15))
                  ],
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(229, 67, 45, 1),
                      Color.fromRGBO(255, 150, 143, 1)
                    ],
                  ),
                ),
                child: const Center(
                    child: Text(
                  'КУПИТЬ',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold),
                )),
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.only(left: 80, right: 80, top: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue.shade900.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 15))
                  ],
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 89, 165, 1),
                      Color.fromRGBO(1, 160, 226, 1)
                    ],
                  ),
                ),
                child: const Center(
                    child: Text(
                  'НАПИСАТЬ',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          )),
      model.sideMenu == true
          ? customSideMenu(context, model)
          : const SizedBox(),
    ],
  );
}
