import 'dart:async';
import 'dart:io';
import 'package:admin_sjit_pp/Screens/History.dart';
import 'package:admin_sjit_pp/Screens/Profile.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'API/toggle.api.dart';
import 'Forms/forms_homepage.dart';
import 'Screens/Intership.dart';
import 'Screens/Notifications.dart';
import 'dart:math' as math;
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

bool loading = false;
bool success = false;

class _HomeScreenState extends State<HomeScreen> {
  int isSwitched = 0;
  int switch1 = 0;
  int switch2 = 0;
  int switch3 = 0;
  int switch4 = 0;
  int switch5 = 0;

  ListView listView() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 1,
      shrinkWrap: true,
      itemBuilder: (context, index) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //  SizedBox(height: 20),
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
                  status: switch1,
                  imageUrl:
                      "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
                  subtitle: "__ __",
                  onPressed: () {}),
              CardFb1(
                  text: "INTERNSHIPS",
                  cardname: "interns",
                  status: switch2,
                  imageUrl:
                      "https://assets3.lottiefiles.com/packages/lf20_m0ze3ipv.json",
                  subtitle: "__ ___",
                  onPressed: () {}),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardFb1(
                  text: "WORKSHOPS",
                  cardname: "workshop",
                  status: switch3,
                  imageUrl:
                      "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
                  subtitle: "__ __",
                  onPressed: () {}),
              CardFb1(
                  text: "COURSES",
                  cardname: "course",
                  status: switch4,
                  imageUrl:
                      "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
                  subtitle: "__ __",
                  onPressed: () {}),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardFb1(
                  text: "PLACEMENTS",
                  cardname: "placements",
                  status: switch5,
                  imageUrl:
                      "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
                  subtitle: "__ __",
                  onPressed: () {}),
            ],
          ),
          // SizedBox(
          //   height: 20,
          // ),
        ],
      ),
    );
  }

  Row headerBottomBarWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRightWithFade,
                            child: const ZoomDrawerTest()));
                  },
                ),
                Text(
                  'Welcome back, ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.adventPro(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
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
            SizedBox(
              height: 30,
            ),
            PromoCard(),
          ],
        ),
      ),
    );
  }

  Future<void> __updatestatus(String cardname, int value) async {
    ToggleApi api = ToggleApi();
    await api.toggleStatus(cardname, value);
    print("sucess");
  }

  Future<int> _getstatus(String cardname) async {
    ToggleApi api = ToggleApi();
    var result1 = await api.getCurrentToogleStatus(cardname).then((value) {
      isSwitched = value == "1" ? 1 : 0;
      // print("sucess");
      // print(isSwitched);
    });
    return isSwitched;
  }

  Future<void> _getAllStatus() async {
    switch1 = await _getstatus("profile");
    switch2 = await _getstatus("interns");
    switch3 = await _getstatus("workshop");
    switch4 = await _getstatus("course");
    switch5 = await _getstatus("placements");
  }

  @override
  void initState() {
    super.initState();
    loading = true;
    _getAllStatus();
    Future.delayed(const Duration(milliseconds: 7000), () {
      print("Time Over");
      print(success);
      loading = false;
      (context as Element).reassemble();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: loading
          ? Center(child: Lottie.asset('assets/images/loading1.json'))
          : Center(
              child: DraggableHome(
                appBarColor: Colors.blueGrey.shade900,
                title: Text(
                  'HOMEPAGE ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.adventPro(
                      color: Colors.orange,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                ),
                headerWidget: headerWidget(context),

                body: [
                  listView()
                  // Container(
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           image: AssetImage('assets/images/Bg.jpeg'),
                  //           fit: BoxFit.cover)),
                  // ),
                  // Column(
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: [
                  //     SizedBox(height: height * .2),
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Align(
                  //         alignment: Alignment.centerLeft,
                  //         child: Text(
                  //           'Toggle Menu',
                  //           textAlign: TextAlign.center,
                  //           style: GoogleFonts.adventPro(
                  //               fontSize: 20,
                  //               color: Colors.orange,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       children: [
                  //         CardFb1(
                  //             text: "PROFILE",
                  //             cardname: "profile",
                  //             status: switch1,
                  //             imageUrl:
                  //                 "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
                  //             subtitle: "__ __",
                  //             onPressed: () {}),
                  //         CardFb1(
                  //             text: "INTERNSHIPS",
                  //             cardname: "interns",
                  //             status: switch2,
                  //             imageUrl:
                  //                 "https://assets3.lottiefiles.com/packages/lf20_m0ze3ipv.json",
                  //             subtitle: "__ ___",
                  //             onPressed: () {}),
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       height: height * .05,
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       children: [
                  //         CardFb1(
                  //             text: "WORKSHOPS",
                  //             cardname: "workshop",
                  //             status: switch3,
                  //             imageUrl:
                  //                 "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
                  //             subtitle: "__ __",
                  //             onPressed: () {}),
                  //         CardFb1(
                  //             text: "COURSES",
                  //             cardname: "course",
                  //             status: switch4,
                  //             imageUrl:
                  //                 "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
                  //             subtitle: "__ __",
                  //             onPressed: () {}),
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       height: height * .05,
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       children: [
                  //         CardFb1(
                  //             text: "PLACEMENTS",
                  //             cardname: "placements",
                  //             status: switch5,
                  //             imageUrl:
                  //                 "https://assets7.lottiefiles.com/private_files/lf30_LOw4AL.json",
                  //             subtitle: "__ __",
                  //             onPressed: () {}),
                  //       ],
                  //     ),
                  //     SizedBox(
                  //       height: height * .2,
                  //     ),
                  //   ],
                  // ),
                ],
                //    fullyStretchable: true,
                // expandedBody: const CameraPreview(),
                backgroundColor: Colors.blueGrey.shade900,
                // appBarColor: Colors.teal,
              ),
            ),
    );
  }
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

class CardFb1 extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;
  final Function() onPressed;
  final int status;
  final String cardname;

  const CardFb1(
      {required this.text,
      required this.cardname,
      required this.status,
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
        decoration: BoxDecoration(
          gradient: const LinearGradient(begin: Alignment.topLeft,
              //end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 154, 99, 164),
                Color.fromARGB(255, 248, 127, 106),
                Colors.cyan
              ]),
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
            ToggleSwitch(cardname: cardname, status: status),
            //Toggle(cardname: cardname),
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
                // const SearchFieldDrawer(),
                // const SizedBox(height: 12),
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
                    text: 'Logout',
                    icon: Icons.logout,
                    onClicked: () => showCupertinoDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return CupertinoAlertDialog(
                            title: const Text('Please Confirm'),
                            content: const Text('Are you sure want to leave ?'),
                            actions: [
                              // The "Yes" button
                              CupertinoDialogAction(
                                onPressed: () {
                                  setState(() {
                                    // _isShown = false;
                                    Navigator.of(context).pop();
                                  });
                                },
                                child: const Text('Yes'),
                                isDefaultAction: true,
                                isDestructiveAction: true,
                              ),
                              // The "No" button
                              CupertinoDialogAction(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'),
                                isDefaultAction: false,
                                isDestructiveAction: false,
                              )
                            ],
                          );
                        }),
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

        break;

      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Notifications(), // Page 1
        ));
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
      slideWidth: MediaQuery.of(context).size.width * .5,
      openCurve: Curves.easeIn,
      closeCurve: Curves.easeInOut,
    );
  }
}

