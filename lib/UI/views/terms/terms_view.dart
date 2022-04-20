import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nurisuman/UI/views/terms/terms_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';

class TermsView extends StatelessWidget {
  const TermsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TermsViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => TermsViewModel(context),
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
                  body: _terms(context, model),
                ),
              ));
        });
  }
}

_terms(BuildContext context, TermsViewModel model) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
    child: Stack(
      children: [
        ListView(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 90),
          children: const <Widget>[
            Text(
              'Разнообразный и богатый опыт говорит нам, что существующая теория является качественно новой ступенью инновационных методов управления процессами. Принимая во внимание показатели успешности, сплочённость команды профессионалов влечет за собой процесс внедрения и модернизации как самодостаточных, так и внешне зависимых концептуальных решений. Таким образом, курс на социально-ориентированный национальный проект однозначно фиксирует необходимость новых предложений. Интерактивные прототипы, которые представляют собой яркий пример континентально-европейского типа политической культуры, будут подвергнуты целой серии независимых исследований.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 15),
            Text(
              'Для современного мира сложившаяся структура организации требует от нас анализа первоочередных требований. Современные технологии достигли такого уровня, что консультация с широким активом создаёт предпосылки для новых принципов формирования материально-технической и кадровой базы. Высокотехнологичная концепция общественного уклада не оставляет шанса для направлений прогрессивного развития. ',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 15),
            Text(
              'Для современного мира сложившаяся структура организации требует от нас анализа первоочередных требований. ',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 15),
            Text(
              'Разнообразный и богатый опыт говорит нам, что существующая теория является качественно новой ступенью инновационных методов управления процессами.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 15),
            Text(
              'Разнообразный и богатый опыт говорит нам, что существующая теория является качественно новой ступенью инновационных методов управления процессами. Принимая во внимание показатели успешности, сплочённость команды профессионалов влечет за собой процесс внедрения и модернизации как самодостаточных, так и внешне зависимых концептуальных решений. Таким образом, курс на социально-ориентированный национальный проект однозначно фиксирует необходимость новых предложений. Интерактивные прототипы, которые представляют собой яркий пример континентально-европейского типа политической культуры, будут подвергнуты целой серии независимых исследований.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 15),
            Text(
              'Для современного мира сложившаяся структура организации требует от нас анализа первоочередных требований. Современные технологии достигли такого уровня, что консультация с широким активом создаёт предпосылки для новых принципов формирования материально-технической и кадровой базы. Высокотехнологичная концепция общественного уклада не оставляет шанса для направлений прогрессивного развития. ',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 15),
            Text(
              'Для современного мира сложившаяся структура организации требует от нас анализа первоочередных требований. ',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 15),
            Text(
              'Разнообразный и богатый опыт говорит нам, что существующая теория является качественно новой ступенью инновационных методов управления процессами.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 90)
          ],
        ),
        model.sideMenu == true
            ? customSideMenu(context, model)
            : const SizedBox(),
      ],
    ),
  );
}
