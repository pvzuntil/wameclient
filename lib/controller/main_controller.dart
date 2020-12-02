import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wameclient/screen/main_screen.dart';
import 'package:wameclient/utils/utils.dart';

class MainController extends GetxController {
  TextEditingController textEditingControllerNo = TextEditingController();
  MaskTextInputFormatter textMaskTelephone = MaskTextInputFormatter(
      mask: '+## ###-####-####-#', filter: {'#': RegExp(r'[0-9]')});
  PanelController panelController = PanelController();

  var isOpenSlider = false.obs;
  var isLoadingData = true.obs;

  void waNow({String nomer}) async {
    String newNomer;

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

    print(finishLaunch);
    // TODO Belom slesai disini
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

  Obx generateViewKontak() => Obx(() {
        if (isOpenSlider.value && isLoadingData.value) {
          return LoadingKontak();
        } else {
          return NotFoundKontak();
        }
      });
}
