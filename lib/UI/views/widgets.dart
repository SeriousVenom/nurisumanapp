import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurisuman/UI/views/profile/profileCustomer_view.dart';
import 'package:nurisuman/UI/views/profile/profileExecutor_view.dart';
import 'package:nurisuman/UI/views/profile/profileSeller_view.dart';
import 'package:nurisuman/UI/views/push/push_view.dart';
import 'package:nurisuman/UI/views/roleChoice/roleChoice_view.dart';
import 'package:nurisuman/UI/views/roleChoice/roleChoice_viewmodel.dart';
import 'package:nurisuman/UI/views/scheduledTasks/scheduledTasks_view.dart';
import 'package:nurisuman/UI/views/terms/terms_view.dart';

import 'accountEnterExit/accountEnterExit_view.dart';
import 'allExecutors/allExecutors_view.dart';
import 'allTasks/allTasks_view.dart';
import 'categorySelect/categorySelect_view.dart';
import 'faq/faq_view.dart';
import 'feedback/feedback_view.dart';
import 'goods/goods_view.dart';
import 'goods/myGoods_view.dart';
import 'login/login_view.dart';
import 'myOrders/myOrders_view.dart';
import 'myPurchases/myPurchases_view.dart';
import 'myTasks/myTasksCustomer_view.dart';
import 'myTasks/myTasksExecutor_view.dart';

customAppBar(context, model) {
  return AppBar(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/appbar_bg.png'),
      )),
    ),
    shadowColor: Colors.black.withOpacity(0.2),
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_outlined,
          color: Colors.indigo.shade700,
        )),
    actions: <Widget>[
      GestureDetector(
        onTap: () {
          model.showSideMenu();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Image.asset(
            'images/logo.png',
            width: 40,
            height: 40,
          ),
        ),
      ),
      GestureDetector(
          onTap: () async {
            String? value = await storage.read(key: 'profileType');

            if (value == 'Customer') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyTasksCustomerView()));
            }
            if (value == 'Executor') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyTasksExecutorView()));
            }
          },
          child: Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8, left: 15),
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
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Мои задания',
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )),
      Container(
        padding: const EdgeInsets.only(top: 15, left: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FeedbackView()));
          },
          child: Image.asset('images/icons/btn1.png'),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 15),
        child: GestureDetector(
          onTap: () {},
          child: Image.asset('images/icons/btn2.png'),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PushView()));
          },
          child: Image.asset('images/icons/not.png'),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15, bottom: 10, right: 5),
        child: GestureDetector(
          onTap: () {},
          child: Image.asset('images/icons/menu.png'),
        ),
      )
    ],
  );
}

customBottomBar(BuildContext context, model) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: model.selectedIndex,
        showSelectedLabels: true,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        onTap: (index) async {
          switch (index) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const GoodsView()));
              break;

            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AllTasksView()));
              break;
            case 2:
              //print(ProfileMenu().index);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AllExecutorsView()));
              break;
            case 3:
            /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AllTasksView()));
              break;*/
            case 4:
              String? value = await storage.read(key: 'profileType');
              if (value == 'Executor') {
                RoleViewModel(context).typeProfile(context, 'Executor');
              }
              if (value == 'Customer') {
                RoleViewModel(context).typeProfile(context, 'Customer');
              }
              if (value == 'Seller') {
                RoleViewModel(context).typeProfile(context, 'Seller');
              }
            //if (ProfileMenu().index == 0) {
            //RoleViewModel(context).typeProfile(context, 'Executor');
            //}
          }
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: const Color.fromRGBO(91, 91, 126, 1),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(0, 89, 165, 1),
                    Color.fromRGBO(1, 160, 226, 1)
                  ],
                  tileMode: TileMode.repeated,
                ).createShader(bounds);
              },
              child:
                  const ImageIcon(AssetImage('images/icons/shopping_cart.png')),
            ),
            icon: const ImageIcon(AssetImage('images/icons/shopping_cart.png')),
            label: 'Товары',
          ),
          BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(0, 89, 165, 1),
                    Color.fromRGBO(1, 160, 226, 1)
                  ],
                  tileMode: TileMode.repeated,
                ).createShader(bounds);
              },
              child: const ImageIcon(AssetImage('images/icons/stars.png')),
            ),
            icon: const ImageIcon(AssetImage('images/icons/stars.png')),
            label: 'Задания',
          ),
          BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(0, 89, 165, 1),
                    Color.fromRGBO(1, 160, 226, 1)
                  ],
                  tileMode: TileMode.repeated,
                ).createShader(bounds);
              },
              child: const ImageIcon(AssetImage('images/icons/people.png')),
            ),
            icon: const ImageIcon(AssetImage('images/icons/people.png')),
            label: 'Исполнители',
          ),
          BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(0, 89, 165, 1),
                    Color.fromRGBO(1, 160, 226, 1)
                  ],
                  tileMode: TileMode.repeated,
                ).createShader(bounds);
              },
              child: const ImageIcon(AssetImage('images/icons/questions.png')),
            ),
            icon: const ImageIcon(AssetImage('images/icons/questions.png')),
            label: 'Диалоги',
          ),
          BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(0, 89, 165, 1),
                    Color.fromRGBO(1, 160, 226, 1)
                  ],
                  tileMode: TileMode.repeated,
                ).createShader(bounds);
              },
              child: const ImageIcon(AssetImage('images/icons/account.png')),
            ),
            icon: const ImageIcon(AssetImage('images/icons/account.png')),
            label: 'Профиль',
          ),
        ],
      ),
    ),
  );
}

