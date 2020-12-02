import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wameclient/controller/controller.dart';
import 'package:wameclient/model/KontakModel.dart';
import 'package:wameclient/screen/login_screen.dart';
import 'package:wameclient/screen/main_screen.dart';
import 'package:wameclient/utils/utils.dart';
import 'package:http/http.dart' as http;

class MainController extends GetxController {
  Controller controller = Get.find<Controller>();

  TextEditingController textEditingControllerNo = TextEditingController();
  MaskTextInputFormatter textMaskTelephone = MaskTextInputFormatter(
      mask: '+## ###-####-####-#', filter: {'#': RegExp(r'[0-9]')});
  PanelController panelController = PanelController();

  var isOpenSlider = false.obs;
  var isLoadingData = true.obs;

  void waNow({String nomer}) async {
    String newNomer;
    if (nomer == '') {
      return Utils.snackError(message: 'Nomer tidak boleh kosong !');
    }

    if (nomer[0] == '0') {
      newNomer = '62${Utils.replaceCharAt(nomer, 0, '')}';
    } else {
      newNomer = nomer;
    }

    String urlWa = 'https://wa.me/$newNomer';
    bool finishLaunch;
    if (await canLaunch(urlWa)) {
      finishLaunch = await launch(urlWa);
    }

    if (finishLaunch) {
      KontakReq req = KontakReq(
        name: 'Tanpa nama',
        no: nomer
      );

      await http.post(
        Utils.apiUrl() + 'kontak/create',
        headers: Utils.httpJsonWithAuth(),
        body: json.encode(req)
      );
    }

    textEditingControllerNo.text = '';
    textMaskTelephone.clear();
  }

  void eventOpenSlider(BuildContext context) {
    FocusScopeNode focusScopeNode = FocusScope.of(context);
    if (!focusScopeNode.hasPrimaryFocus) {
      focusScopeNode.unfocus();
    }

    Timer(Duration(seconds: 3), () {
      isLoadingData.value = false;
    });
  }

  void eventSlideSlider() {
    if (!isOpenSlider.value) {
      isOpenSlider.value = true;
    }
  }

  void eventCloseSlide() {
    if (isOpenSlider.value) {
      isOpenSlider.value = false;
    }
    if (!isLoadingData.value) {
      isLoadingData.value = true;
    }
  }

  Obx generateViewKontak() => Obx(
        () {
          if (isOpenSlider.value && isLoadingData.value) {
            return LoadingKontak();
          } else {
            return NotFoundKontak();
          }
        },
      );

  void doLogout() {
    controller.gs.remove('authToken');
    Get.offAll(LoginScreen());
  }
}
