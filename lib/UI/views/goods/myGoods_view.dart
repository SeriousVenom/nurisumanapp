import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurisuman/UI/views/addGood/addGood_view.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';
import 'goods_viewmodel.dart';

class MyGoodsView extends StatelessWidget {
  const MyGoodsView({Key? key}) : super(key: key);

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
                  body: _goodsView(context, model),
                ),
              ));
        });
  }
}

_goodsView(BuildContext context, GoodsViewModel model) {
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
                  'Мои товары',
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
                    return Container(
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
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 5),
                                    child: Text(
                                      model.name[index],
                                      style: const TextStyle(
                                          color: Color.fromRGBO(91, 91, 126, 1),
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      model.desc[index],
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                          fontFamily: "Ubuntu"),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: Separator(),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Информация о продавце',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline,
                                            fontFamily: "Ubuntu"),
                                      ),
                                      const SizedBox(width: 10),
                                      SvgPicture.asset('images/svg/points.svg')
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          )),
      model.filterOpen == false
          ? Positioned(
              bottom: 20,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: 140,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white.withOpacity(0.1),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddGoodView()));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 25),
                            height: 50,
                            width: 180,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(255, 150, 143, 1),
                                  Color.fromRGBO(229, 67, 45, 1)
                                ],
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(
                                  Icons.add_circle_outline,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'ДОБАВИТЬ ТОВАР',
                                  style: TextStyle(
                                    fontFamily: "Ubuntu",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Positioned(bottom: 50, child: _filterUp(model, context)),
      model.sideMenu == true
          ? customSideMenu(context, model)
          : const SizedBox(),
    ],
  );
}

_filterUp(GoodsViewModel model, context) {
  return Stack(
    children: <Widget>[
      ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 400,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              padding: const EdgeInsets.only(top: 20),
              children: [
                GestureDetector(
                  onTap: () {
                    model.closeFilter();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 4,
                        left: MediaQuery.of(context).size.width / 4),
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 3,
                          color: const Color.fromRGBO(229, 67, 45, 1)),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          'images/svg/filter.svg',
                          color: const Color.fromRGBO(229, 67, 45, 1),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'ФИЛЬТР',
                          style: TextStyle(
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(229, 67, 45, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'images/image.png',
                            width: 40,
                          ),
                        ),
                        const Text(
                          'Категория',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(51, 62, 99, 1),
                              fontSize: 16),
                        ),
                        const SizedBox(width: 120),
                        Icon(
                          Icons.arrow_drop_down_circle,
                          color: Colors.blue.shade700,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    'Фильтровать по цене:',
                    style: TextStyle(
                        color: Colors.grey.shade600, fontFamily: "Ubuntu"),
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50, right: 50, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text(
                            '10',
                            style: TextStyle(
                                color: Color.fromRGBO(51, 62, 99, 1),
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '1 000 000',
                            style: TextStyle(
                                color: Color.fromRGBO(51, 62, 99, 1),
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: Slider(
                          value: model.sliderPrice,
                          thumbColor: Colors.greenAccent,
                          activeColor: const Color.fromRGBO(149, 240, 192, 1),
                          inactiveColor: Colors.white,
                          max: 1000000,
                          onChanged: (value) {
                            model.sliderFilter(value);
                          }),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Сортировать по рейтингу:',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const SizedBox(width: 20),
                      Image.asset(
                        'images/icons/up.png',
                        scale: 3,
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        'images/icons/down.png',
                        scale: 3,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    model.closeFilter();
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(top: 20, left: 55, right: 55),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 15,
                            offset: const Offset(0, 15))
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(1, 160, 226, 1),
                          Color.fromRGBO(104, 209, 253, 1),
                        ],
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Применить',
                          style: TextStyle(
                            fontFamily: "Ubuntu",
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
