import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:wameclient/screen/login_screen.dart';
import 'package:wameclient/screen/main_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wa-ME',
      initialRoute: initialRoute(),
      getPages: [
        GetPage(
          name: '/',
          page: () => KeyboardDismissOnTap(child: MainScreen()),
        ),
        GetPage(
          name: '/login',
          page: () => KeyboardDismissOnTap(child: LoginScreen()),
        ),
      ],
    );
  }
}

String initialRoute(){
  return '/login';
}