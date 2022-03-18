import 'dart:ui';

import 'package:admin_sjit_pp/API/forms.api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Home_screen.dart';
import 'forms_homepage.dart';

class FormList extends StatefulWidget {
  const FormList({Key? key}) : super(key: key);

  @override
  _FormListState createState() => _FormListState();
}

class _FormListState extends State<FormList> {
  FormsApi api = new FormsApi();

  dynamic FormDataFinal;

  void getAllFormData() async {
    FormDataFinal = await api.downloadForm();
    // print("Success");
    // print(FormDataFinal.runtimeType);
    // print(FormDataFinal);
  }

  @override
  void initState() {
    super.initState();
    super.initState();
    getAllFormData();
    // EasyLoading.removeCallbacks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "FORM LIST",
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
                        FinanceListTile(
                            text: "Form Name1",
                            leadingIcon: Icon(Icons.document_scanner_outlined),
                            trailingIcon: Icon(Icons.chevron_right),
                            onTap: () {},
                            color: Color(0xFFF1F1F3)),
                        FinanceListTile(
                            text: "Form Name2",
                            leadingIcon: Icon(Icons.document_scanner_outlined),
                            trailingIcon: Icon(Icons.chevron_right),
                            onTap: () {},
                            color: Color(0xFFF2F5F1))
                        // GlassCard(
                        //   title: "Netflix",
                        //   subtitle: "\$15.99 / month",
                        //   icon: Icon(
                        //     Icons.movie,
                        //     color: Colors.greenAccent,
                        //     size: 30,
                        //   ),
                        // )
                        // Flexible(
                        //   child: ListView.separated(
                        //       itemBuilder: (context,index){
                        //         return Text('$index');
                        //       },
                        //       separatorBuilder: (context,index) => const SizedBox(height: 5,),
                        //       itemCount: 10
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ]))
        ]))));
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FormHome()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: const Icon(Icons.arrow_back_ios_new_outlined,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class FinanceListTile extends StatelessWidget {
  final String text;
  final Widget leadingIcon;
  final Widget trailingIcon;
  final Function() onTap;
  final Color color;
  const FinanceListTile(
      {required this.text,
      required this.leadingIcon,
      required this.trailingIcon,
      required this.onTap,
      this.color = const Color(0xFFCA9C38),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Divider(
            height: 3,
            thickness: 5,
            indent: 5,
            endIndent: 5,
            color: Colors.orange),
        ListTileTheme(
          child: ListTile(
            leading: leadingIcon,
            title: Text(
              text,
              textScaleFactor: 1,
            ),
            trailing: trailingIcon,
            selected: false,
            onTap: onTap,
          ),
          textColor: color,
          iconColor: color,
        ),
        Divider(
            height: 3,
            thickness: 5,
            indent: 5,
            endIndent: 5,
            color: Colors.orange),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
