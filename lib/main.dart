import 'package:flutter/material.dart';
import 'package:nurisuman/UI/views/goods/goods_view.dart';
import 'package:nurisuman/UI/views/order/orderCustomer_view.dart';
import 'package:nurisuman/UI/views/splash.dart';
import 'UI/views/addGood/addGood_view.dart';
import 'UI/views/dispute/createDispute_view.dart';
import 'UI/views/goods/good_view.dart';
import 'UI/views/goods/myGoods_view.dart';
import 'UI/views/myOrders/myOrders_view.dart';
import 'UI/views/myPurchases/myPurchases_view.dart';
import 'UI/views/order/orderSeller_view.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: CreateDisputeView());
  }
}
