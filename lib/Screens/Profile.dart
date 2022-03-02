import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Home_screen.dart';

class ProfileHome extends StatefulWidget {
  const ProfileHome({Key? key}) : super(key: key);

  @override
  _ProfileHomeState createState() => _ProfileHomeState();
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

final regNo = List<String>.generate(10, (i) => 'RegNo: $i');
final names = List<String>.generate(10, (i) => 'Name: $i');
int len = regNo.length;

class _ProfileHomeState extends State<ProfileHome> {
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
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "PROFILE",
            textAlign: TextAlign.justify,
            style: GoogleFonts.adventPro(
                fontSize: 25,
                color: Colors.orangeAccent,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: _backButton(),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
            child: Container(
                child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Bg.jpeg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                  const CardFb1(),
                  const Divider(
                      thickness: 2,
                      indent: 15,
                      endIndent: 15,
                      color: Colors.white),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Total: $len',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.adventPro(
                                fontSize: 18,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              )))),
                  const Divider(
                      thickness: 2,
                      indent: 15,
                      endIndent: 15,
                      color: Colors.white),
                  const CardFb2(),
                ])),
          ),
        ]))));
  }
}

Widget _dropBox(context, String title, List<NewObject> key, int i) {
  return Container(
    margin: const EdgeInsets.all(5),
    width: MediaQuery.of(context).size.width * 0.90,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: GoogleFonts.portLligatSans(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.limeAccent,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.44,
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
                              SizedBox(
                                  width: MediaQuery.of(context).size.height *
                                      0.005),
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          value: item,
                        ))
                    .toList(),
                onChanged: (value) {}),
          ),
        )
      ],
    ),
  );
}

//setState(Null Function() param0) {}

class CardFb2 extends StatelessWidget {
  const CardFb2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: 500,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            offset: const Offset(-6.0, -6.0),
            blurRadius: 16.0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(6.0, 6.0),
            blurRadius: 16.0,
          ),
        ],
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      _dropBox(context, "Batch", title, 0),
                      _dropBox(context, "Dept", department, 1),
                    ],
                  ),
                ),
                //FloatingActionButton(onPressed: onPressed),
                Flexible(
                  flex: 2,
                  child: NeumorphicButton(
                    onPressed: () {},
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(15)),
                        border: const NeumorphicBorder(color: Colors.orange)),
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "  VIEW  ",
                      style: GoogleFonts.adventPro(
                          fontSize: 15,
                          color: _textColor(context),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
                thickness: 2, indent: 8, endIndent: 8, color: Colors.white),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: Colors.black.withOpacity(0.3),
                  elevation: 10,
                  key: UniqueKey(),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "REG NO",
                            style: GoogleFonts.adventPro(
                                fontSize: 15,
                                color: Colors.orangeAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "STATUS",
                          style: GoogleFonts.adventPro(
                              fontSize: 15,
                              color: Colors.yellowAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )),
            Flexible(
              flex: 10,
              child: ListView.builder(
                  itemCount: regNo.length,
                  //reverse: true,
                  shrinkWrap: false,
                  // display each item of the product list
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          color: Colors.black.withOpacity(0.3),
                          elevation: 10,
                          key: UniqueKey(),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    regNo[index],
                                    style: GoogleFonts.adventPro(
                                        fontSize: 15,
                                        color: Colors.orangeAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  names[index],
                                  style: GoogleFonts.adventPro(
                                      fontSize: 15,
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ));
                  }),
            ),
          ],
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

class CardFb1 extends StatelessWidget {
  const CardFb1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      margin: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            offset: const Offset(-6.0, -6.0),
            blurRadius: 16.0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(6.0, 6.0),
            blurRadius: 16.0,
          ),
        ],
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 5,
                child: Column(
                  children: [
                    _dropBox(context, "Batch", title, 0),
                    _dropBox(context, "Dept", department, 1),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: NeumorphicButton(
                  onPressed: () {},
                  style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(15)),
                      border: const NeumorphicBorder(color: Colors.orange)),
                  child: Text(
                    "DOWNLOAD",
                    style: GoogleFonts.adventPro(
                        fontSize: 15,
                        color: _textColor(context),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
              thickness: 2, indent: 15, endIndent: 15, color: Colors.white),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Send to mail... ",
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
          ),
          // const SizedBox(
          //       height: 5,
          //     ),
        ],
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
