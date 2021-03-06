//ignore_for_file: deprecated_member_use

import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'localization/app_localiztion.dart';
import 'navigation_drawer.dart';

class MyMonitor extends StatefulWidget {
  const MyMonitor({Key? key}) : super(key: key);

  @override
  _MyMonitorState createState() => _MyMonitorState();
}

class _MyMonitorState extends State<MyMonitor> {
  String displaytext = 'results go here';
  String displaytext1 = 'spo2 ';
  String displaytext2 = 'heartrate';
  late int x;
  final database = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
    activateListeners();
  }

  void activateListeners() {
    database.child('SPO2').onValue.listen((event) {
      final Object? oxygen = event.snapshot.value;
      setState(() {
        displaytext1 =
            '${AppLocalizations.of(context)?.translate('SPO2')}\n $oxygen % ';
      });
    });
    database.child('HEARTRATE').onValue.listen((event) {
      final Object? heart = event.snapshot.value;
      setState(() {
        displaytext2 =
            ' ${AppLocalizations.of(context)?.translate('Heart')}\n $heart bpm ';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeceff1),
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(
          '${AppLocalizations.of(context)?.translate('appTitle')}',
          style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30),
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: Opacity(
                  opacity: 0.5,
                  child: ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        color: Colors.white,
                        height: 200,
                      ))),
            ),
            ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: Color(0xff006064),
                  height: 180,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 110,
                ),
                Text(
                  '${AppLocalizations.of(context)?.translate('vitals')}',
                  style: TextStyle(
                      fontFamily: 'Montserrat Medium',
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircularPercentIndicator(
                      animation: true,
                      animationDuration: 3000,
                      radius: 100,
                      lineWidth: 20,
                      percent: 1.0,
                      progressColor: Colors.blue[700],
                      backgroundColor: Colors.blue.shade200,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(displaytext1,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat Medium')),
                    ),
                    SizedBox(height: 60),
                    CircularPercentIndicator(
                      animation: true,
                      animationDuration: 3000,
                      radius: 100,
                      lineWidth: 20,
                      percent: 1.0,
                      progressColor: Colors.red.shade500,
                      backgroundColor: Colors.red.shade100,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text('$displaytext2',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat Medium'),
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
