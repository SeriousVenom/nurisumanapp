import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nurisuman/UI/views/createProfile/createProfileExecutor_view.dart';
import 'package:nurisuman/UI/views/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../sizeconfig.dart';
import '../accountEnterExit/accountEnterExit_view.dart';
import '../roleChoice/roleChoice_view.dart';

class LoginViewRoute extends MaterialPageRoute {
  LoginViewRoute() : super(builder: (context) => const LoginView());
}

final phoneController = TextEditingController();
final passwordController = TextEditingController();

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(context),
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
                  body: _loginWidget(context, model),
                ),
              ));
        });
  }
}

_loginWidget(context, LoginViewModel model) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage('images/bg.png'),
          fit: BoxFit.cover), //установка фона
    ),
    child: ListView(
      children: <Widget>[
        const Image(
          image: AssetImage('images/logotype.png'),
          height: 138,
        ),
        const SizedBox(height: 20),
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
              blurRadius: 6,
              offset: const Offset(0, 25),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 30),
                        child: Text(
                          'Введите номер телефона',
                          style: TextStyle(
                              fontFamily: "Ubuntu",
                              color: Colors.grey.shade500),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            right: 30, left: 30, bottom: 30, top: 8),
                        color: Colors.grey.withOpacity(0.05),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 15, top: 15),
                              suffixIcon: ImageIcon(
                                AssetImage('images/phone.png'),
                                color: Color.fromRGBO(0, 89, 165, 1),
                              ),
                              focusColor: Colors.black,
                              hintText: '+7 (___) ___-___-__',
                              hintStyle: TextStyle(
                                  fontFamily: "Ubuntu",
                                  color: Color.fromRGBO(91, 91, 126, 1),
                                  fontWeight: FontWeight.bold)),
                          style: const TextStyle(
                              fontFamily: "Ubuntu",
                              color: Color.fromRGBO(91, 91, 126, 1),
                              fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          inputFormatters: [model.maskFormatter],
                          controller: phoneController,
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 50,
                          width: 300,
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
                                model.sendSMS();
                              },
                              child: Text(
                                model.id == 0
                                    ? 'Получить код по смс'
                                    : 'Получить код по смс еще раз',
                                style: const TextStyle(
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
                      const SizedBox(height: 20.0)
                    ],
                  ),
                  model.id == 1
                      ? Padding(
                          padding: const EdgeInsets.only(left: 100, bottom: 50),
                          child: _popupMessage(model))
                      : const SizedBox()
                  //здесь будет popup
                ],
              )),
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 8),
            )
          ]),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: const EdgeInsets.all(10),
              shadowColor: Colors.white.withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 30),
                    child: Text(
                      'Введите код из смс',
                      style: TextStyle(
                          fontFamily: "Ubuntu", color: Colors.grey.shade500),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        right: 30, left: 30, bottom: 30, top: 8),
                    color: Colors.grey.withOpacity(0.05),
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween, // added line
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              passwordController.text != ''
                                  ? IconButton(
                                      onPressed: () {
                                        model.isVisiblePassword();
                                      },
                                      icon: ImageIcon(model.isObscure
                                          ? const AssetImage(
                                              'images/eye-closed.png')
                                          : const AssetImage('images/eye.png')))
                                  : const SizedBox(),
                              const ImageIcon(AssetImage('images/key.png'),
                                  color: Color.fromRGBO(0, 89, 165, 1)),
                            ],
                          ),
                          contentPadding:
                              const EdgeInsets.only(left: 15, top: 15),
                          hintText: '••••••',
                          hintStyle: const TextStyle(
                              letterSpacing: 5.0,
                              fontFamily: "Ubuntu",
                              color: Color.fromRGBO(91, 91, 126, 1),
                              fontWeight: FontWeight.bold)),
                      style: const TextStyle(
                          letterSpacing: 5.0,
                          fontFamily: "Ubuntu",
                          color: Color.fromRGBO(91, 91, 126, 1),
                          fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      controller: passwordController,
                      obscureText: model.isObscure,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                        gradient: passwordController.text != ''
                            ? const LinearGradient(
                                colors: [
                                  Color.fromRGBO(229, 67, 45, 1),
                                  Color.fromRGBO(255, 150, 143, 1),
                                ],
                              )
                            : const LinearGradient(
                                colors: [
                                  Color.fromRGBO(187, 149, 144, 1),
                                  Color.fromRGBO(218, 189, 187, 1),
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
                                    builder: (context) =>
                                        const AccountEnterExitView()));
                          },
                          child: const Text(
                            'войти',
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
                  const SizedBox(height: 20.0)
                ],
              )),
        ),
      ],
    ),
  );
}

_popupMessage(LoginViewModel model) {
  return Stack(
    children: [
      Container(
        height: 70,
        width: 230,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 5, right: 10),
              child: Text(
                'Не приходит код?',
                style: TextStyle(color: Colors.white, fontFamily: "Ubuntu"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 10),
              child: Text(
                'Нажмите кнопку “Получить смс еще раз”',
                style: TextStyle(color: Colors.white, fontFamily: "Ubuntu"),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 203, top: 2),
        child: GestureDetector(
          onTap: () {
            model.closeMessage();
          },
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 58, left: 110),
        child: ImageIcon(
          AssetImage('images/polygon.png'),
          color: Color.fromRGBO(50, 193, 159, 1),
        ),
      )
    ],
  );
}
