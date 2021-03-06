import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'display_form.dart';

class CreateForm extends StatefulWidget {
  final dynamic final_data;

  const CreateForm(this.final_data, {Key? key}) : super(key: key);

  @override
  _CreateFormState createState() => _CreateFormState(final_data: final_data);
}

class _CreateFormState extends State<CreateForm> {
  // var box = BoxDecoration(
  //   border: Border.all(
  //     color: Colors.grey,
  //     width: 3,
  //   ),
  //   borderRadius: BorderRadius.circular(30),
  // );

  dynamic final_data;
  String title = '';
  String date = '';
  String _result = '';
  List<dynamic> _values = [];

  _CreateFormState({required this.final_data});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = final_data[0]["data"][0];
    _values = final_data[0]["data"][1];
    date = final_data[0]['data'][2];
    print(_values);
    print(title);
    if (_values.isEmpty) {
      _values.add(
          {'type': 'Question', 'pos': 1, 'ques': ' Enter your text here..'});
    }
    // _values = [
    //   {'type': 'Question', 'pos': 1, 'ques': 'What is your age??'},
    //   {
    //     'type': 'radio',
    //     'pos': 2,
    //     'ques': 'Gender',
    //     'choices': ['Male', 'Female', 'Other']
    //   },
    //   {
    //     'type': 'checkbox',
    //     'pos': 3,
    //     'ques': 'Languages Known',
    //     'options': ['Tamil', 'English', 'Hindi']
    //   }
    // ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        title: Text(
          "$title",
          style: GoogleFonts.adventPro(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 20,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh_rounded),
          ),
          IconButton(
            onPressed: () {
              final_data[0]["data"][1] = _values;
              //print(final_data);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DisplayForm(final_data, date)));
            },
            icon: const Icon(Icons.send_rounded),
          ),
        ],
      ),
      body: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/images/Bg.jpeg'), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _values.length,
                    itemBuilder: (context, index) {
                      dynamic element = _values[index];
                      String type = element['type'];
                      int pos = element['pos'];
                      if (type == 'checkbox') {
                        return CTags(pos, index);
                      }
                      if (type == 'radio') {
                        return RTags(pos, index);
                      }
                      return QTags(pos, index);
                      //return Tags(element: element);
                    }),
              ),
              const SizedBox(
                height: 10.0,
              ),

              //Flexible(child: ListView(children: [Text(_result)]),),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              label: 'Radio',
              child: const Icon(Icons.radio_button_checked),
              onTap: () {
                setState(() {
                  int d = _values.length + 1;
                  dynamic data = {
                    'type': 'radio',
                    'pos': d,
                    'ques': '',
                    'choices': [''],
                  };
                  _values.add(data);
                });
              }),
          SpeedDialChild(
              label: 'Checkbox',
              child: const Icon(Icons.check_box_rounded),
              onTap: () {
                setState(() {
                  int d = _values.length + 1;
                  dynamic data = {
                    'type': 'checkbox',
                    'pos': d,
                    'ques': '',
                    'options': [''],
                  };
                  _values.add(data);
                });
              }),
          SpeedDialChild(
            backgroundColor: Colors.white,
            label: 'Short answer ',
            child: const Icon(Icons.short_text_rounded),
            onTap: () async {
              setState(() {
                int d = _values.length + 1;
                dynamic data = {'type': 'Question', 'pos': d, 'ques': ''};
                _values.add(data);
              });
            },
          ),
          SpeedDialChild(
            label: 'Heading',
            child: const Icon(Icons.title_rounded),
            onTap: () {
              setState(() {
                int d = _values.length + 1;
                dynamic data = {
                  'type': 'Heading',
                  'pos': d,
                  'head': 'Untitled',
                  'desc': ''
                };
                _values.add(data);
              });
            },
          ),
          SpeedDialChild(
            label: 'Remove last added',
            child: IconButton(
              onPressed: () {
                setState(() {
                  _values.removeLast();
                });
              },
              icon: const Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }

  //heading

  //CheckBox

  CTags(key, index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        // image: const DecorationImage(
        //     image: AssetImage('assets/images/toggle_bg1.png'),
        //     fit: BoxFit.fill),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      //decoration: box,
      child: Column(
        children: [
          Row(
            children: [
              Text('Question $key'),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: TextFormField(
                  initialValue: _values[index]['ques'],
                  onChanged: (val) {
                    _onUpdate(val, index);
                  },
                ),
              ),
            ],
          ),
          Container(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _values[index]['options'].length,
              itemBuilder: (context, pos) {
                //int pos= _values[index]['choices'].length;
                //print(pos);
                return _options(pos, index);
                //return Tags(element: element);
              },
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    var d = _values[index]['options'];
                    d.add('');
                    _values[index]['options'] = d;
                  });
                },
                icon: const Icon(Icons.add_circle_outline_rounded),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    var d = _values[index]['options'];
                    d.removeLast();
                    _values[index]['options'] = d;
                  });
                },
                icon: const Icon(Icons.remove_circle_outline_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //Radio
  RTags(key, index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      //decoration: box,
      child: Column(
        children: [
          Row(
            children: [
              Text('Question $key'),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: TextFormField(
                  initialValue: _values[index]['ques'],
                  onChanged: (val) {
                    _onUpdate(val, index);
                  },
                ),
              ),
            ],
          ),
          Container(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _values[index]['choices'].length,
              itemBuilder: (context, pos) {
                //int pos= _values[index]['choices'].length;
                //print(pos);
                return _choices(pos, index);
                //return Tags(element: element);
              },
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    var d = _values[index]['choices'];
                    d.add('');
                    _values[index]['choices'] = d;
                  });
                },
                icon: const Icon(Icons.add_circle_outline_rounded),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    var d = _values[index]['choices'];
                    d.removeLast();
                    _values[index]['choices'] = d;
                  });
                },
                icon: const Icon(Icons.remove_circle_outline_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //Text
  QTags(key, index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      // decoration: box,
      child: Row(
        children: [
          Text('Question $key'),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
              child: TextFormField(
            initialValue: _values[index]['ques'],
            onChanged: (val) {
              _onUpdate(val, index);
            },
          )),
        ],
      ),
    );
  }

  _onUpdate(String val, int index) {
    setState(() {
      _values[index]['ques'] = val;
      _result = _prettyPrint(_values);
    });
  }

  _onUpdateList(val, index, type, pos) {
    setState(() {
      _values[index][type][pos] = val;
      _result = _prettyPrint(_values);
    });
  }

  String _prettyPrint(jsonObject) {
    var encoder = const JsonEncoder.withIndent('    ');
    return encoder.convert(jsonObject);
  }

  //choices

  _choices(pos, index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      // decoration: box,
      //margin: const EdgeInsets.fromLTRB(20, 3, 0, 3),
      child: Row(
        children: [
          const Icon(Icons.circle_outlined),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: TextFormField(
            initialValue: _values[index]['choices'][pos],
            onChanged: (val) {
              _onUpdateList(val, index, 'choices', pos);
            },
          )),
        ],
      ),
    );
  }

  //options

  _options(pos, index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.all(10),
      // decoration: box,
      // margin: const EdgeInsets.fromLTRB(20, 3, 0, 3),
      child: Row(
        children: [
          const Icon(Icons.check_box_outlined),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: TextFormField(
            initialValue: _values[index]['options'][pos],
            onChanged: (val) {
              _onUpdateList(val, index, 'options', pos);
            },
          )),
        ],
      ),
    );
  }
}

class Tags extends StatefulWidget {
  final dynamic element;
  const Tags({Key? key, required this.element}) : super(key: key);
  @override
  _TagsState createState() => _TagsState(element);
}

class _TagsState extends State<Tags> {
  dynamic element;
  _TagsState(this.element);
  @override
  Widget build(BuildContext context) {
    return Text('$element');
  }
}
