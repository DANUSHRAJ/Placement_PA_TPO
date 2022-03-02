import 'package:flutter/material.dart';

class FormList extends StatefulWidget {
  const FormList({Key? key}) : super(key: key);

  @override
  _FormListState createState() => _FormListState();
}

class _FormListState extends State<FormList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FORM LIST'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.separated(
                  itemBuilder: (context,index){
                    return Text('$index');
                  },
                  separatorBuilder: (context,index) => const SizedBox(height: 5,),
                  itemCount: 10
              ),
            ),
          ],
        ),
      ),
    );
  }
}
