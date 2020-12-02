import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wameclient/controller/controller.dart';
import 'package:wameclient/model/AuthModel.dart';
import 'package:wameclient/screen/main_screen.dart';
import 'package:wameclient/utils/utils.dart';

class LoginController extends GetxController {
  Controller controller = Get.find<Controller>();

  TextEditingController textConEmail = TextEditingController();
  TextEditingController textConPassword = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  var isLodingLogin = false.obs;

  void doLogin({@required BuildContext context}) async {
    this.isLodingLogin.value = true;

    FocusScopeNode focusScopeNode = FocusScope.of(context);
    if (!focusScopeNode.hasPrimaryFocus) {
      focusScopeNode.unfocus();
    }

    AuthModelReq req = AuthModelReq(
      email: textConEmail.text,
      password: textConPassword.text,
    );

    http.Response response = await http.post(
      Utils.apiUrl() + 'auth/login',
      headers: Utils.httpJson(),
      body: jsonEncode(req),
    );
    AuthModel result = AuthModel.fromJson(jsonDecode(response.body));

    this.isLodingLogin.value = false;
    if (result.status == 0) {
      return Utils.snackError(message: result.message);
    }

    controller.gs.write('authToken', result.data.token);
    return Get.offAll(MainScreen());
  }
}
