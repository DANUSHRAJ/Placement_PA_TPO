import 'package:flutter/material.dart';

class PasswordInputFieldFb3 extends StatelessWidget {
  final TextEditingController inputController;
  const PasswordInputFieldFb3({Key? key, required this.inputController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(boxShadow: [
      //   BoxShadow(
      //       offset: const Offset(12, 26),
      //       blurRadius: 50,
      //       spreadRadius: 10,
      //       color: Colors.yellow.withOpacity(.2)),
      // ]),
      child: TextField(
        obscureText: true,
        controller: inputController,
        onChanged: (value) {
          //Do something wi
        },
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 20, color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.password_rounded,
            color: Colors.amberAccent,
          ),
          filled: true,
          hintText: 'Enter your password',
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
