import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';
import 'myPurchases_viewmodel.dart';

class MyPurchasesView extends StatelessWidget {
  const MyPurchasesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyPurchasesViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => MyPurchasesViewModel(context),
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

_goodsView(BuildContext context, MyPurchasesViewModel model) {
  return Stack(
    children: [
      Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
          child: ListView(
            padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
            children: <Widget>[
              GridView.builder(
                  itemCount: model.name.length,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 10),
                  padding: const EdgeInsets.only(top: 50, bottom: 40),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: model.status[index] == 'Активна'
                                    ? const LinearGradient(
                                        colors: [
                                          Color.fromRGBO(34, 208, 145, 1),
                                          Color.fromRGBO(172, 247, 202, 1),
                                        ],
                                      )
                                    : const LinearGradient(
                                        colors: [
                                          Color.fromRGBO(229, 67, 45, 1),
                                          Color.fromRGBO(255, 150, 143, 1),
                                        ],
                                      ),
                              ),
                              height: 15,
                              width: 60,
                              child: Center(
                                  child: Text(
                                model.status[index],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Ubuntu",
                                    fontSize: 10),
                              )),
                            ),
                          )
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
                            model.openFilter();
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
                              children: <Widget>[
                                SvgPicture.asset('images/svg/filter.svg'),
                                const SizedBox(width: 10),
                                const Text(
                                  'ФИЛЬТР',
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
          : Positioned(
              bottom: 50,
              child: _filterUp(
                model: model,
              )),
      model.sideMenu == true
          ? customSideMenu(context, model)
          : const SizedBox(),
    ],
  );
}

class _filterUp extends StatefulWidget {
  final model;

  const _filterUp({Key? key, this.model}) : super(key: key);

  @override
  State<_filterUp> createState() => _filterUpState(model);
}

class _filterUpState extends State<_filterUp> {
  final model;

  _filterUpState(this.model);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
            child: SizedBox(
              height: model.catExp == true
                  ? MediaQuery.of(context).size.height - 200
                  : MediaQuery.of(context).size.height - 500,
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
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor:
                            Colors.transparent, // here for close state
                        colorScheme: const ColorScheme.light(
                          primary: Colors.transparent,
                        ), // here for open state in replacement of deprecated accentColor
                        dividerColor: Colors
                            .transparent, // if you want to remove the border
                      ),
                      child: ExpansionTile(
                          tilePadding:
                              const EdgeInsets.only(left: 50, right: 10),
                          onExpansionChanged: (bool? value) {
                            model.catExpChange(value);
                          },
                          title: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: model.catExp == true
                                    ? const BorderRadius.only(
                                        topLeft: Radius.circular(6),
                                        topRight: Radius.circular(6))
                                    : BorderRadius.circular(6)),
                            child: Row(
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Все категории',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(51, 62, 99, 1),
                                        fontSize: 16),
                                  ),
                                ),
                                const SizedBox(width: 130),
                                model.catExp == true
                                    ? SvgPicture.asset(
                                        'images/svg/arrow_drop_down_circle.svg')
                                    : SvgPicture.asset(
                                        'images/svg/arrow_drop_down.svg')
                              ],
                            ),
                          ),
                          children: [_allCat(context, model)]),
                    ),
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
                      margin:
                          const EdgeInsets.only(top: 20, left: 55, right: 55),
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
}

_allCat(context, model) {
  return Container(
    margin: const EdgeInsets.only(left: 50, right: 50),
    height: 300,
    color: Colors.white,
    child: MediaQuery.removePadding(
      removeTop: true,
      removeBottom: true,
      context: context,
      child: RawScrollbar(
        trackVisibility: true,
        thumbVisibility: true,
        thumbColor: Colors.lightBlue,
        radius: const Radius.circular(30),
        thickness: 6,
        child: ListView(
          padding: const EdgeInsets.only(top: 0, bottom: 0),
          shrinkWrap: true,
          children: <Widget>[
            ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: model.cat.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor:
                              Colors.black, // here for close state
                          colorScheme: const ColorScheme.light(
                            primary: Colors.black,
                          ), // here for open state in replacement of deprecated accentColor
                          dividerColor: Colors
                              .transparent, // if you want to remove the border
                        ),
                        child: ExpansionTile(
                          tilePadding:
                              const EdgeInsets.only(right: 55, left: 15),
                          title: Text(
                            model.cat[index],
                            style: const TextStyle(
                                color: Color.fromRGBO(91, 91, 126, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          children: <Widget>[
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                shrinkWrap: true,
                                itemCount: model.subCat.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            model.subCat[index],
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    137, 146, 155, 1)),
                                          ),
                                          const SizedBox(height: 5)
                                        ]),
                                  );
                                })
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    ),
  );
}
