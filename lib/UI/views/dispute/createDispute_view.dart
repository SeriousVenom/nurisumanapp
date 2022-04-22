import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';
import 'dispute_viewmodel.dart';

class CreateDisputeView extends StatelessWidget {
  const CreateDisputeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DisputeViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => DisputeViewModel(context),
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
                  body: _createDisputeView(context, model),
                ),
              ));
        });
  }
}

_createDisputeView(BuildContext context, DisputeViewModel model) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
    child: ListView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(0, 15))
              ]),
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage('images/earpods.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              const SizedBox(width: 10),
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 25,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.shade900.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'Заказ № 123456789',
                            style: TextStyle(
                                fontFamily: "Ubuntu",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Наушники Earpods',
                        style: TextStyle(
                            color: Color.fromRGBO(91, 91, 126, 1),
                            fontFamily: "Ubuntu",
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '500 р',
                        style: TextStyle(
                            color: Colors.blue,
                            fontFamily: "Ubuntu",
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Продавец: Иван Иванович Иванов',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontFamily: "Ubuntu",
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 2,
                        top: MediaQuery.of(context).size.height / 11),
                    child: SvgPicture.asset('images/svg/points.svg'),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
