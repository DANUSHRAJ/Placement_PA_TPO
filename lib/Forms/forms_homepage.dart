import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text('Forms'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                  String title='';
                  showDialog(
                      context: context,
                      builder: (context) =>  AlertDialog(
                        title:  const Text('Create New Form'),
                        content: TextField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                          ),
                          onChanged: (value) => title = value,
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: (){
                              var date=DateTime.now().toString();
                              dynamic formdata={
                                date:[
                                  title,
                                  [
                                    {'type':'Question','pos':1,'ques':'Enter your Question'}
                                  ],
                                ],
                              };
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  CreateForm(date,formdata)));
                            },
                            child: const Text('Create'),
                          ),
                        ],
                      )
                  );
                },
                child: Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  child: const Text('CREATE NEW FORM'),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormList()));
                },
                child: Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  child: const Text('LIST OF FORMS'),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  child: const Text(''),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
