import 'dart:convert';

import 'package:admin_sjit_pp/API/forms.api.dart';
import 'package:flutter/material.dart';

import 'forms_homepage.dart';

class DisplayForm extends StatefulWidget {
  final dynamic finaldata;
  final String date;
  const DisplayForm(this.finaldata, this.date, {Key? key}) : super(key: key);

  @override
  _DisplayFormState createState() =>
      _DisplayFormState(finaldata: finaldata, date: date);
}

class _DisplayFormState extends State<DisplayForm> {
  //input data
  String date;
  dynamic finaldata;
  List maindata = [];
  //data form user
  List _answer = [];
  String _result = '';
  _DisplayFormState({required this.finaldata, required this.date});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    maindata = finaldata[0]["data"][1];
    _answer = maindata;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('USER DEFINED FORM'),
        actions: [
          IconButton(
              onPressed: () async {
                FormsApi api = FormsApi();
                await api.uploadForm(finaldata[0]);
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      elevation: 15,
                      backgroundColor: const Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(20.0),
                      ),
                      title: const Text('Form Created Successfully'),
                      actions: [
                        TextButton(
                            //onPressed: (){},
                            //onPressed: ()=> Navigator.popUntil(context, ModalRoute.withName('/formHome')),
                            onPressed: ()=> Navigator.popAndPushNamed(context, '/formHome'),
                            child: const Text('Ok')),
                      ],
                    )
                );
              },
              icon: const Icon(Icons.done_outlined))
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 5.0,
                        ),
                    itemCount: maindata.length,
                    itemBuilder: (context, index) {
                      dynamic element = maindata[index];
                      String type = element['type'];
                      int pos = element['pos'];
                      if (type == 'checkbox') {
                        return CATag(pos, index);
                      }
                      if (type == 'radio') {
                        return RATag(pos, index);
                      }
                      return QATags(pos, index);
                    }),
              ),
              const SizedBox(
                width: 3,
              ),
              //Flexible(child: ListView(children: [Text(_result),]),),
            ],
          )),
    );
  }

  //Checkbox Tag

  CATag(pos, index) {
    var value = maindata[index]['ques'];
    var ans = _answer[index]['answer'];
    List d = maindata[index]['options'];
    if (ans == null) {
      _answer[index]['answer'] = [];
      for (int i = 0; i < d.length; i++) {
        _answer[index]['answer'].add(false);
      }
    }
    return Column(
      children: [
        Wrap(
          children: [
            Text('Question No. $pos'),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Container(
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: d.length,
            separatorBuilder: (context, ind) => const SizedBox(
              height: 5.0,
            ),
            itemBuilder: (context, ind) {
              return CheckboxListTile(
                  title: Text(d[ind]),
                  value: _answer[index]['answer'][ind],
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (val) {
                    setState(() {
                      _answer[index]['answer'][ind] = val;
                    });
                  });
            },
          ),
        )
      ],
    );
  }

  //radio Tag

  RATag(pos, index) {
    var value = maindata[index]['ques'];
    List d = maindata[index]['choices'];
    return Column(
      children: [
        Wrap(
          children: [
            Text('Question No. $pos'),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Container(
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: d.length,
            separatorBuilder: (context, ind) => const SizedBox(
              height: 5.0,
            ),
            itemBuilder: (context, ind) {
              return RadioListTile<String>(
                  title: Text(d[ind]),
                  value: d[ind],
                  groupValue: _answer[index]['answer'],
                  onChanged: (val) {
                    setState(() {
                      _answer[index]['answer'] = d[ind];
                    });
                  });
            },
          ),
        )
      ],
    );
  }

  //Question Tag

  QATags(pos, index) {
    var value = maindata[index]['ques'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          children: [
            Text('Question No. $pos'),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )
          ],
        ),
        TextFormField(
          onChanged: (val) {
            _onUpdate(index, val);
          },
        )
      ],
    );
  }

  _onUpdate(int index, String val) {
    setState(() {
      _answer[index]['ans'] = val;
      _result = _prettyPrint(_answer);
    });
  }

  String _prettyPrint(jsonObject) {
    var encoder = const JsonEncoder.withIndent('    ');
    return encoder.convert(jsonObject);
  }
}
