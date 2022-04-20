import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nurisuman/UI/views/allTasks/allTasks_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:nurisuman/UI/views/roleChoice/roleChoice_view.dart';

import '../taskView/taskViewCustomer_view.dart';
import '../taskView/taskViewExecutor_view.dart';
import '../widgets.dart';
import 'allTasksMap_view.dart';

class AllTasksView extends StatelessWidget {
  const AllTasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AllTasksViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => AllTasksViewModel(context),
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
                  body: _allTasks(context, model),
                ),
              ));
        });
  }
}

_allTasks(BuildContext context, AllTasksViewModel model) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
    child: Stack(
      children: [
        ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AllTasksMapView()));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(229, 67, 45, 1),
                        Color.fromRGBO(255, 150, 143, 1),
                      ],
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 7),
                      )
                    ]),
                child: const Center(
                  child: Text(
                    'Задания на карте',
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: model.executorName.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
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
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 15, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10.0)),
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    model.catName[index],
                                    style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                model.executorName[index],
                                style: const TextStyle(
                                    color: Color.fromRGBO(91, 91, 126, 1),
                                    fontFamily: "Ubuntu",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Separator(),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                model.taskDesc[index],
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontFamily: "Ubuntu"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Separator(),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                  text: TextSpan(children: <TextSpan>[
                                const TextSpan(
                                    text: 'Стоимость: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue)),
                                TextSpan(
                                    text: model.price[index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        fontSize: 18)),
                                const TextSpan(
                                    text: " р",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        fontSize: 18)),
                              ])),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 30,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color.fromRGBO(239, 239, 250, 1),
                                            Color.fromRGBO(185, 185, 203, 1),
                                          ],
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.15),
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                            offset: const Offset(0, 7),
                                          )
                                        ]),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: const Text(
                                          'Подписки',
                                          style: TextStyle(
                                            fontFamily: "Ubuntu",
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(51, 62, 99, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    height: 30,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color.fromRGBO(1, 160, 226, 1),
                                            Color.fromRGBO(104, 209, 253, 1),
                                          ],
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.15),
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                            offset: const Offset(0, 7),
                                          )
                                        ]),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () async {
                                          String? value = await storage.read(
                                              key: 'profileType');
                                          if (value == 'Customer') {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const TaskViewCustomerView()));
                                          }
                                          if (value == 'Executor') {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const TaskViewExecutorView()));
                                          }
                                        },
                                        child: const Text(
                                          'Посмотреть',
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
        model.sideMenu == true
            ? customSideMenu(context, model)
            : const SizedBox(),
      ],
    ),
  );
}
