import 'dart:async';
import 'dart:io';

import 'package:admin_sjit_pp/Screens/History.dart';
import 'package:admin_sjit_pp/Screens/Profile.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'API/toggle.api.dart';
import 'Forms/forms_homepage.dart';
import 'Screens/Intership.dart';
import 'Widgets/webview.dart';
import 'dart:math' as math;
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // decoration: const BoxDecoration(
              //     gradient: LinearGradient(
              //   begin: Alignment.topRight,
              //   end: Alignment.bottomLeft,
              //   colors: [Colors.black, Colors.blueGrey, Colors.black],
              // )),
              child: Align(
                alignment: Alignment.topLeft,
                child: Stack(children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/Bg.jpeg'),
                            fit: BoxFit.cover)),
                  ),
                  Divider(
                      height: height * .3,
                      thickness: 5,
                      indent: 5,
                      endIndent: 5,
                      color: Colors.orange.withOpacity(.5)),

                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: height * .2),
                        // Column(
                        // children: [
                        // Text(
                        //   'DashBoard',
                        //   textAlign: TextAlign.justify,
                        //   style: GoogleFonts.adventPro(
                        //       color: Colors.orange,
                        //       fontSize: 25,
                        //       fontWeight: FontWeight.bold),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(10.0),
                        //   child: SizedBox(
                        //       height: height * .3,
                        //       child: MyHomePage(
                        //         title: '',
                        //       )

                        //       // const _LineChart(
                        //       //   isShowingMainData: true,
                        //       // ),
                        //       ),
                        // ),
                        //   ],
                        //),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Toggle Menu',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.adventPro(
                                  fontSize: 20,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CardFb1(
                                text: "PROFILE",
                                cardname: "profile",
                                imageUrl:
                                    "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
                                subtitle: "__ __",
                                onPressed: () {}),
                            CardFb1(
                                text: "INTERNSHIPS",
                                cardname: "interns",
                                imageUrl:
                                    "https://assets3.lottiefiles.com/packages/lf20_m0ze3ipv.json",
                                subtitle: "__ ___",
                                onPressed: () {}),
                          ],
                        ),

                        SizedBox(
                          height: height * .05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CardFb1(
                                text: "WORKSHOPS",
                                cardname: "workshop",
                                imageUrl:
                                    "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
                                subtitle: "__ __",
                                onPressed: () {}),
                            CardFb1(
                                text: "COURSES",
                                cardname: "course",
                                imageUrl:
                                    "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
                                subtitle: "__ __",
                                onPressed: () {}),
                          ],
                        ),
                        SizedBox(
                          height: height * .05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CardFb1(
                                text: "PLACEMENTS",
                                cardname: "placements",
                                imageUrl:
                                    "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
                                subtitle: "__ __",
                                onPressed: () {}),
                          ],
                        ),
                        SizedBox(
                          height: height * .2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: height * .2,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type:
                                        PageTransitionType.leftToRightWithFade,
                                    child: const ZoomDrawerTest()));
                          },
                        ),
                        Text(
                          'Welcome back, ',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.adventPro(
                            color: Colors.orange,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          ' Admin',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.adventPro(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: const BottomNavBarCurvedFb1(),
                  ),
                  //SwitchScreen(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarCurvedFb1 extends StatefulWidget {
  const BottomNavBarCurvedFb1({Key? key}) : super(key: key);

  @override
  _BottomNavBarCurvedFb1State createState() => _BottomNavBarCurvedFb1State();
}

class _BottomNavBarCurvedFb1State extends State<BottomNavBarCurvedFb1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 70;

    final primaryColor = Colors.orange;
    final secondaryColor = Colors.black54;
    final accentColor = const Color(0xffffffff);
    final backgroundColor = Colors.white;

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 10,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height + 6),
            painter: BottomNavCurvePainter(backgroundColor: backgroundColor),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
                backgroundColor: primaryColor,
                child: const Icon(Icons.home_filled),
                elevation: 0.1,
                onPressed: () {
                  showdialog(context, "Are you sure to leave");
                }),
          ),
          Container(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarIcon(
                  text: "Profile Search",
                  icon: Icons.search_outlined,
                  selected: false,
                  onPressed: () {},
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                NavBarIcon(
                  text: "Interships",
                  icon: Icons.celebration_outlined,
                  selected: false,
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: const Intership()));
                  },
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                const SizedBox(width: 56),
                NavBarIcon(
                    text: "Workshops",
                    icon: Icons.handyman_outlined,
                    selected: false,
                    onPressed: () {},
                    defaultColor: secondaryColor,
                    selectedColor: primaryColor),
                NavBarIcon(
                  text: "History",
                  icon: Icons.history_edu_outlined,
                  selected: false,
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: const History()));
                  },
                  selectedColor: primaryColor,
                  defaultColor: secondaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future showdialog(BuildContext context, String message) async {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              title: new Text(message),
              actions: [
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text(
                      'Cancel',
                      style: GoogleFonts.adventPro(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                new RaisedButton(
                    onPressed: () {
                      if (Platform.isAndroid) {
                        Future.delayed(const Duration(milliseconds: 1000), () {
                          SystemChannels.platform
                              .invokeMethod('SystemNavigator.pop');
                        });
                      } else if (Platform.isIOS) {
                        exit(0);
                      } else {
                        exit(0);
                      }
                    },
                    child: new Text(
                      'Yes',
                      style: GoogleFonts.adventPro(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ))
                //Text("Confirm", TextStyle())),
              ],
            ));
  }
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white, this.insetRadius = 38});

  Color backgroundColor;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 12);

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * .08;
    path.quadraticBezierTo(size.width * 0.20, 0,
        insetCurveBeginnningX - transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(
        insetCurveBeginnningX, 0, insetCurveBeginnningX, insetRadius / 2);

    path.arcToPoint(Offset(insetCurveEndX, insetRadius / 2),
        radius: const Radius.circular(20.0), clockwise: false);

    path.quadraticBezierTo(
        insetCurveEndX, 0, insetCurveEndX + transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 12);
    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xFFEB7C27),
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 10,
              //height: .1,
              color: selected ? Colors.amber : Colors.grey.withOpacity(.75)),
        )
      ],
    );
  }
}

