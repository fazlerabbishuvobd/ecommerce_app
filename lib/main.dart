import 'package:ecommerce_app/resources/routes/app_routes.dart';
import 'package:ecommerce_app/resources/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      initialRoute: AppRouteName.splashScreen,
      getPages: AppRoutes.appRoutes(),
    );
  }
}

