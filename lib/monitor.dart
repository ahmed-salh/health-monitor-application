//ignore_for_file: deprecated_member_use

import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
      //final x=oxygen;
      setState(() {
        displaytext1 = 'SpO2\n $oxygen % ';
      });
    });
    database.child('HEARTRATE').onValue.listen((event) {
      final Object? heart = event.snapshot.value;
      setState(() {
        displaytext2 = ' HeartRate\n $heart bpm ';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        //backgroundColor: Colors.cyan,
        title: Text(
          'Health Tracker',
          style: TextStyle(
              //fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /*TweenAnimationBuilder(
                  tween: Tween (begin: 0.0, end : 1.0),
                  duration: Duration(seconds: 3),
                  builder: (context,value,)
              )*/
              CircularPercentIndicator(
                animation: true,
                animationDuration: 3000,
                radius: 100,
                lineWidth: 20,
                percent: 0.95,
                progressColor: Colors.blue[700],
                backgroundColor: Colors.blue.shade200,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text(displaytext1,
                    style:
                        TextStyle(fontSize: 25, fontStyle: FontStyle.italic)),
              ),
              CircularPercentIndicator(
                animation: true,
                animationDuration: 3000,
                radius: 100,
                lineWidth: 20,
                percent: 0.8,
                progressColor: Colors.red.shade500,
                backgroundColor: Colors.red.shade100,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text('$displaytext2',
                    style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Read ya habeby'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              Text(displaytext, style: TextStyle(fontSize: 50)),
              Text(displaytext1,style: TextStyle(fontSize: 45)),
              Text(displaytext2,style: TextStyle(fontSize: 45)),
            ],
          ),
        ),
      )
    );

  }

}
*/
