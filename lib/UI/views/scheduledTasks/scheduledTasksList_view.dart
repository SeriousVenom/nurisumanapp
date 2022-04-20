import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurisuman/UI/views/scheduledTasks/scheduledTasks_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';

class ScheduledTasksListView extends StatelessWidget {
  const ScheduledTasksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduledTasksViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => ScheduledTasksViewModel(context),
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
                  body: _taskListView(context, model),
                ),
              ));
        });
  }
}

_taskListView(BuildContext context, ScheduledTasksViewModel model) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
    child: Stack(
      children: [
        ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 90, bottom: 90),
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
                                          color: Color.fromRGBO(91, 91, 126, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  SvgPicture.asset('images/svg/points.svg')
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Separator(),
                              const SizedBox(height: 5),
                              Text(
                                model.executorDesc[index],
                                style: const TextStyle(
                                    color: Color.fromRGBO(137, 146, 155, 1)),
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
        model.sideMenu == true
            ? customSideMenu(context, model)
            : const SizedBox(),
      ],
    ),
  );
}
