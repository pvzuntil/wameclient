import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:wameclient/screen/login_screen.dart';
import 'package:wameclient/screen/main_screen.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();

  // var myCustomUniqueUserId = "iniadalahid";
  // OneSignal.shared.setExternalUserId(myCustomUniqueUserId);

  // OneSignal.shared
  //     .init("efe37717-8b79-4653-b853-4cbe840260a1", iOSSettings: null);
  // OneSignal.shared
  //     .setInFocusDisplayType(OSNotificationDisplayType.notification);

  runApp(MyApp());
}

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
      onInit: () {
        // OneSignal.shared
        //     .setNotificationReceivedHandler((OSNotification notification) {
        //       print(notification.payload);
        // });
      },
      defaultTransition: Transition.downToUp,
    );
  }
}

String initialRoute() {
  return '/login';
}
