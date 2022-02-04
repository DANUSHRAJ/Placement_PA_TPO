import 'package:admin_sjit_pp/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'Login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sjit_PP_Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'SJIT_ADMIN'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _opacity = 1;
  final double _appBarHeight = 56;
  final double _topPadding = 20;
  Widget _typeWriter(String head, int duration) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: AnimatedTextKit(
            totalRepeatCount: 1,
            animatedTexts: [
              TypewriterAnimatedText(
                head,
                curve: Curves.linear,
                speed: Duration(milliseconds: duration),
                textStyle: GoogleFonts.adventPro(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: Container(
          // Place as the child widget of a scaffold
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black,
              Colors.blueGrey,
            ],
          )
              // image: DecorationImage(
              //   image: AssetImage("assets/images/bg.jpg"),
              //   fit: BoxFit.cover,
              // ),
              ),
          child: Stack(
            children: <Widget>[
              Container(
                child: _typeWriter(
                    "Hi There,\nWelcome To Sjit Placement Portal", 100),
              ),
            ],
          )), // Place child here

      floatingActionButton: FloatingActionButton(
          elevation: 50,
          backgroundColor: Colors.black,
          onPressed: () {
            child:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          child: const Icon(
            Icons.arrow_right_alt_rounded,
            size: 50,
          )),
    );
  }
}
