import 'package:flutter/material.dart';

class ProfileHome extends StatefulWidget {
  const ProfileHome({Key? key}) : super(key: key);

  @override
  _ProfileHomeState createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile_home'),
      ),
      body: Container(),
    );
  }
}
