import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurisuman/UI/views/push/push_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';

class PushView extends StatelessWidget {
  const PushView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PushViewModel>.reactive(
        viewModelBuilder: () => PushViewModel(context),
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
                  body: _pushWidget(context, model),
                ),
              ));
        });
  }
}

_pushWidget(BuildContext context, PushViewModel model) {
  return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
      child: Stack(
        children: [
          ListView.builder(
              padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
              itemCount: model.pushNames.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 76,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 15,
                      offset: const Offset(0, 25),
                    )
                  ]),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blue.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        padding: const EdgeInsets.only(left: 8),
                                        height: 40,
                                        width: 90,
                                        child: Center(
                                            child: Text(
                                          model.pushData[index],
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  91, 91, 126, 1),
                                              fontWeight: FontWeight.bold),
                                        ))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child:
                                        SvgPicture.asset('images/svg/horn.svg'),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                  child: Text(
                                model.pushNames[index],
                                style: TextStyle(
                                    fontFamily: "Ubuntu",
                                    color: Colors.blue.shade700,
                                    decoration: TextDecoration.underline),
                              ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
          model.sideMenu == true
              ? customSideMenu(context, model)
              : const SizedBox(),
        ],
      ));
}
