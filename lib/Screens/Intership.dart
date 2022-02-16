import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  NewObject('Batch', Icons.description),
  NewObject('Mr', Icons.person),
  NewObject('Ms', Icons.person),
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
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.home_outlined, color: Colors.white),
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
                    Divider(
                        //height: height * .,
                        thickness: 5,
                        indent: 5,
                        endIndent: 5,
                        color: Colors.white),
                  ]))
                ])),
          )
        ])));
  }
}

Widget _DropBox(String title, List<NewObject> key, int i) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
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
        SizedBox(
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
                              style: TextStyle(
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
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12.5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(10, 20),
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.05)),
            ],
          ),
          child: Column(
            children: [
              //Image.network(imageUrl, height: 59, fit: BoxFit.cover),
              Row(
                children: [
                  Column(
                    children: [
                      _DropBox("Batch", title, 0),
                      _DropBox("Dept", department, 1),
                    ],
                  ),
                  FloatingActionButton(onPressed: onPressed)
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.white),
                        //border: InputBorder.
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
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
    );
  }
}
