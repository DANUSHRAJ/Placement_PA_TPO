import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'display_form.dart';

class CreateForm extends StatefulWidget {
  final dynamic final_data;
  final String date;

  const CreateForm(this.date,this.final_data, {Key? key}) : super(key: key);

  @override
  _CreateFormState createState() => _CreateFormState(final_data: final_data,date:date);
}

class _CreateFormState extends State<CreateForm> {
  var box = BoxDecoration(
    border: Border.all(
      color: Colors.grey,
      width: 3,
    ),
    borderRadius: BorderRadius.circular(30),
  );

  dynamic final_data;
  String date;
  String title = '';
  String _result = '';
  List<dynamic> _values = [];

  _CreateFormState({required this.final_data,required this.date});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = final_data[date][0];
    _values = final_data[date][1];
    if (_values.isEmpty) {
      _values.add({'type': 'Question', 'pos': 1, 'ques': 'What is your age?'});
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
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh_rounded),
          ),
          IconButton(
            onPressed: () {
              final_data[date][1] = _values;
              //print(final_data);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DisplayForm(final_data,date)));
            },
            icon: const Icon(Icons.send_rounded),
          ),
        ],
      ),
      body: Column(
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
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: box,
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
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: box,
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
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: box,
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
      margin: const EdgeInsets.fromLTRB(20, 3, 0, 3),
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
      margin: const EdgeInsets.fromLTRB(20, 3, 0, 3),
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
