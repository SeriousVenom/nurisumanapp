import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurisuman/UI/views/profile/profileCustomer_view.dart';
import 'package:nurisuman/UI/views/profile/profileExecutor_view.dart';
import 'package:nurisuman/UI/views/profile/profileSeller_view.dart';

import 'login/login_view.dart';

class LoadingScreen extends StatefulWidget {
  var index;

  LoadingScreen({Key? key, this.index}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState(index: index);
}

class _MyHomePageState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  var index;
  _MyHomePageState({this.index});

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _controller!.forward();
    super.initState();

    index == 0
        ? Timer(
            const Duration(seconds: 2),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ProfileExecutorView())))
        : null;
    index == 1
        ? Timer(
            const Duration(seconds: 2),
            () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileCustomerView())))
        : null;
    index == 2
        ? Timer(
            const Duration(seconds: 2),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ProfileSellerView())))
        : null;
  }

  AnimationController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg.png'),
              fit: BoxFit.cover), //установка фона
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  blurRadius: 15,
                  offset: const Offset(0, 20),
                )
              ]),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Ожидайте.',
                        style: TextStyle(
                            color: Color.fromRGBO(91, 91, 126, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50, right: 50, bottom: 40),
                      child: Text(
                        'Ваши данные находятся на проверке.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(91, 91, 126, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: AnimatedBuilder(
                            animation: _controller!.view,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: _controller!.value * 50 * pi,
                                child: child,
                              );
                            },
                            child: SvgPicture.asset('images/svg/load_1.svg'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: AnimatedBuilder(
                            animation: _controller!.view,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: _controller!.value * 50 * pi,
                                child: child,
                              );
                            },
                            child: SvgPicture.asset('images/svg/load_2.svg'),
                          ),
                        ),
                        AnimatedBuilder(
                            animation: _controller!.view,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: _controller!.value * 50 * -pi,
                                child: child,
                              );
                            },
                            child: SvgPicture.asset('images/svg/load_3.svg'))
                      ],
                    ),
                    const SizedBox(height: 20)
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
