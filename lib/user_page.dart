import 'package:flutter/material.dart';
import 'caretaker_home.dart';
import 'login_page.dart';

class UserPage extends StatelessWidget {
  final String name;
  final String urlImage;
  const UserPage({
    Key? key,
    required this.name,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF006064),
        title: Text("Health Tracker"),
        leading: Container(
          child: CircleAvatar(
            backgroundImage: AssetImage('images/applicationicon.jpg'),
            radius: 150,
          ),
        ),
        centerTitle: true,
      ),
      body: Image.network(
        urlImage,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ));
}
