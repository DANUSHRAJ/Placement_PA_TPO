import 'package:flutter/material.dart';

class EmailInputFieldFb3 extends StatelessWidget {
  final TextEditingController inputController;
  const EmailInputFieldFb3({Key? key, required this.inputController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(boxShadow: [
      //   BoxShadow(
      //       offset: const Offset(12, 26),
      //       blurRadius: 50,
      //       spreadRadius: 0,
      //       color: Colors.yellow.withOpacity(.25)),
      // ]),
      child: TextField(
        controller: inputController,
        onChanged: (value) {
          //Do something wi
        },
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 19, color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.amberAccent,
          ),
          filled: true,
          hintText: 'Enter your email',
          hintStyle: TextStyle(color: Colors.white.withOpacity(.75)),
          contentPadding: const EdgeInsets.all(0.0),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}
