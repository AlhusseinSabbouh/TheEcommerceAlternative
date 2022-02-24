

import 'package:ecmmerce_app/view/auth/second_page.dart';
import 'package:ecmmerce_app/view/sql_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/utiles/binding.dart';
import 'view/auth/controller_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  GetStorage token = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      getPages: [GetPage(name: SecondPage().route, page: () => SecondPage())],
      debugShowCheckedModeBanner: false,
      home: SqlView(),
    );
  }
}
