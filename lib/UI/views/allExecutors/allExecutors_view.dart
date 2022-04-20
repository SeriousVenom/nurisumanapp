import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurisuman/UI/views/allExecutors/allExecutors_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';

class AllExecutorsViewRoute extends MaterialPageRoute {
  AllExecutorsViewRoute()
      : super(builder: (context) => const AllExecutorsView());
}

class AllExecutorsView extends StatelessWidget {
  const AllExecutorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AllExecutorsViewModel>.reactive(
      viewModelBuilder: () => AllExecutorsViewModel(context),
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
                body: _executorsWidget(context, model),
              ),
            ));
      },
    );
  }
}

_executorsWidget(BuildContext context, AllExecutorsViewModel model) {
  return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
      child: Stack(
        children: [
          ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 15,
                      offset: const Offset(0, 20),
                    )
                  ]),
                  child: SizedBox(
                    height: 50,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(bottom: 15),
                              prefixIconConstraints: const BoxConstraints(
                                minWidth: 40,
                                minHeight: 40,
                              ),
                              prefixIcon: SvgPicture.asset(
                                'images/svg/search.svg',
                              ),
                              focusColor: Colors.black,
                              hintText: 'Введите ФИО',
                              hintStyle: const TextStyle(
                                  fontFamily: "Ubuntu", color: Colors.grey)),
                          style: const TextStyle(
                            fontFamily: "Ubuntu",
                            color: Color.fromRGBO(91, 91, 126, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  itemCount: model.executorNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          blurRadius: 15,
                          offset: const Offset(0, 20),
                        )
                      ]),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Image.asset(model.executorAvatars[index],
                                  width: 65, height: 62),
                              Padding(
                                padding: const EdgeInsets.only(left: 70),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            model.executorNames[index],
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    91, 91, 126, 1),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0),
                                          ),
                                        ),
                                        SvgPicture.asset(
                                            'images/svg/points.svg')
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    const Separator(),
                                    const SizedBox(height: 5),
                                    Text(
                                      model.executorDesc[index],
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(137, 146, 155, 1)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 100),
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width: 180,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromRGBO(1, 160, 226, 1),
                                          Color.fromRGBO(104, 209, 253, 1)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25.0),
                                      ),
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: const Text(
                                          'Написать',
                                          style: TextStyle(
                                            fontFamily: "Ubuntu",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
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
                    );
                  }),
            ],
          ),
          model.filterOpen == false
              ? Positioned(
                  bottom: 10,
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
              : Positioned(bottom: 50, child: _filterUp(model, context)),
          model.sideMenu == true
              ? customSideMenu(context, model)
              : const SizedBox(),
        ],
      ));
}

_filterUp(AllExecutorsViewModel model, context) {
  return Stack(
    children: [
      ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 200,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Сортировать по рейтингу:',
                      style: TextStyle(
                          color: Color.fromRGBO(91, 91, 126, 1), fontSize: 16),
                    ),
                    Image.asset(
                      'images/icons/up.png',
                      scale: 3,
                    ),
                    Image.asset(
                      'images/icons/down.png',
                      scale: 3,
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    'Фильтровать по категории',
                    style: TextStyle(
                        fontFamily: "Ubuntu",
                        color: Color.fromRGBO(91, 91, 126, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.filterCat.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: <Widget>[
                          ExpansionTile(
                            title: Row(
                              children: [
                                Checkbox(
                                  value: model.catCheck[index],
                                  onChanged: (bool? value) {
                                    model.catCheckValue(index, value!);
                                  },
                                ),
                                Text(
                                  model.filterCat[index],
                                  style: const TextStyle(
                                      color: Color.fromRGBO(91, 91, 126, 1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            children: <Widget>[
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  shrinkWrap: true,
                                  itemCount: model.filterSubCat.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              model.filterSubCat[index],
                                              style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      137, 146, 155, 1)),
                                            ),
                                            const SizedBox(height: 5)
                                          ]),
                                    );
                                  })
                            ],
                          )
                        ],
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
