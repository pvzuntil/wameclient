import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wameclient/controller/main_controller.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF48c6ef),
                    Color(0xFF6f86d6),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              bottom: Get.pixelRatio * 15,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'WA.ME PLEASE.',
                  style: GoogleFonts.squadaOne(
                    fontSize: Get.pixelRatio * 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: Get.pixelRatio * 90,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 200,
                  width: 300,
                  child: Lottie.asset('assets/lottie/chat.json'),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width,
                  height: Get.height / 3,
                  decoration: BoxDecoration(
                    color: Color(0xFFd3daf2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Get.pixelRatio * 6),
                      topRight: Radius.circular(Get.pixelRatio * 6),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF6378c0),
                        blurRadius: 20,
                        // spreadRadius: ,
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(Get.pixelRatio * 8),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.pixelRatio * 3,
                          vertical: Get.pixelRatio / 100,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF6f86d6),
                          borderRadius: BorderRadius.circular(
                            Get.pixelRatio * 3,
                          ),
                        ),
                        child: TextField(
                          controller: mainController.textEditingControllerNo,
                          inputFormatters: [mainController.textMaskTelephone],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Masukkan Nomer WhatsApp',
                            labelStyle: GoogleFonts.roboto(
                              fontSize: Get.pixelRatio * 5,
                              color: Colors.white,
                            ),
                          ),
                          style: GoogleFonts.roboto(
                            fontSize: Get.pixelRatio * 9,
                            color: Colors.white,
                          ),
                          cursorColor: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: Get.pixelRatio),
                              child: RaisedButton(
                                color: Color(0xFF6f86d6),
                                onPressed: () => {},
                                child: Text(
                                  'Scan QR',
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    Get.pixelRatio * 3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: Get.pixelRatio),
                              child: RaisedButton(
                                color: Color(0xFF6f86d6),
                                onPressed: () => {
                                  mainController.waNow(
                                      nomer: mainController.textMaskTelephone
                                          .getUnmaskedText())
                                },
                                child: Text(
                                  'WA NOW!',
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    Get.pixelRatio * 3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SlidingUpPanel(
              renderPanelSheet: false,
              onPanelOpened: () => mainController.unFocusTextField(context),
              minHeight: Get.pixelRatio * 17,
              backdropEnabled: true,
              backdropTapClosesPanel: true,
              panel: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(Get.pixelRatio * 6)),
                ),
                margin: EdgeInsets.fromLTRB(Get.pixelRatio * 4, 0, Get.pixelRatio * 4, Get.pixelRatio * 4),
                child: Center(
                  child: Text("This is the SlidingUpPanel when open"),
                ),
              ),
              collapsed: Container(
                margin: EdgeInsets.fromLTRB(Get.pixelRatio * 4, 0, Get.pixelRatio * 4, 0),
                decoration: BoxDecoration(
                  color: Color(0xFF6f86d6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Get.pixelRatio * 6),
                    topRight: Radius.circular(Get.pixelRatio * 6),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width / (Get.pixelRatio / 2),
                      height: Get.pixelRatio * 2,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.7),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.pixelRatio * 3,
                    ),
                    Text(
                      'Histori nge-WA mu',
                      style: GoogleFonts.roboto(color: Colors.white),
                    )
                  ],
                ),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Get.pixelRatio * 6),
                topRight: Radius.circular(Get.pixelRatio * 6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