customSideMenu(BuildContext context, model) {
  return Stack(
    children: [
      ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.only(left: 20, top: 60),
                  children: <Widget>[
                    Text(
                      'Nuri Suman',
                      style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue.shade800),
                    ),
                    ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: menuNames.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  index == 1
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginView()))
                                      : null;
                                  index == 2
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AccountEnterExitView()))
                                      : null;

                                  index == 3
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const FaqView()))
                                      : null;
                                  index == 4
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const PushView()))
                                      : null;
                                  index == 7
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CategorySelectView()))
                                      : null;
                                  index == 8
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const TermsView()))
                                      : null;
                                  index == 9
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyPurchasesView()))
                                      : null;
                                  index == 10
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyGoodsView()))
                                      : null;
                                  index == 11
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyOrdersView()))
                                      : null;
                                },
                                child: Row(
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      menuIcons[index],
                                      color:
                                          const Color.fromRGBO(91, 91, 126, 1),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      menuNames[index],
                                      style: const TextStyle(
                                          color: Color.fromRGBO(91, 91, 126, 1),
                                          fontSize: 16,
                                          fontFamily: "Ubuntu",
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20)
                            ],
                          );
                        })
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    model.closeSideMenu();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width - 50, top: 60),
                    child: SvgPicture.asset('images/svg/ic-menu.svg'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

taskStatus(String image, String text) {
  return Stack(
    children: <Widget>[
      Image.asset(
        image,
        height: 72,
        width: 72,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 60, top: 12),
        child: Text(
          text,
          style: const TextStyle(
              color: Color.fromRGBO(91, 91, 126, 1),
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: "Ubuntu"),
        ),
      )
    ],
  );
}

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color? color;
  final double? iconSize;

  const StarRating(
      {this.starCount = 5, this.rating = .0, this.color, this.iconSize});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        //color: Color.fromRGBO(0, 89, 165, 1),
        color: Colors.grey,
        size: iconSize,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        //color: color ?? const Color.fromRGBO(0, 89, 165, 1),
        color: color ?? Colors.grey,
        size: iconSize,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color ?? const Color.fromRGBO(0, 89, 165, 1),
        size: iconSize,
      );
    }
    return InkResponse(child: icon);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}

class Separator extends StatelessWidget {
  final double height;
  final Color color;

  const Separator({this.height = 1, this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 3.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

List<String> taskWork = ['images/icons/btn_01.png', 'Задание выполняется'];
List<String> taskConfirm = ['images/icons/btn_02.png', 'Подтверждение задания'];
List<String> taskComplete = ['images/icons/btn_03.png', 'Задание завершено'];

List<String> menuNames = <String>[
  "Главная",
  "Авторизация",
  "Выход",
  "О сервисе",
  "Уведомления",
  "Редактирование профиля",
  "Баланс",
  "Категории",
  "Пользовательское соглашение",
  "Мои покупки",
  "Мои товары",
  "Мои заказы"
];

List<String> menuIcons = <String>[
  "images/svg/home-alt.svg",
  "images/svg/lock-alt.svg",
  "images/svg/out.svg",
  "images/svg/diamond.svg",
  "images/svg/horn.svg",
  "images/svg/settings.svg",
  "images/svg/wallet_01.svg",
  "images/svg/extension.svg",
  "images/svg/sticker.svg",
  "images/svg/wallet_01.svg",
  "images/svg/wallet_01.svg",
  "images/svg/wallet_01.svg"
];
