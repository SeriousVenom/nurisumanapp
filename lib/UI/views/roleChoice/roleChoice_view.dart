import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nurisuman/UI/views/createProfile/createProfileExecutor_view.dart';
import 'package:nurisuman/UI/views/createProfile/createProfileSeller_view.dart';
import 'package:nurisuman/UI/views/widgets.dart';
import 'package:stacked/stacked.dart';

import '../createProfile/createProfileCustomer_view.dart';
import '../createProfile/createProfileExecutor_view.dart';
import 'roleChoice_viewmodel.dart';

const storage = FlutterSecureStorage();

class RoleChoiceViewRoute extends MaterialPageRoute {
  RoleChoiceViewRoute() : super(builder: (context) => const RoleChoiceView());
}

class RoleChoiceView extends StatelessWidget {
  const RoleChoiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RoleViewModel>.reactive(
        viewModelBuilder: () => RoleViewModel(context),
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
                  body: _roleChoice(context, model),
                ),
              ));
        });
  }
}

const List<String> texts = <String>[
  "Я исполнитель",
  "Я заказчик",
  "Я продавец"
];

const List<String> images = <String>[
  'images/freelancer.png',
  'images/buyer.png',
  'images/seller.png'
];

_roleChoice(context, RoleViewModel model) {
  return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
      child: ListView(shrinkWrap: false, children: <Widget>[
        Image.asset('images/logotype.png'),
        const Padding(
          padding: EdgeInsets.only(left: 80, right: 80),
          child: Text(
            'Для удобства дальнейшего использования приложения выберите роль пользователя.',
            style: TextStyle(color: Colors.grey, fontFamily: "Ubuntu"),
            textAlign: TextAlign.center,
          ),
        ),
        Stack(
          children: [
            ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                itemCount: texts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          blurRadius: 15,
                          offset: const Offset(0, 20),
                        )
                      ]),
                      height: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        shadowColor: Colors.white.withOpacity(0.1),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset(images[index]),
                              Text(
                                texts[index],
                                style: const TextStyle(
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(229, 67, 45, 1),
                                        Color.fromRGBO(225, 150, 143, 1),
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
                                    onTap: () async {
                                      //index == 1 ? model.choiceRole() : null;
                                      if (index == 0) {
                                        await storage.write(
                                            key: 'profileType',
                                            value: 'Executor');
                                        model.typeProfile(context, 'Executor');
                                        model.choiceExecutor(context);
                                      }
                                      if (index == 1) {
                                        await storage.write(
                                            key: 'profileType',
                                            value: 'Customer');

                                        model.typeProfile(context, 'Customer');
                                        model.choiceCustomer(context);
                                      }

                                      if (index == 2) {
                                        await storage.write(
                                            key: 'profileType',
                                            value: 'Seller');

                                        model.typeProfile(context, 'Seller');
                                        model.choiceSeller(context);
                                      }
                                    },
                                    child: const Text(
                                      'Выбрать',
                                      style: TextStyle(
                                        fontFamily: "Ubuntu",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            model.id == 1
                ? Padding(
                    padding: const EdgeInsets.only(left: 200, top: 90),
                    child: _popupMessage(model))
                : const SizedBox()
          ],
        ),
      ]));
}

_popupMessage(RoleViewModel model) {
  return Stack(
    children: [
      Container(
        height: 70,
        width: 180,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(50, 193, 159, 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 7),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: RichText(
              text: const TextSpan(children: <TextSpan>[
            TextSpan(
                text: 'Уважаемый пользователь, вы не зарегистрированны в роли ',
                style: TextStyle(fontSize: 12)),
            TextSpan(
                text: 'Я заказчик.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          ])),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 160),
        child: GestureDetector(
          onTap: () {
            model.closeMessage();
          },
          child: const Icon(
            Icons.close,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 58, left: 90),
        child: ImageIcon(
          AssetImage('images/polygon.png'),
          color: Color.fromRGBO(50, 193, 159, 1),
        ),
      )
    ],
  );
}
