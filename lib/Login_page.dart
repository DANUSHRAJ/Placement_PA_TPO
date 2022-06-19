import 'dart:ui';
import 'package:admin_sjit_pp/Widgets/submit_bttn.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_animations/multi_tween/multi_tween.dart';
import 'package:simple_animations/simple_animations.dart';

import 'Widgets/email.dart';
import 'package:admin_sjit_pp/Home_screen.dart';
import 'package:admin_sjit_pp/main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';
import 'Widgets/password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPassController = new TextEditingController();

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyApp()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              child: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "SJIT PLACEMENT PORTAL",
            style: GoogleFonts.adventPro(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: _backButton(),
          backgroundColor: Colors.black.withOpacity(.2),
          elevation: 20,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            // decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [Colors.black, Colors.blueGrey, Colors.black],
            // )),
            //     // image: DecorationImage(
            //     //   image: AssetImage("assets/images/bg.jpg"),
            //     //   fit: BoxFit.cover,
            //     // ),
            //     ),
            child: Stack(children: <Widget>[
              // Container(
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage('assets/images/Bg.jpeg'),
              //           fit: BoxFit.cover)),
              // ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: height * .05),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Lottie.asset("assets/images/landing1.json",
                            height: 350, width: 350, fit: BoxFit.contain),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: EmailInputFieldFb3(
                              inputController: loginEmailController)),
                      SizedBox(height: height * .05),
                      Align(
                          alignment: Alignment.center,
                          child: PasswordInputFieldFb3(
                              inputController: loginPassController)),
                      SizedBox(height: height * .1),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: SubmitBttn()),
                    ],
                  ),
                ),
              )
            ])));
  }
}
