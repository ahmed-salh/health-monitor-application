import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

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
        child: Text('Call Ambulance',
            style: TextStyle(
                fontFamily: 'Montserrat Regular',
                fontSize: 30,
                fontWeight: FontWeight.bold)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffeceff1),
        appBar: AppBar(
          title: Text('Speed Dial',
              style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30)),
        ),
        body: Stack(children: <Widget>[
          Opacity(
              opacity: 0.5,
              child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    color: Colors.white,
                    height: 200,
                  ))),
          ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: Color(0xff006064),
                height: 180,
              )),
          Center(
            child: ambulanceButton(),
          ),
        ]));
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size1) {
    debugPrint(size1.width.toString());
    var path = new Path();
    path.lineTo(0, size1.height);
    var firstStart = Offset(size1.width / 5, size1.height);
    var firstEnd = Offset(size1.width / 2.25, size1.height - 50.0);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size1.width - (size1.width / 3.24), size1.height - 105);

    var secondEnd = Offset(size1.width, size1.height - 10);

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size1.width, 0);
    path.close;
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
