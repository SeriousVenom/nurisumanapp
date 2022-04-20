import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nurisuman/UI/views/categorySelect/categorySelect_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';

class CategorySelectView extends StatelessWidget {
  const CategorySelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategorySelectViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => CategorySelectViewModel(context),
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
                  body: _categorySelect(context, model),
                ),
              ));
        });
  }
}

_categorySelect(BuildContext context, CategorySelectViewModel model) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
    child: Stack(
      children: [
        ListView(
          padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
          children: <Widget>[
            const Text(
              'Выберите категории',
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Ubuntu",
                  color: Color.fromRGBO(51, 62, 99, 1)),
            ),
            const SizedBox(height: 15),
            Stack(
              children: [
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
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: model.cat.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              ExpansionTile(
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
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      shrinkWrap: true,
                                      itemCount: model.subCat.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
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
                              Align(
                                alignment: Alignment.centerRight,
                                child: Switch(
                                    activeColor: Colors.blue,
                                    value: model.catSwitch[index],
                                    onChanged: (value) {
                                      model.catSwitchValue(index, value);
                                    }),
                              )
                            ],
                          );
                        }),
                  ),
                ),
                /*Padding(
                    padding: const EdgeInsets.only(top: 90, left: 130),
                    child: _popupMessage(model))*/
              ],
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

_popupMessage(CategorySelectViewModel model) {
  return Stack(
    children: [
      Container(
        height: 100,
        width: 230,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(50, 193, 159, 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 7),
              )
            ]),
        child: const Padding(
          padding: EdgeInsets.only(left: 5, right: 20, top: 10),
          child: Text(
            'Уважаемый пользователь у Вас недостаточно средств для подписки на новую категорию, просим Вас пополнить свой баланс.',
            style: TextStyle(color: Colors.white, fontFamily: "Ubuntu"),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 203, top: 2),
        child: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 95, left: 110),
        child: ImageIcon(
          AssetImage('images/polygon.png'),
          color: Color.fromRGBO(50, 193, 159, 1),
        ),
      )
    ],
  );
}
