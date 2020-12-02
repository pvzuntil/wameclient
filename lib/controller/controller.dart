import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController {
  GetStorage gs;

  @override
  void onInit() async {
    gs = GetStorage();
    super.onInit();
  }

  String initialRoute() {
    bool hasToken = gs.hasData('authToken');
    print(hasToken);
    if (hasToken) {
      return '/';
    }
    return '/login';
  }

  void storeCurrentUser() {}
}
