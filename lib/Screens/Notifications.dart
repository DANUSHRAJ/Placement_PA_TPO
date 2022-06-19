import 'dart:convert';

import 'package:admin_sjit_pp/API/forms.api.dart';
import 'package:admin_sjit_pp/API/notification.api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import '../Home_screen.dart';

TextEditingController heading = new TextEditingController();
TextEditingController message = new TextEditingController();

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      // Color.fromRGBO(30, 9, 23, 1),
      appBar: AppBar(
        title: Text(
          "NOTIFICATIONS",
          textAlign: TextAlign.justify,
          style: GoogleFonts.adventPro(
              fontSize: 25,
              color: Colors.orangeAccent,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: _backButton(),
        actions: [
          ThumbsUpButton(onPressed: () {}, color: Colors.orange),
        ],

        backgroundColor: Colors.black,
        // Color.fromRGBO(30, 9, 23, 1),
        elevation: 0,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 150),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: EmailInputFb3(
                          inputController: heading, val: "Heading"),
                    )),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      EmailInputFb2(inputController: message, val: "Message"),
                ),
                //  EmailInputFb1(),
                // ThumbsUpButton(onPressed: () {}, color: Colors.orange),
              ],
            ),
          )),
    );
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

gradient5() {
  return LinearGradient(colors: [Colors.orange, Colors.yellow]);
}

class EmailInputFb2 extends StatelessWidget {
  final TextEditingController inputController;
  final String val;
  const EmailInputFb2(
      {Key? key, required this.inputController, required this.val})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff4338CA);
    const secondaryColor = Color(0xff6D28D9);
    const accentColor = Color(0xffffffff);
    const backgroundColor = Colors.amber;
    const errorColor = Color(0xffEF4444);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            val,
            textAlign: TextAlign.justify,
            style: GoogleFonts.adventPro(
                fontSize: 15,
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
            child: TextField(
              controller: inputController,
              onChanged: (value) {
                //Do something wi
              },
              // keyboardType: TextInputType.emailAddress,
              keyboardType: TextInputType.multiline,
              // minLines: 1,
              maxLines: 1000,
              maxLength: 100000,
              style: const TextStyle(fontSize: 15, color: Colors.black),
              decoration: InputDecoration(
                label: const Text("Message"),
                labelStyle: const TextStyle(color: primaryColor),
                // prefixIcon: Icon(Icons.email),
                filled: true,
                fillColor: accentColor,
                hintText: 'Enter your Message here',
                hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                contentPadding: EdgeInsets.all(8.0),
                //d  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: errorColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmailInputFb3 extends StatelessWidget {
  final TextEditingController inputController;
  final String val;
  const EmailInputFb3(
      {Key? key, required this.inputController, required this.val})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff4338CA);
    const secondaryColor = Color(0xff6D28D9);
    const accentColor = Color(0xffffffff);
    const backgroundColor = Colors.amber;
    const errorColor = Color(0xffEF4444);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          val,
          textAlign: TextAlign.justify,
          style: GoogleFonts.adventPro(
              fontSize: 15,
              color: Colors.orangeAccent,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1)),
          ]),
          child: TextField(
            controller: inputController,
            onChanged: (value) {
              //Do something wi
            },
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            decoration: InputDecoration(
              label: const Text("Heading"),
              labelStyle: const TextStyle(color: primaryColor),
              // prefixIcon: Icon(Icons.email),
              filled: true,
              fillColor: accentColor,
              hintText: 'Enter your head text',
              hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ThumbsUpButton extends StatefulWidget {
  const ThumbsUpButton(
      {Key? key, required this.onPressed, this.color = Colors.black})
      : super(key: key);
  final Function onPressed;
  final Color color;
  @override
  _ThumbsUpButtonState createState() => _ThumbsUpButtonState();
}

class _ThumbsUpButtonState extends State<ThumbsUpButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
      icon: Icon(Icons.send, color: widget.color),
      onPressed: () {
        fetchDetails();
        setState(() {
          isLiked = !isLiked;
          isLiked = true;
        });
      },
    ));
  }

  fetchDetails() async {
    NotificationApi api = NotificationApi();
    if ((heading.value.text).isNotEmpty && (message.value.text).isNotEmpty) {
      List<String> result = await api.getTokenIdByBatch("2023");
      print("Result");
      print(result);
      await sendNotification(result, heading.value.text, message.value.text);
    } else {
      Fluttertoast.showToast(
          backgroundColor: Colors.redAccent,
          msg: "Content Required !",
          textColor: Colors.white, // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.SNACKBAR, // location
          timeInSecForIosWeb: 1 // duration
          );
    }
  }

  Future<void> sendNotification(
      List<String?> tokenIdList, String heading, String contents) async {
    NotificationApi api = NotificationApi();
    await api.storeNotification(heading, contents, "2023");
    await post(
      Uri.parse('https://onesignal.com/api/v1/notifications'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "app_id": '777c9b28-93c5-4aa4-bd2a-25c4e5515460',

        "include_player_ids": tokenIdList,

        // android_accent_color reprsent the color of the heading text in the notifiction
        "android_accent_color": "FF9976D2",

        // "small_icon":"ic_stat_onesignal_default",

        "large_icon":
            "https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi",

        "headings": {"en": heading},

        "contents": {"en": contents},
      }),
    );
    print("Notification Success!");
    Fluttertoast.showToast(
        backgroundColor: Colors.amberAccent,
        msg: "Notification sent successfully!",
        textColor: Colors.black, // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.SNACKBAR, // location
        timeInSecForIosWeb: 1 // duration
        );

  }
}
