import 'dart:async';
import 'package:flutter/material.dart';

import 'login/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginView())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg.png'),
              fit: BoxFit.cover), //установка фона
        ),
        child: Container(
            margin: const EdgeInsets.all(60),
            child: Image.asset('images/logo_splash.png')));
  }
}
