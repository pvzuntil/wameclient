import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wameclient/utils/utils.dart';

class MainController extends GetxController {
  TextEditingController textEditingControllerNo = TextEditingController();
  MaskTextInputFormatter textMaskTelephone = MaskTextInputFormatter(
    mask: '+## ###-####-####-#',
    filter: {
      '#': RegExp(r'[0-9]')
    }
  );

  void waNow({String nomer}) async{
    String newNomer;

    if(nomer[0] == '0'){
      newNomer = '62${Utils().replaceCharAt(nomer, 0, '')}';
    }else{
      newNomer = nomer;
    }
    
    String urlWa = 'https://wa.me/$newNomer';
    bool finishLaunch;
    if(await canLaunch(urlWa)){
      finishLaunch = await launch(urlWa);
    }

    print(finishLaunch);
  }
}
