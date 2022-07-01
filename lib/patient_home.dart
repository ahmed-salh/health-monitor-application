//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad_app/user_page.dart';
import 'package:grad_app/users.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'google_login_controller.dart';
import 'login_page.dart';

import 'ambulance.dart';
import 'livetrack.dart';
//import 'loggedin.dart';
import 'map_main.dart';
import 'navigation_drawer.dart';
import 'monitor.dart';

class MyPatientPage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);
  //final String title;

  @override
  _MyPatientPageState createState() => _MyPatientPageState();
}

class _MyPatientPageState extends State<MyPatientPage> {
  final number = '123';

  //GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardTextStyle = TextStyle(
      fontFamily: "Montserrat Medium",
      fontSize: 22.0,
      color: Colors.black,
    );
    return Scaffold(
        backgroundColor: Color(0xffeceff1),
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          //title: Text('${widget.title}'),
          title: Text('Health Tracker',
              style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30)),
          elevation: 20,
        ),
        body:
            /*StreamBuilder<User>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {}
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              //return SignUp();
              return Container(
                child: Center(
                  child: GestureDetector (
                    onTap: () async {
                      final newUser = await _googleSignIn.signIn();
                      final googleAuth = await newUser.authentication;
                      final creds = GoogleAuthProvider.credential(
                        accessToken: googleAuth.accessToken,
                        idToken: googleAuth.idToken
                      );
                      await FirebaseAuth.instance.signInWithCredential(creds);
                    },
                    child: Container()
                  )
                ),
              );
            }),*/
            Container(
                child: Stack(
          children: <Widget>[
            Opacity(
                opacity: 0.5,
                child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      color: Color(0xff006064),
                      height: 200,
                    ))),
            ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: Color(0xffe0f2f1),
                  height: 180,
                )),
            Container(
              height: size.height * .3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage(''),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: <Widget>[
                  Container(
                      height: 64,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 32,
                            backgroundImage: NetworkImage(
                                'https://lh3.googleusercontent.com/a-/AOh14Gh2IKK3ddU8x0huFJTu-m0y3zXTZ-Qo3Y6lhPMLw7E=s360-p-rw-no'),
                          ),
                          SizedBox(width: 16),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Hello, Yasmin!',
                                  style: TextStyle(
                                      fontFamily: 'PatuaOne',
                                      fontSize: 25,
                                      color: Color(0xff006064)),
                                ),
                              ])
                        ],
                      )),
                  SizedBox(height: 140),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 9,
                          margin: EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyMonitor()));
                              },
                              splashColor: Colors.red,
                              child: Center(
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                    Icon(Icons.favorite_sharp,
                                        size: 70.0, color: Colors.red),
                                    Text(
                                      'Monitor',
                                      style: cardTextStyle,
                                    ),
                                  ]))),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 9,
                          margin: EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserPage(
                                    urlImage: urlImage,
                                    name: name,
                                  )));*/
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              splashColor: Colors.blue,
                              child: Center(
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                    Icon(Icons.people_alt_outlined,
                                        size: 70.0, color: Colors.blueGrey),
                                    Text(
                                      'Users',
                                      style: cardTextStyle,
                                    ),
                                  ]))),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 9,
                          margin: EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CallAmbulance()));
                              },
                              splashColor: Colors.red,
                              child: Center(
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                    Icon(Icons.call_outlined,
                                        size: 70.0, color: Colors.red),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        'Call Ambulance',
                                        style: cardTextStyle,
                                      ),
                                    ),
                                  ]))),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            )
          ],
        )),
        floatingActionButton: SpeedDial(
            closeManually: false,
            overlayColor: Colors.grey,
            overlayOpacity: 0.5,
            curve: Curves.bounceIn,
            backgroundColor: Colors.redAccent,
            child: Icon(Icons.call),
            children: [
              SpeedDialChild(
                  child: Icon(Icons.emergency_sharp),
                  label: "Call Ambulance",
                  backgroundColor: Color(0xFFD50000),
                  onTap: () async {
                    await FlutterPhoneDirectCaller.callNumber(number);
                  })
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