// class CustomCarouselFB2 extends StatefulWidget {
//   const CustomCarouselFB2({Key? key}) : super(key: key);

//   @override
//   _CustomCarouselFB2State createState() => _CustomCarouselFB2State();
// }

// class _CustomCarouselFB2State extends State<CustomCarouselFB2> {
//   // - - - - - - - - - - - - Instructions - - - - - - - - - - - - - -
//   // Learn to build this widget at https://www.youtube.com/watch?v=dSMw1Nb0QVg!
//   // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//   List<Widget> cards = [
//     CardFb1(
//         text: "PROFILE",
//         imageUrl:
//             "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
//         subtitle: "__ __",
//         onPressed: () {}),
//     CardFb1(
//         text: "INTERNSHIPS",
//         imageUrl: "https://assets3.lottiefiles.com/packages/lf20_m0ze3ipv.json",
//         subtitle: "__ ___",
//         onPressed: () {}),
//     CardFb1(
//         text: "WORKSHOPS",
//         imageUrl:
//             "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
//         subtitle: "__ __",
//         onPressed: () {}),
//     CardFb1(
//         text: "COURSES",
//         imageUrl:
//             "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
//         subtitle: "__ __",
//         onPressed: () {}),
//     CardFb1(
//         text: "PLACEMENTS",
//         imageUrl:
//             "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
//         subtitle: "__ __",
//         onPressed: () {})
//   ];

//   final double carouselItemMargin = 5;

//   late PageController _pageController;
//   int _position = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController =
//         PageController(initialPage: 0, viewportFraction: .4, keepPage: false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//         controller: _pageController,
//         itemCount: cards.length,
//         onPageChanged: (int position) {
//           setState(() {
//             _position = position;
//           });
//         },
//         itemBuilder: (BuildContext context, int position) {
//           return imageSlider(position);
//         });
//   }

//   Widget imageSlider(int position) {
//     return AnimatedBuilder(
//       animation: _pageController,
//       builder: (BuildContext context, widget) {
//         return Container(
//           margin: EdgeInsets.all(carouselItemMargin),
//           child: Center(child: widget),
//         );
//       },
//       child: Container(
//         child: cards[position],
//       ),
//     );
//   }
// }

class CardFb1 extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;
  final Function() onPressed;
  final String cardname;

  const CardFb1(
      {required this.text,
      required this.cardname,
      required this.imageUrl,
      required this.subtitle,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      dragStartBehavior: DragStartBehavior.start,
      onTap: onPressed,
      child: Container(
        width: 300 / 2,
        height: 300 / 2,
        //padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/images/toggle_bg.jpg'),
            fit: BoxFit.cover,
          ),
          color: Colors.black,
          borderRadius: BorderRadius.circular(25.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 0,
                spreadRadius: 0,
                color: Colors.black.withOpacity(.5)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // const Spacer(),

            Text(
              text,
              textAlign: TextAlign.justify,
              style: GoogleFonts.adventPro(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),

            const Text(
              '__ __',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            //ToggleSwitch(cardname: cardname),
            Toggle(cardname: cardname),
          ],
        ),
      ),
    );
  }
}

