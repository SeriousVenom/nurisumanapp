import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurisuman/UI/views/addGood/addGood_view.dart';
import 'package:stacked/stacked.dart';

import '../order/orderCustomer_view.dart';
import '../order/orderSeller_view.dart';
import '../roleChoice/roleChoice_view.dart';
import '../widgets.dart';
import 'myOrders_viewmodel.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyOrdersViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => MyOrdersViewModel(context),
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
                  body: _myOrdersView(context, model),
                ),
              ));
        });
  }
}

_myOrdersView(BuildContext context, MyOrdersViewModel model) {
  return Stack(
    children: [
      Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
          child: ListView(
            padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  'Мои заказы',
                  style: TextStyle(
                      color: Color.fromRGBO(51, 62, 99, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              GridView.builder(
                  itemCount: model.name.length,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 10),
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        String? value = await storage.read(key: 'profileType');
                        if (value == 'Customer') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const OrderCustomerView()));
                        }
                        if (value == 'Seller') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const OrderSellerView()));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 15,
                              offset: const Offset(0, 15))
                        ]),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10)),
                                  image: DecorationImage(
                                      image: AssetImage(model.image[index]),
                                      fit: BoxFit.cover)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60),
                              child: Container(
                                height: 110,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    color: Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 5),
                                      child: Text(
                                        model.name[index],
                                        style: const TextStyle(
                                            color:
                                                Color.fromRGBO(91, 91, 126, 1),
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Ubuntu"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        model.price[index],
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Ubuntu"),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 10,
                                          bottom: 5),
                                      child: Separator(),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          model.names[index],
                                          style: const TextStyle(
                                            color: Colors.blue,
                                            fontSize: 12,
                                            fontFamily: "Ubuntu",
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                        SvgPicture.asset(
                                            'images/svg/points.svg')
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10, top: 5),
                                      child: Separator(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 5),
                                      child: Row(
                                        children: <Widget>[
                                          model.paid[index] == true
                                              ? Row(
                                                  children: <Widget>[
                                                    SvgPicture.asset(
                                                      'images/svg/credit_card.svg',
                                                      color: Colors
                                                          .greenAccent.shade700,
                                                    ),
                                                    Text(
                                                      'Оплачено',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors
                                                              .greenAccent
                                                              .shade700),
                                                    )
                                                  ],
                                                )
                                              : const SizedBox(),
                                          const SizedBox(width: 5),
                                          model.deliver[index] == true
                                              ? Row(
                                                  children: <Widget>[
                                                    SvgPicture.asset(
                                                      'images/svg/person_pin.svg',
                                                      color: Colors
                                                          .greenAccent.shade700,
                                                    ),
                                                    Text(
                                                      'Доставлено',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors
                                                              .greenAccent
                                                              .shade700),
                                                    )
                                                  ],
                                                )
                                              : const SizedBox()
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          )),
      model.sideMenu == true
          ? customSideMenu(context, model)
          : const SizedBox(),
    ],
  );
}
