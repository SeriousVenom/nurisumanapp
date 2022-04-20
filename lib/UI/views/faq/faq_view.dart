import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nurisuman/UI/views/faq/faq_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';

class FaqView extends StatelessWidget {
  const FaqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FaqViewModel>.reactive(
      viewModelBuilder: () => FaqViewModel(context),
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
                body: _cardFirst(context, model),
              ),
            ));
      },
    );
  }
}

_cardFirst(BuildContext context, FaqViewModel model) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
    child: Stack(
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: model.faqNames.length,
            padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        blurRadius: 15,
                        offset: const Offset(0, 25),
                      )
                    ]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      shadowColor: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.lightBlueAccent.withOpacity(0.1),
                            ),
                            margin: const EdgeInsets.only(top: 15),
                            height: 30,
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  model.faqNames[index],
                                  style: const TextStyle(
                                      fontFamily: "Ubuntu",
                                      fontSize: 16,
                                      color: Color.fromRGBO(91, 91, 126, 1)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: MediaQuery.of(context).size.height - 300,
                            child: MediaQuery.removePadding(
                              removeTop: true,
                              removeBottom: true,
                              context: context,
                              child: RawScrollbar(
                                thumbColor: Colors.lightBlue,
                                radius: const Radius.circular(30),
                                thickness: 6,
                                child: ListView(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 20),
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  children: const <Widget>[
                                    Text(
                                        'Разнообразный и богатый опыт говорит нам, что существующая теория является качественно новой ступенью инновационных методов управления процессами. Принимая во внимание показатели успешности, сплочённость команды профессионалов влечет за собой процесс внедрения и модернизации как самодостаточных, так и внешне зависимых концептуальных решений. Таким образом, курс на социально-ориентированный национальный проект однозначно фиксирует необходимость новых предложений. Интерактивные прототипы, которые представляют собой яркий пример континентально-европейского типа политической культуры, будут подвергнуты целой серии независимых исследований.                  Для современного мира сложившаяся структура организации требует от нас анализа первоочередных требований. Современные технологии достигли такого уровня, что консультация с широким активом создаёт предпосылки для новых принципов формирования материально-технической и кадровой базы. Высокотехнологичная концепция общественного уклада не оставляет шанса для направлений прогрессивного развития. Для современного мира сложившаяся структура организации требует от нас анализа первоочередных требований.Разнообразный и богатый опыт говорит нам, что существующая теория является качественно новой ступенью инновационных методов управления процессами.'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 100,
                                margin: const EdgeInsets.only(
                                    top: 8, bottom: 8, left: 15),
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(185, 185, 203, 1),
                                      Color.fromRGBO(239, 239, 250, 1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Пропустить',
                                        style: TextStyle(
                                          fontFamily: "Ubuntu",
                                          fontSize: 14,
                                          color: Color.fromRGBO(51, 62, 99, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                margin: const EdgeInsets.only(
                                    top: 8, bottom: 8, left: 15),
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
                                      model.goButton(index);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Далее',
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
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50)
                ],
              );
            }),
        model.sideMenu == true
            ? customSideMenu(context, model)
            : const SizedBox(),
      ],
    ),
  );
}
