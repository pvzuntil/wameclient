import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:wameclient/controller/login_controller.dart';
import 'package:wameclient/screen/signin_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            BackgroundGradient(),
            TopAnimation(),
            BottomAnimation(),
            Title(),
            Content(loginController: loginController),
          ],
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key key,
    @required this.loginController,
  }) : super(key: key);

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: Get.pixelRatio * 30,
      child: Align(
        child: Container(
          width: Get.width,
          height: Get.pixelRatio * 100,
          padding: EdgeInsets.all(Get.pixelRatio * 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormTextField(
                label: 'Masukkan Email ...',
                keyboardType: TextInputType.emailAddress,
                controller: loginController.textConEmail,
              ),
              FormTextField(
                label: 'Masukkan Password ...',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                controller: loginController.textConPassword,
              ),
              Container(
                margin: EdgeInsets.only(top: Get.pixelRatio * 10),
                child: Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            Get.pixelRatio * 3,
                          ),
                        ),
                        onPressed: () =>
                            loginController.doLogin(context: context),
                        child: Obx(
                          () => loginController.isLodingLogin.value
                              ? SizedBox(
                                  width: Get.pixelRatio * 7,
                                  height: Get.pixelRatio * 7,
                                  child: CircularProgressIndicator(
                                    strokeWidth: Get.pixelRatio,
                                  ),
                                )
                              : Text('LOGIN'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Get.pixelRatio * 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Anda belum memiliki akun ? ',
                      style: GoogleFonts.roboto(color: Colors.white70),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAll(SigninScreen()),
                      child: Text(
                        'Mendaftar.',
                        style: GoogleFonts.roboto(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: Get.pixelRatio * 120,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Login Wa.me',
          style: GoogleFonts.squadaOne(
            fontSize: Get.pixelRatio * 17,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}

class BottomAnimation extends StatelessWidget {
  const BottomAnimation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Lottie.asset('assets/lottie/bawah.json', reverse: true),
      ),
    );
  }
}

class TopAnimation extends StatelessWidget {
  const TopAnimation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Lottie.asset('assets/lottie/atas.json', reverse: true),
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
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF48c6ef),
            Color(0xFF6f86d6),
          ],
        ),
      ),
    );
  }
}

class FormTextField extends StatelessWidget {
  const FormTextField({
    Key key,
    this.label,
    this.keyboardType,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Get.pixelRatio * 4),
      padding: EdgeInsets.symmetric(
        horizontal: Get.pixelRatio * 3,
        vertical: Get.pixelRatio / 100,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF6f86d6),
        borderRadius: BorderRadius.circular(
          Get.pixelRatio * 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            blurRadius: 3,
            offset: Offset(1, 1),
          )
        ],
      ),
      child: TextField(
        controller: this.controller,
        // inputFormatters: [mainController.textMaskTelephone],
        keyboardType: this.keyboardType,
        obscureText: this.obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: this.label,
          labelStyle: GoogleFonts.roboto(
            fontSize: Get.pixelRatio * 5,
            color: Colors.white.withOpacity(.4),
          ),
        ),
        style: GoogleFonts.roboto(
          fontSize: Get.pixelRatio * 6,
          color: Colors.white,
        ),
        cursorColor: Colors.white70,
      ),
    );
  }
}
