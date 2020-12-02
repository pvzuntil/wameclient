import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
            BackgroundGradient(),
            TitleApp(),
            AnimationImage(),
            MainContent(mainController: mainController),
            SlidingUpPanel(
              controller: mainController.panelController,
              renderPanelSheet: false,
              onPanelOpened: () => mainController.eventOpenSlider(context),
              onPanelSlide: (_) => mainController.eventSlideSlider(),
              onPanelClosed: () => mainController.eventCloseSlide(),
              minHeight: Get.pixelRatio * 17,
              backdropEnabled: true,
              backdropTapClosesPanel: true,
              borderRadius: _buildBorderRadiusPanel(),
              collapsed: HeaderPanel(mainController: mainController),
              // panel: ContentPanel(),
              // header: HeaderPanel(mainController: mainController),
              panelBuilder: (ScrollController scrollController) => ContentPanel(
                scrollController: scrollController,
                mainController: mainController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentPanel extends StatelessWidget {
  const ContentPanel({Key key, this.scrollController, this.mainController})
      : super(key: key);

  final ScrollController scrollController;
  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(Get.pixelRatio * 6)),
      ),
      margin: EdgeInsets.fromLTRB(
          Get.pixelRatio * 4, 0, Get.pixelRatio * 4, Get.pixelRatio * 4),
      child: Center(
        child: mainController.generateViewKontak(),
        // ListView.builder(
        //   controller: scrollController,
        //   itemCount: 50,
        //   itemBuilder: (BuildContext context, int i) {
        //     return Slidable(
        //       actionPane: SlidableBehindActionPane(),
        //       actionExtentRatio: 0.25,
        //       child: Container(
        //         color: Colors.white,
        //         child: ListTile(
        //           leading: CircleAvatar(
        //             backgroundColor: Colors.indigoAccent,
        //             child: Text('3'),
        //             foregroundColor: Colors.white,
        //           ),
        //           title: Text('Tile n°4'),
        //           subtitle: Text('SlidableDrawerDelegate'),
        //         ),
        //       ),
        //       actions: <Widget>[
        //         IconSlideAction(
        //           caption: 'Archive',
        //           color: Colors.blue,
        //           icon: Icons.archive,
        //           onTap: () => {},
        //         ),
        //       ],
        //       secondaryActions: <Widget>[
        //         IconSlideAction(
        //           caption: 'More',
        //           color: Colors.black45,
        //           icon: Icons.more_horiz,
        //           onTap: () => {},
        //         ),
        //       ],
        //     );
        //   },
        // ),
      ),
    );
  }
}

class NotFoundKontak extends StatelessWidget {
  const NotFoundKontak({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: Get.pixelRatio * 30,
            child: Lottie.asset(
              'assets/lottie/notfan.json',
              reverse: true,
            ),
          ),
          Text(
            'Tidak ada histori',
            style: GoogleFonts.roboto(
              fontSize: Get.pixelRatio * 5,
            ),
          )
        ],
      ),
    );
  }
}

class LoadingKontak extends StatelessWidget {
  const LoadingKontak({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Get.pixelRatio * 30,
          child: Lottie.asset('assets/lottie/loading.json', reverse: true),
        ),
        Text(
          'Loading ...',
          style: GoogleFonts.roboto(
            fontSize: Get.pixelRatio * 5,
          ),
        )
      ],
    );
  }
}

class HeaderPanel extends StatelessWidget {
  const HeaderPanel({
    Key key,
    @required this.mainController,
  }) : super(key: key);

  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => mainController.panelController.open(),
      child: Container(
        margin:
            EdgeInsets.fromLTRB(Get.pixelRatio * 4, 0, Get.pixelRatio * 4, 0),
        decoration: BoxDecoration(
            color: Color(0xFF6f86d6), borderRadius: _buildBorderRadiusPanel()),
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
    );
  }
}

BorderRadius _buildBorderRadiusPanel() {
  return BorderRadius.only(
    topLeft: Radius.circular(Get.pixelRatio * 6),
    topRight: Radius.circular(Get.pixelRatio * 6),
  );
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key key,
    @required this.mainController,
  }) : super(key: key);

  final MainController mainController;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
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
          padding: EdgeInsets.all(Get.pixelRatio * 4),
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
    );
  }
}

class AnimationImage extends StatelessWidget {
  const AnimationImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: Get.pixelRatio * 90,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: Get.pixelRatio * 66.666666667,
          width: Get.pixelRatio * 100,
          child: Lottie.asset('assets/lottie/chat.json', reverse: true),
        ),
      ),
    );
  }
}

class TitleApp extends StatelessWidget {
  const TitleApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
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
    );
  }
}

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
