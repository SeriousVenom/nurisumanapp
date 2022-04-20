import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import '../widgets.dart';
import 'feedback_viewmodel.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedbackViewModel>.reactive(
        onModelReady: (viewModel) => viewModel.onReady(),
        viewModelBuilder: () => FeedbackViewModel(context),
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
                  body: _feedbackView(context, model),
                ),
              ));
        });
  }
}

_feedbackView(BuildContext context, FeedbackViewModel model) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
    child: ListView(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Text(
            'Оставить отзыв',
            style: TextStyle(
                color: Color.fromRGBO(51, 62, 99, 1),
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
        ),
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 15))
          ]),
          child: Card(
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Рейтинг:',
                        style:
                            TextStyle(color: Colors.grey, fontFamily: "Ubuntu"),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: StarRating(
                          rating: 4,
                          color: Colors.deepOrange.shade800,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'Отзыв',
                    style: TextStyle(color: Colors.grey, fontFamily: "Ubuntu"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.05),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  margin: const EdgeInsets.only(
                      right: 30, left: 30, bottom: 30, top: 8),
                  child: Stack(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 15, right: 15, top: 15),
                          focusColor: Colors.black,
                        ),
                        maxLines: 20,
                        style: const TextStyle(
                            fontFamily: "Ubuntu",
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 1.5,
                            top: 10),
                        child: const ImageIcon(
                          AssetImage('images/icons/Pan.png'),
                          color: Color.fromRGBO(0, 89, 165, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 7),
                        )
                      ],
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(229, 67, 45, 1),
                          Color.fromRGBO(255, 150, 143, 1)
                        ],
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'ОТПРАВИТЬ',
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
                const SizedBox(height: 15),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
