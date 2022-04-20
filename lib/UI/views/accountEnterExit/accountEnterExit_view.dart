import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import '../login/login_view.dart';
import '../roleChoice/roleChoice_view.dart';
import 'accountEnterExit_viewmodel.dart';

class AccountEnterExitRoute extends MaterialPageRoute {
  AccountEnterExitRoute()
      : super(builder: (context) => const AccountEnterExitView());
}

class AccountEnterExitView extends StatelessWidget {
  const AccountEnterExitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountEnterExitModel>.reactive(
        viewModelBuilder: () => AccountEnterExitModel(context),
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
                  body: _enterExitWidget(context, model),
                ),
              ));
        });
  }
}

_enterExitWidget(context, AccountEnterExitModel model) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('images/bg.png'),
          fit: BoxFit.cover), //установка фона
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: ListView(
        children: <Widget>[
          const Image(
            image: AssetImage('images/logotype.png'),
            height: 138,
          ),
          const SizedBox(height: 40),
          const Text(
            'Вход',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Ubuntu",
                color: Color(0xff333E63),
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 15,
                offset: const Offset(0, 18),
              )
            ]),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                shadowColor: Colors.white.withOpacity(0.1),
                margin: const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const ImageIcon(
                                AssetImage('images/phone.png'),
                                color: Color.fromRGBO(0, 89, 165, 1),
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                phoneController.text,
                                style: const TextStyle(
                                    fontFamily: "Ubuntu",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(91, 91, 126, 1)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              right: 30, left: 30, bottom: 30, top: 8),
                          color: Colors.grey.withOpacity(0.05),
                        ),
                        Center(
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(229, 67, 45, 1),
                                    Color.fromRGBO(255, 150, 143, 1),
                                  ],
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(25.0),
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
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RoleChoiceView()));
                                },
                                child: const Text(
                                  'Войти',
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
                        const SizedBox(height: 30.0),
                        Center(
                          child: Container(
                            height: 50,
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
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginView()));
                                },
                                child: const Text(
                                  'Выход',
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
                        const SizedBox(height: 40.0)
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    ),
  );
}
