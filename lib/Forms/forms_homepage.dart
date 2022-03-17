import 'dart:async';

import 'package:admin_sjit_pp/API/forms.api.dart';
import 'package:admin_sjit_pp/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
            child: Stack(children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/Bg.jpeg'),
                        fit: BoxFit.cover)),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

                        const SizedBox(height: 50),

                        SplashButton(
                            title: "CREATE NEW FORM",
                            onPressed: () {
                              String title = '';

                              showDialog(
                                  barrierColor: Colors.black.withOpacity(0.5),
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        elevation: 10,
                                        backgroundColor:
                                            const Color(0xffffffff),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        title: const Text('New Form'),
                                        content: TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
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
                                            style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: Colors.teal,
                                              onSurface: Colors.grey,
                                            ),
                                            onPressed: () async {
                              var date=DateTime.now().toString();
                              dynamic formdata={
                                "data":[
                                  title,
                                  [
                                    {"type":"Question","pos":1,"ques":"Enter your Question"}
                                  ]
                                ]
                              };
                              FormsApi api = new FormsApi();
                              print(await api.uploadForm(formdata));
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CreateForm(date,
                                                                formdata)));
                                            },
                                            child: const Text('Create'),
                                          ),
                                        ],
                                      ));
                            },
                            subText: ""),
                        const SizedBox(height: 50),
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
                ),
              )
            ]),
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
          height: MediaQuery.of(context).size.height * 0.25,
          // padding: const EdgeInsets.all(25.0),
          decoration: const BoxDecoration(
            color: Colors.transparent,
            //borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
                image: const AssetImage('assets/images/FcCards.gif'),
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

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title, description;

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  Timer? _timer;
  late double _progress;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Text(
            "${widget.title}",
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
              thickness: 2,
              indent: 5,
              endIndent: 5,
              color: Colors.orange.withOpacity(.5)),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: InkWell(
              highlightColor: Colors.grey[200],
              onTap: () {
                //do somethig
                Navigator.pop(context);
              },
              child: const Center(
                child: Text(
                  "Ok",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
