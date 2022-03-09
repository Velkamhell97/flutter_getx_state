import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_state/src/pages/detail_page.dart';
import 'package:getx_state/src/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( //-Navegacion con getX
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      // routes: {
      //   '/home': (_) => const HomePage(),
      //   '/detail': (_) => const DetailPage(),
      // },
      //-Otro tipo de navegacion con getX, util para la inyeccion de dependencias
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/detail', page: () => const DetailPage()),
      ],
    );
  }
}
