import 'package:admin_sjit_pp/API/forms.api.dart';
import 'package:admin_sjit_pp/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'create_form.dart';
import 'list_of_forms.dart';

class FormHome extends StatefulWidget {
  const FormHome({Key? key}) : super(key: key);

  @override
  _FormHomeState createState() => _FormHomeState();
}

class _FormHomeState extends State<FormHome> {
  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "Forms",
            textAlign: TextAlign.justify,
            style: GoogleFonts.adventPro(
                fontSize: 25,
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: _backButton(),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: SafeArea(
            child: Container(
                child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.topLeft,
              child: Stack(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Bg.jpeg'),
                          fit: BoxFit.cover)),
                ),
                Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // GestureDetector(
                        //     onTap: () {
                        //       String title = '';
                        //       showDialog(
                        //           context: context,
                        //           builder: (context) => AlertDialog(
                        //                 title: const Text('Create New Form'),
                        //                 content: TextField(
                        //                   decoration: InputDecoration(
                        //                     border: OutlineInputBorder(),
                        //                     labelText: 'Title',
                        //                   ),
                        //                   onChanged: (value) => title = value,
                        //                 ),
                        //                 actions: [
                        //                   TextButton(
                        //                     onPressed: () =>
                        //                         Navigator.pop(context),
                        //                     child: const Text('Cancel'),
                        //                   ),
                        //                   TextButton(
                        //                     onPressed: () {
                        //                       var date =
                        //                           DateTime.now().toString();
                        //                       dynamic formdata = {
                        //                         date: [
                        //                           title,
                        //                           [
                        //                             {
                        //                               'type': 'Question',
                        //                               'pos': 1,
                        //                               'ques':
                        //                                   'What is your age?'
                        //                             }
                        //                           ],
                        //                         ],
                        //                       };
                        //                       Navigator.push(
                        //                           context,
                        //                           MaterialPageRoute(
                        //                               builder: (context) =>
                        //                                   CreateForm(
                        //                                       date, formdata)));
                        //                     },
                        //                     child: const Text('Create'),
                        //                   ),
                        //                 ],
                        //               ));
                        //     },
                        SplashButton(
                            title: "CREATE NEW FORM",
                            onPressed: () {
                              String title = '';
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text('Create New Form'),
                                        content: TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Title',
                                          ),
                                          onChanged: (value) => title = value,
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              var date =
                                                  DateTime.now().toString();
                                              dynamic formdata = {
                                                date: [
                                                  title,
                                                  [
                                                    {
                                                      'type': 'Question',
                                                      'pos': 1,
                                                      'ques':
                                                          'What is your age?'
                                                    }
                                                  ],
                                                ],
                                              };
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CreateForm(
                                                              date, formdata)));
                                            },
                                            child: const Text('Create'),
                                          ),
                                        ],
                                      ));
                            },
                            subText: ""),
                        SplashButton(
                            title: "VIEW FORMS", onPressed: () {}, subText: "")
                      ]),

                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const FormList()));
                  //   },
                  //   child: Container(
                  //     color: Colors.blue,
                  //     padding: const EdgeInsets.all(20),
                  //     margin: const EdgeInsets.all(20),
                  //     child: const Text('LIST OF FORMS'),
                  //   ),
                  // ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     color: Colors.blue,
                  //     padding: const EdgeInsets.all(20),
                  //     margin: const EdgeInsets.all(20),
                  //     child: const Text(''),
                  //   ),
                  // ),
                )
              ]),
            ),
          ),
        ]))));
  }

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
}

class SplashButton extends StatelessWidget {
  final String title;
  final String subText;
  final Function() onPressed;
  const SplashButton(
      {required this.title,
      required this.onPressed,
      this.subText = "",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.purpleAccent,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 200,
          padding: const EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
                image: AssetImage('assets/images/FcCards.gif'),
                fit: BoxFit.cover),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: GoogleFonts.adventPro(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              // Text(
              //   subText,
              //   style: const TextStyle(
              //       fontSize: 14,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.black),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
