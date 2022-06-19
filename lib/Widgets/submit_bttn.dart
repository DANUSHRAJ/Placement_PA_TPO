import 'dart:convert';

import 'package:admin_sjit_pp/API/toggle.api.dart';
import 'package:admin_sjit_pp/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class SubmitBttn extends StatefulWidget {
  const SubmitBttn({Key? key}) : super(key: key);

  @override
  _SubmitBttnState createState() => _SubmitBttnState();
}

class _SubmitBttnState extends State<SubmitBttn> {
  String tokenId = "";

  void configOneSignal() {
    OneSignal.shared.setAppId('777c9b28-93c5-4aa4-bd2a-25c4e5515460');
  }

  @override
  void initState() {
    super.initState();
    super.initState();
    configOneSignal();
  }

  Future<void> sendNotification(
      List<String?> tokenIdList, String heading, String contents) async {
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
  }

  Future<void> generateNotification() async {
    OSDeviceState? status = await OneSignal.shared.getDeviceState();
    tokenId = (status?.userId).toString();
    await sendNotification([], "Alert!", "Admin Login Successfull!");
  }

  // Future<void> changeToggle() async {
  //   ToggleApi api = ToggleApi();
  //   await api.ToogleStatus("workshop", 0);
  // }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () async {
          //await changeToggle();
          await generateNotification();
          //HomePage
          //HomeScreen
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.adventPro(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: "Sign in"),
                  WidgetSpan(
                    child: Icon(Icons.arrow_right_alt_outlined,
                        size: 30, color: Colors.white),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
