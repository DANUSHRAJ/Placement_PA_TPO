import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../Home_screen.dart';

class Intership extends StatefulWidget {
  const Intership({Key? key}) : super(key: key);

  @override
  _IntershipState createState() => _IntershipState();
}

class NewObject {
  String title;
  IconData icon;

  NewObject(this.title, this.icon);
}

List<NewObject> title = <NewObject>[
  NewObject('Batch', Icons.batch_prediction),
  NewObject('2019', Icons.calendar_today),
  NewObject('2020', Icons.calendar_today),
  NewObject('2021', Icons.calendar_today),
  NewObject('2022', Icons.calendar_today),
  NewObject('2023', Icons.calendar_today),
  NewObject('2024', Icons.calendar_today),
  NewObject('2025', Icons.calendar_today),
  NewObject('2026', Icons.calendar_today),
];

List<NewObject> department = <NewObject>[
  NewObject('Dept', Icons.description),
  NewObject('B.Tech IT', Icons.mobile_friendly_rounded),
  NewObject('B.E CSE', Icons.computer_rounded),
  NewObject('B.E ECE', Icons.signal_cellular_alt_outlined),
  NewObject('B.E EEE', Icons.lightbulb_outline_rounded),
  NewObject('B.E MECH', Icons.settings_applications_rounded),
  NewObject('B.E CIVIL', Icons.apartment_outlined),
];

List<NewObject> dropbox = <NewObject>[
  title.first, //0
  department.first, //1
];

class _IntershipState extends State<Intership> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: const Icon(Icons.home_outlined, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "INTERSHIP",
            textAlign: TextAlign.justify,
            style: GoogleFonts.adventPro(
                fontSize: 25,
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: _backButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
            child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.black, Colors.blueGrey, Colors.black],
            )),
            child: Align(
                alignment: Alignment.topLeft,
                child: Stack(children: <Widget>[
                  SingleChildScrollView(
                      child: Column(children: [
                    SizedBox(height: height * .13),
                    CardFb1(text: "Explore", onPressed: () {}),
                    const Divider(
                        thickness: 2,
                        indent: 15,
                        endIndent: 15,
                        color: Colors.white),
                    Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Total: ',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.adventPro(
                                  fontSize: 25,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                )))),
                    const Divider(
                        thickness: 2,
                        indent: 15,
                        endIndent: 15,
                        color: Colors.white),
                    CardFb2(onPressed: () {}),
                  ]))
                ])),
          )
        ])));
  }
}

Widget _DropBox(String title, List<NewObject> key, int i) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: 250,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.portLligatSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.limeAccent,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 180,
          // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            //border: Border.all(color: Colors.deepOrange, width: 4),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<NewObject>(
              value: dropbox.elementAt(i), // currently selected item
              items: key
                  .map((item) => DropdownMenuItem<NewObject>(
                        child: Row(
                          children: [
                            Icon(item.icon),
                            const SizedBox(width: 8),
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        value: item,
                      ))
                  .toList(),
              onChanged: (value) => setState(() {
                dropbox[i] = value!;
              }),
            ),
          ),
        )
      ],
    ),
  );
}

setState(Null Function() param0) {}

class CardFb2 extends StatelessWidget {
  final Function() onPressed;

  const CardFb2({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  offset: Offset(-6.0, -6.0),
                  blurRadius: 16.0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(6.0, 6.0),
                  blurRadius: 16.0,
                ),
              ],
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          _DropBox("Batch", title, 0),
                          _DropBox("Dept", department, 1),
                        ],
                      ),
                      //FloatingActionButton(onPressed: onPressed),
                      NeumorphicButton(
                        margin: EdgeInsets.all(12),
                        onPressed: () {},
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(15)),
                            border: NeumorphicBorder(color: Colors.orange)),
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "  View  ",
                          style: GoogleFonts.adventPro(
                              fontSize: 15,
                              color: _textColor(context),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                      thickness: 2,
                      indent: 8,
                      endIndent: 8,
                      color: Colors.white),
                  // Row(
                  //   children: [
                  //     const Expanded(
                  //       child: const TextField(
                  //         decoration: InputDecoration(
                  //           hintText: "PART B",
                  //           hintStyle: TextStyle(color: Colors.white),
                  //           //border: InputBorder.
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 15,
                  //     ),
                  //     FloatingActionButton(
                  //       onPressed: () {},
                  //       child: const Icon(
                  //         Icons.send,
                  //         color: Colors.white,
                  //         size: 18,
                  //       ),
                  //       backgroundColor: Colors.orangeAccent,
                  //       elevation: 0,
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //       height: 5,
                  //     ),
                ],
              ),
            ),
          ),
        ));
  }

  Color _textColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.orange;
    } else {
      return Colors.deepOrange;
    }
  }
}

class CardFb1 extends StatelessWidget {
  final String text;
  // final String imageUrl;
  // final String subtitle;
  final Function() onPressed;

  const CardFb1({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 400,
          height: 300,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                offset: Offset(-6.0, -6.0),
                blurRadius: 16.0,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(6.0, 6.0),
                blurRadius: 16.0,
              ),
            ],
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        _DropBox("Batch", title, 0),
                        _DropBox("Dept", department, 1),
                      ],
                    ),
                    NeumorphicButton(
                      margin: EdgeInsets.all(12),
                      onPressed: () {},
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(15)),
                          border: NeumorphicBorder(color: Colors.orange)),
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "DOWNLOAD",
                        style: GoogleFonts.adventPro(
                            fontSize: 15,
                            color: _textColor(context),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    const Expanded(
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Send to mail...",
                          hintStyle: TextStyle(color: Colors.white),
                          //border: InputBorder.
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                      backgroundColor: Colors.orangeAccent,
                      elevation: 0,
                    ),
                  ],
                ),
                // const SizedBox(
                //       height: 5,
                //     ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _textColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.orange;
    } else {
      return Colors.deepOrange;
    }
  }
}
