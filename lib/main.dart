import 'dart:async';

import 'package:admin_sjit_pp/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_animations/simple_animations.dart';
import 'Forms/forms_homepage.dart';
import 'Login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context)=> MyHomePage(),
        "/formHome":(context) => const FormHome(),
      },
      //home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(30, 9, 23, 1),
        body: Container(
            height: double.infinity,
            //width: MediaQuery.of(context).size.width,
            width: double.infinity,
            // decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [Colors.black, Colors.blueGrey, Colors.black],
            // )),
            child: Stack(
              children: <Widget>[
                // Align(
                //   alignment: Alignment.topCenter,
                //   child: FadeAnimation(
                //       1,
                //       Container(
                //         height: 400,
                //         decoration: BoxDecoration(
                //             image: DecorationImage(
                //                 image: AssetImage('assets/images/one.png'),
                //                 fit: BoxFit.cover)),
                //       )),
                // ),
                // Positioned(
                //   top: -100,
                //   left: 0,
                //   child: FadeAnimation(
                //       1.3,
                //       Container(
                //         height: 400,
                //         decoration: BoxDecoration(
                //             image: DecorationImage(
                //                 image: AssetImage('assets/images/one.png'),
                //                 fit: BoxFit.cover)),
                //       )),
                // ),
                // Positioned(
                //   top: -150,
                //   left: 0,
                //   child: FadeAnimation(
                //       1.6,
                //       Container(
                //         height: 400,
                //         decoration: BoxDecoration(
                //             image: DecorationImage(
                //                 image: AssetImage('assets/images/one.png'),
                //                 fit: BoxFit.cover)),
                //       )),
                // ),

                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Bg.jpeg'),
                          fit: BoxFit.cover)),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Lottie.asset("assets/images/landing.json",
                        height: 100, width: 100)),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'WELCOME \nTO \nSJIT PLACEMENT PORTAL',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.adventPro(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )));
  }
}

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(
    this.delay,
    this.child,
  );

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniProps>()
      ..add(
        AniProps.opacity,
        Tween(begin: 0.0, end: 1.0),
        const Duration(milliseconds: 300),
      )
      ..add(AniProps.translateY, Tween(begin: -30.0, end: 0.0),
          const Duration(milliseconds: 500), Curves.easeOut);

    return PlayAnimation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniProps.opacity), //(animation as Map)["opacity"],
        child: Transform.translate(
            offset: Offset(0, value.get(AniProps.translateY)), child: child),
      ),
    );
  }
}
