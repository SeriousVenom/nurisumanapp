import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nurisuman/UI/views/scheduledTasks/scheduledTasksList_view.dart';
import 'package:nurisuman/UI/views/scheduledTasks/scheduledTasks_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';

class ScheduledTasksView extends StatelessWidget {
  const ScheduledTasksView({Key? key}) : super(key: key);

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
                  body: _taskView(context, model),
                ),
              ));
        });
  }
}

_taskView(BuildContext context, ScheduledTasksViewModel model) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg_2.png'), fit: BoxFit.cover)),
    child: Stack(
      children: [
        ListView(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 45,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.withOpacity(0.2),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(
                                        text: '19-05-2021',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue)),
                                    TextSpan(
                                        text: '12:00',
                                        style: TextStyle(
                                            color: Colors.blue.shade900)),
                                  ],
                                ),
                              )),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 220,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.withOpacity(0.2),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Название категории',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 89, 165, 1),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Название услуги',
                      style: TextStyle(
                          fontFamily: "Ubuntu",
                          color: Color.fromRGBO(91, 91, 126, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    const Separator(),
                    const SizedBox(height: 10),
                    Column(
                      children: const <Widget>[
                        Text(
                            'Экономическая повестка сегодняшнего дня обеспечивает широкому кругу (специалистов) участие в формировании прогресса профессионального сообщества. Учитывая ключевые сценарии поведения, понимание сути ресурсосберегающих технологий способствует повышению качества глубокомысленных рассуждений! В целом, конечно, консультация с широким активом требует анализа модели развития. Господа, убеждённость некоторых оппонентов позволяет оценить значение дальнейших направлений развития.',
                            style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 15),
                        Text(
                            'Экономическая повестка сегодняшнего дня обеспечивает широкому кругу (специалистов) участие в формировании прогресса профессионального сообщества. Учитывая ключевые сценарии поведения, понимание сути ресурсосберегающих технологий способствует повышению качества глубокомысленных рассуждений! В целом, конечно, консультация с широким активом требует анализа модели развития. Господа, убеждённость некоторых оппонентов позволяет оценить значение дальнейших направлений развития.',
                            style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 15),
                        Text(
                            'Экономическая повестка сегодняшнего дня обеспечивает широкому кругу (специалистов',
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15, top: 10),
                        height: 50,
                        width: 250,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(1, 160, 226, 1),
                              Color.fromRGBO(104, 209, 253, 1),
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
                                          const ScheduledTasksListView()));
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Поиск исполнителя',
                                style: TextStyle(
                                  fontFamily: "Ubuntu",
                                  fontSize: 14,
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
          ],
        ),
        model.sideMenu == true
            ? customSideMenu(context, model)
            : const SizedBox(),
      ],
    ),
  );
}
