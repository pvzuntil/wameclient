import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:wameclient/screen/main_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wa-ME',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => KeyboardDismissOnTap(child: MainScreen()),
        ),
      ],
    );
  }
}
