import 'package:admin_sjit_pp/API/forms.api.dart';
import 'package:flutter/material.dart';

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