class ToggleSwitch extends StatefulWidget {
  final String cardname;
  final int status;
  const ToggleSwitch({Key? key, required this.cardname, required this.status})
      : super(key: key);

  @override
  State<ToggleSwitch> createState() =>
      _ToggleSwitchState(cardname: cardname, status: status);
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  String cardname;
  int status;

  _ToggleSwitchState({required this.cardname, required this.status});

  var _controller01 = ValueNotifier<bool>(false);

  Future<void> __updatestatus(String cardname, int value) async {
    ToggleApi api = ToggleApi();
    await api.toggleStatus(cardname, value);
    print("sucess");
  }

  late Timer timer;

  @override
  void initState() {
    super.initState();
    _controller01 =
        status == 0 ? ValueNotifier<bool>(false) : ValueNotifier<bool>(true);

    _controller01.addListener(() {
      setState(() {
        if (_controller01.value) {
          success = true;
        } else {
          success = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AdvancedSwitch(
            activeChild: Text('ON'),
            inactiveChild: Text('OFF'),
            borderRadius: BorderRadius.circular(15),
            width: 56,
            controller: _controller01,
          ),
        ],
      ),
    );
  }
}

// class Notification extends StatefulWidget {
//   const Notification({Key? key}) : super(key: key);

//   @override
//   State<Notification> createState() => _NotificationState();
// }

// class _NotificationState extends State<Notification> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DraggableHome(
//       leading: const Icon(Icons.arrow_back_ios),
//       title: const Text("Draggable Home"),
//       actions: [
//         IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
//       ],
//       headerWidget: headerWidget(context),
//       headerBottomBar: headerBottomBarWidget(),
//       body: [
//         listView(),
//       ],
//       fullyStretchable: true,
//       // expandedBody: const CameraPreview(),
//       backgroundColor: Colors.white,
//       appBarColor: Colors.teal,
//     );
//   }

//   Row headerBottomBarWidget() {
//     return Row(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.end,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: const [
//         Icon(
//           Icons.settings,
//           color: Colors.white,
//         ),
//       ],
//     );
//   }

//   Widget headerWidget(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         // crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           // SizedBox(
//           //   height: height * .2,
//           // ),
//           IconButton(
//             icon: const Icon(
//               Icons.menu,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   PageTransition(
//                       type: PageTransitionType.leftToRightWithFade,
//                       child: const ZoomDrawerTest()));
//             },
//           ),
//           Text(
//             'Welcome back, ',
//             textAlign: TextAlign.center,
//             style: GoogleFonts.adventPro(
//               color: Colors.orange,
//               fontSize: 17,
//             ),
//           ),
//           Text(
//             ' Admin',
//             textAlign: TextAlign.center,
//             style: GoogleFonts.adventPro(
//                 color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }

//   ListView listView() {
//     return ListView.builder(
//       padding: const EdgeInsets.only(top: 0),
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: 20,
//       shrinkWrap: true,
//       itemBuilder: (context, index) => Card(
//         color: Colors.white70,
//         child: ListTile(
//           leading: CircleAvatar(
//             child: Text("$index"),
//           ),
//           title: const Text("Title"),
//           subtitle: const Text("Subtitile"),
//         ),
//       ),
//     );
//   }
// }

class PromoCard extends StatelessWidget {
  const PromoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              colors: [Colors.amberAccent, Colors.purpleAccent, Colors.cyan])),
      child: Stack(
        children: [
          Opacity(
            opacity: .5,
            child: Align(
                alignment: Alignment.bottomRight,
                child:
                    Image.asset("assets/images/one.png", fit: BoxFit.fitWidth)),
          ),
          Opacity(
            opacity: .5,
            child: Align(
                alignment: Alignment.center,
                child:
                    Image.asset("assets/images/one.png", fit: BoxFit.fitWidth)),
          ),
          Opacity(
            opacity: .5,
            child: Align(
                alignment: Alignment.centerLeft,
                child:
                    Image.asset("assets/images/one.png", fit: BoxFit.fitWidth)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "St.Joseph's Institute Of Technology",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DigitalClock(
                    digitAnimationStyle: Curves.elasticOut,
                    is24HourTimeFormat: false,
                    areaDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(colors: [
                          Colors.amberAccent,
                          Colors.purpleAccent,
                          Colors.cyan
                        ])),
                    hourMinuteDigitTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                    ),
                    amPmDigitTextStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
