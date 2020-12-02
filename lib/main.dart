import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wameclient/controller/controller.dart';
import 'package:wameclient/screen/login_screen.dart';
import 'package:wameclient/screen/main_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // var myCustomUniqueUserId = "iniadalahid";
  // OneSignal.shared.setExternalUserId(myCustomUniqueUserId);

  // OneSignal.shared
  //     .init("efe37717-8b79-4653-b853-4cbe840260a1", iOSSettings: null);
  // OneSignal.shared
  //     .setInFocusDisplayType(OSNotificationDisplayType.notification);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wa-ME',
      initialRoute: controller.initialRoute(),
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
      onInit: () {},
      defaultTransition: Transition.downToUp,
    );
  }
}
