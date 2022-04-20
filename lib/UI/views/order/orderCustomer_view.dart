import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../widgets.dart';
import 'order_viewmodel.dart';

class OrderCustomerView extends StatelessWidget {
  const OrderCustomerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrderViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => OrderViewModel(context),
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
                  body: _orderView(context, model),
                ),
              ));
        });
  }
}

_orderView(BuildContext context, OrderViewModel model) {
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
              ListView.builder(
                  padding: const EdgeInsets.only(bottom: 10),
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: model.seller.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15,
                                offset: Offset(0, 15))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                        image: AssetImage('images/earpods.png'),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    model.name[index],
                                    style: const TextStyle(
                                      color: Color.fromRGBO(91, 91, 126, 1),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Ubuntu",
                                    ),
                                  ),
                                  Text(
                                    model.price[index],
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "Ubuntu",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'Продавец:',
                                    style: TextStyle(
                                        color: Color.fromRGBO(91, 91, 126, 1),
                                        fontFamily: "Ubuntu"),
                                  ),
                                  Text(
                                    model.seller[index],
                                    style: const TextStyle(
                                        color: Color.fromRGBO(91, 91, 126, 1),
                                        fontFamily: "Ubuntu"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Separator(),
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Text(
                                  model.desc[index],
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontFamily: "Ubuntu",
                                      fontSize: 12),
                                ),
                              ),
                              const Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_drop_down))
                            ],
                          )
                        ],
                      ),
                    );
                  }),
              Text(
                'Продавец:',
                style: TextStyle(
                    color: Colors.grey.shade600, fontFamily: "Ubuntu"),
              ),
              Stack(
                children: <Widget>[
                  const Text(
                    'Иван Иванович Иванов',
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "Ubuntu",
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset('images/svg/points.svg'))
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Статус заказа:',
                style: TextStyle(
                    color: Colors.grey.shade600, fontFamily: "Ubuntu"),
              ),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.greenAccent.shade400,
                            value: model.process,
                            onChanged: (bool? value) {
                              model.processCheck(value!);
                            },
                          ),
                          SvgPicture.asset(
                            'images/svg/refresh.svg',
                            color: Colors.greenAccent.shade400,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'В обработке',
                            style: TextStyle(
                                color: Colors.greenAccent.shade400,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.greenAccent.shade400,
                            value: model.send,
                            onChanged: (bool? value) {
                              model.sendCheck(value!);
                            },
                          ),
                          SvgPicture.asset(
                            'images/svg/send.svg',
                            color: Colors.greenAccent.shade400,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Отправлено',
                            style: TextStyle(
                                color: Colors.greenAccent.shade400,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.greenAccent.shade400,
                            value: model.paid,
                            onChanged: (bool? value) {
                              model.paidCheck(value!);
                            },
                          ),
                          SvgPicture.asset(
                            'images/svg/credit_card.svg',
                            color: Colors.greenAccent.shade400,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Оплачено',
                            style: TextStyle(
                                color: Colors.greenAccent.shade400,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.greenAccent.shade400,
                            value: model.delivered,
                            onChanged: (bool? value) {
                              model.deliveredCheck(value!);
                            },
                          ),
                          SvgPicture.asset(
                            'images/svg/person_pin.svg',
                            color: Colors.greenAccent.shade400,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Доставлено',
                            style: TextStyle(
                                color: Colors.greenAccent.shade400,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  SvgPicture.asset('images/svg/place.svg'),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Адрес доставки: ',
                            style: TextStyle(
                                color: Colors.grey, fontFamily: "Ubuntu")),
                        TextSpan(
                            text: 'г. Тула, пр. Ленина, д. 70, кв. 25',
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            )),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  SvgPicture.asset('images/svg/account_balance_wallet.svg'),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'Способ оплаты: ',
                            style: TextStyle(
                                color: Colors.grey, fontFamily: "Ubuntu")),
                        TextSpan(
                            text: 'Безналичный расчет',
                            style: TextStyle(
                              fontFamily: "Ubuntu",
                              color: Colors.greenAccent.shade400,
                            )),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 7),
                    )
                  ],
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(229, 67, 45, 1),
                      Color.fromRGBO(255, 150, 143, 1)
                    ],
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'ПОДТВЕРДИТЬ ДОСТАВКУ',
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 50, right: 50),
                height: 60,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 7),
                    )
                  ],
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(34, 208, 145, 1),
                      Color.fromRGBO(172, 247, 202, 1)
                    ],
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Открыть спор',
                      style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          )),
      model.sideMenu == true
          ? customSideMenu(context, model)
          : const SizedBox(),
    ],
  );
}
