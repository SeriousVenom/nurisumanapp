import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../createTask/createTask_view.dart';
import '../taskView/taskViewCustomer_view.dart';
import '../widgets.dart';
import 'myTasks_viewmodel.dart';

class MyTasksCustomerView extends StatelessWidget {
  const MyTasksCustomerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyTasksViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => MyTasksViewModel(context),
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
                  body: _myTasksView(context, model),
                ),
              ));
        });
  }
}

_myTasksView(BuildContext context, MyTasksViewModel model) {
  return Stack(
    children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            ListView(
              children: <Widget>[
                Center(
                  child: GestureDetector(
                    onTap: () {
                      model.openFilter();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 15),
                      height: 35,
                      width: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade700.withOpacity(0.15),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 7),
                          )
                        ],
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(0, 89, 165, 1),
                            Color.fromRGBO(1, 160, 226, 1)
                          ],
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset('images/svg/filter.svg'),
                            const SizedBox(width: 10),
                            const Text(
                              'Фильтр моих заданий',
                              style: TextStyle(
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    itemCount: model.catName.length,
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
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20, top: 10, bottom: 5),
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.lightBlue.withOpacity(0.08),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 10, top: 10, bottom: 5),
                                    height: 30,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.lightBlue.withOpacity(0.08),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Название категории',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  0, 89, 165, 1)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                    height: 50,
                                    child:
                                        taskStatus(taskWork[0], taskWork[1])),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Separator(),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  model.desc[index],
                                  style: const TextStyle(
                                      color: Colors.grey, fontFamily: "Ubuntu"),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Separator(),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(top: 15),
                                      height: 35,
                                      width: 140,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromRGBO(185, 185, 203, 1),
                                            Color.fromRGBO(239, 239, 250, 1)
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              SvgPicture.asset(
                                                  'images/svg/bin.svg'),
                                              const SizedBox(width: 10),
                                              const Text(
                                                'Удалить',
                                                style: TextStyle(
                                                  fontFamily: "Ubuntu",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(
                                                      51, 62, 99, 1),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Container(
                                      margin: const EdgeInsets.only(top: 15),
                                      height: 35,
                                      width: 140,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromRGBO(1, 160, 226, 1),
                                            Color.fromRGBO(104, 209, 253, 1)
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const TaskViewCustomerView()));
                                          },
                                          child: const Center(
                                            child: Text(
                                              'Посмотреть',
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
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
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
                                          builder: (context) =>
                                              const CreateTaskView()));
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
                                  child: const Center(
                                    child: Text(
                                      'СОЗДАТЬ ЗАДАНИЕ',
                                      style: TextStyle(
                                        fontFamily: "Ubuntu",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
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
                  )
                : Positioned(bottom: 60, child: _filterUp(model, context)),
          ],
        ),
      ),
      model.sideMenu == true
          ? customSideMenu(context, model)
          : const SizedBox(),
    ],
  );
}

_filterUp(MyTasksViewModel model, context) {
  return Stack(
    children: [
      ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Фильтр заданий',
                        style: TextStyle(
                            color: Color.fromRGBO(51, 62, 99, 1),
                            fontSize: 22,
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 150),
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          'images/svg/filter.svg',
                          color: const Color.fromRGBO(51, 62, 99, 1),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: Text(
                    'Фильтровать по дате:',
                    style: TextStyle(
                        color: Color.fromRGBO(91, 91, 126, 1),
                        fontFamily: "Ubuntu",
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: model.val,
                          onChanged: (value) {
                            model.radioButtonChoice(value);
                          },
                          activeColor: Colors.deepOrange.shade700,
                        ),
                        const Text(
                          'Сначала новые',
                          style: TextStyle(fontFamily: "Ubuntu"),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: model.val,
                          onChanged: (value) {
                            model.radioButtonChoice(value);
                          },
                          activeColor: Colors.deepOrange.shade700,
                        ),
                        const Text(
                          'Сначала старые',
                          style: TextStyle(fontFamily: "Ubuntu"),
                        )
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Text(
                    'Фильтровать по дате:',
                    style: TextStyle(
                        color: Color.fromRGBO(91, 91, 126, 1),
                        fontFamily: "Ubuntu",
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                    padding: const EdgeInsets.only(top: 10, left: 5),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.filterCat.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: <Widget>[
                          Row(
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
                        ],
                      );
                    }),
                GestureDetector(
                  onTap: () {
                    model.closeFilter();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 25, left: 80, right: 80),
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue.withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 12))
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(1, 160, 226, 1),
                          Color.fromRGBO(104, 209, 253, 1)
                        ],
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Применить',
                        style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
