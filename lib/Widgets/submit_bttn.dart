import 'package:admin_sjit_pp/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubmitBttn extends StatefulWidget {
  const SubmitBttn({Key? key}) : super(key: key);

  @override
  _SubmitBttnState createState() => _SubmitBttnState();
}

class _SubmitBttnState extends State<SubmitBttn> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
    );
  }
}
