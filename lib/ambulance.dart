import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
//import 'package:flutter_speed_dial/flutter_speed_dial.dart';
//import 'package:url_launcher/url_launcher.dart';

class CallAmbulance extends StatelessWidget {
  Widget ambulanceButton() {
    final number1 = '123';
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF006064),
          padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
          textStyle: TextStyle(fontSize: 24),
        ),
        onPressed: () async {
          await FlutterPhoneDirectCaller.callNumber(number1);
        },
        child: Text('Call Ambulance'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speed Dial'),
      ),
      body: Center(
        child: ambulanceButton(),
      ),
    );
  }
}
