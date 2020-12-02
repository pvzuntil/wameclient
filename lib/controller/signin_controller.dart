import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wameclient/model/SigninModel.dart';
import 'package:wameclient/screen/login_screen.dart';
import 'package:wameclient/utils/utils.dart';

class SigninController extends GetxController {
  TextEditingController textConNama = TextEditingController();
  TextEditingController textConEmail = TextEditingController();
  TextEditingController textConPassword = TextEditingController();
  TextEditingController textConPasswordKon = TextEditingController();

  var isLodingLogin = false.obs;

  void doSignin({@required BuildContext context}) async {
    if(textConPassword.text != textConPasswordKon.text){
      return Utils().snackError(message: 'Passsword konfirmasi tidak sama, silahkan coba lagi !');
    }
    this.isLodingLogin.value = true;

    FocusScopeNode focusScopeNode = FocusScope.of(context);
    if (!focusScopeNode.hasPrimaryFocus) {
      focusScopeNode.unfocus();
    }

    SignInReq req = SignInReq(
      name: textConNama.text,
      email: textConEmail.text,
      password: textConPassword.text,
    );

    http.Response response = await http.post(
      Utils().apiUrl() + 'auth/signin',
      headers: Utils().httpJson(),
      body: jsonEncode(req),
    );

    SigninRes result = SigninRes.fromJson(json.decode(response.body));

    this.isLodingLogin.value = false;
    if (result.status == 0) {
      return Utils().snackError(message: result.message);
    }
    
    removeField();
    return Utils().snackSuccess(message: result.message);
    // return Get.off(LoginScreen());
  }

  void removeField(){
    textConNama.clear();
    textConEmail.clear();
    textConPassword.clear();
    textConPasswordKon.clear();
  }
}