class DrawerFb1 extends StatelessWidget {
  const DrawerFb1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.orange,
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                const SizedBox(height: 12),
                const SearchFieldDrawer(),
                const SizedBox(height: 12),
                MenuItem(
                  text: 'Profile',
                  icon: Icons.people,
                  onClicked: () => selectedItem(context, 0),
                ),
                const SizedBox(height: 5),
                MenuItem(
                  text: 'Form Creator',
                  icon: Icons.file_present,
                  onClicked: () => selectedItem(context, 1),
                ),
                const SizedBox(height: 5),
                MenuItem(
                  text: 'Workflow',
                  icon: Icons.workspaces_outline,
                  onClicked: () => selectedItem(context, 2),
                ),
                const SizedBox(height: 5),
                MenuItem(
                  text: 'Updates',
                  icon: Icons.update,
                  onClicked: () => selectedItem(context, 3),
                ),
                MenuItem(
                  text: 'Notifications',
                  icon: Icons.notifications_outlined,
                  onClicked: () => selectedItem(context, 5),
                ),
                MenuItem(
                  text: 'Settings',
                  icon: Icons.settings,
                  onClicked: () => selectedItem(context, 6),
                ),
                const SizedBox(height: 100),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: MenuItem(
                    text: 'Close',
                    icon: Icons.close_rounded,
                    onClicked: () => Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.leftToRightWithFade,
                          child: HomeScreen(),
                        )),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ProfileHome(), // Page 1
        ));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const FormHome()));
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (BuildContext context) => MyWebView(
        //           title: "GoogleForms",
        //           selectedUrl: "https://www.google.com/forms/about/",
        //         )));
        break;
    }
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onClicked;

  const MenuItem({
    required this.text,
    required this.icon,
    this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}

class SearchFieldDrawer extends StatelessWidget {
  const SearchFieldDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color, fontSize: 14),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(
          Icons.search,
          color: color,
          size: 20,
        ),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }
}

class ZoomDrawerTest extends StatefulWidget {
  const ZoomDrawerTest({Key? key}) : super(key: key);

  @override
  _ZoomDrawerTestState createState() => _ZoomDrawerTestState();
}

class _ZoomDrawerTestState extends State<ZoomDrawerTest> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.Style1,
      menuScreen: HomeScreen(),
      mainScreen: const DrawerFb1(),
      borderRadius: 20.0,
      //showShadow: true,
      angle: -15.0,
      backgroundColor: Colors.transparent,
      slideWidth: MediaQuery.of(context).size.width * .65,
      openCurve: Curves.easeIn,
      closeCurve: Curves.easeInOut,
    );
  }
}

//toggle switch

// class ToggleSwitch extends StatefulWidget {
//   final String cardname;

//   ToggleSwitch({Key? key, required this.cardname}) : super(key: key);

//   @override
//   State<ToggleSwitch> createState() => _ToggleSwitchState();
// }

// class _ToggleSwitchState extends State<ToggleSwitch> {
//   var _controller00;
//   bool _enabled = false;

//   Future<void> __updatestatus(String cardname, int value) async {
//     ToggleApi api = ToggleApi();
//     await api.toggleStatus(cardname, value);
//     print("sucess");
//   }

//   Future<void> _getstatus(String cardname) async {
//     ToggleApi api = ToggleApi();
//     int result1 = (await api.getCurrentToogleStatus(cardname)) as int;
//     _enabled = result1 == 1 ? true : false;
//     if (_enabled)
//       _controller00 = ValueNotifier<bool>(true);
//     else
//       _controller00 = ValueNotifier<bool>(false);
//     print("get success");
//   }

//   @override
//   void initState() {
//     super.initState();
//     _getstatus(widget.cardname);
//     // _controller00.initState(() {});

//     _controller00.addListener(() {
//       setState(() {
//         if (_controller00.value) {
//           _enabled = true;
//           __updatestatus(widget.cardname, 1);
//         } else {
//           _enabled = false;
//           __updatestatus(widget.cardname, 0);
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("sucess");
//     return Container(
//         //width: double.infinity,
//         child: SingleChildScrollView(
//             physics: ClampingScrollPhysics(),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: AdvancedSwitch(
//                           activeChild: Text('ON'),
//                           inactiveChild: Text('OFF'),
//                           borderRadius: BorderRadius.circular(15),
//                           width: 60,
//                           controller: _controller00,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ])));
//   }
// }

class Toggle extends StatefulWidget {
  final String cardname;

  Toggle({Key? key, required this.cardname}) : super(key: key);
  @override
  _ToggleState createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  bool isSwitched = false;

  Future<void> __updatestatus(String cardname, int value) async {
    ToggleApi api = ToggleApi();
    await api.toggleStatus(cardname, value);
    print("sucess");
  }

  Future<void> _getstatus(String cardname) async {
    ToggleApi api = ToggleApi();
    var result1 = await api.getCurrentToogleStatus(cardname);
    // print("Result1: " + result1);
    isSwitched = result1 == "1" ? true : false;
    build(context);
    // print("get success");
  }

  @override
  void initState() {
    super.initState();
    _getstatus(widget.cardname);
  }

  // @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
              print(isSwitched);
            });
          },
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.green,
        ),
      ),
    );
  }
}
