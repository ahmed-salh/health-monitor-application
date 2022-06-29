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

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);
  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final number = '123';

  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          //title: Text('${widget.title}'),
          title: Text('Health Tracker'),
        ),
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {}
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              //return SignUp();
              return Container(
                child: Center(
                    child: GestureDetector(
                        onTap: () async {
                          final newUser = await _googleSignIn.signIn();
                          final googleAuth = await newUser?.authentication;
                          final creds = GoogleAuthProvider.credential(
                              accessToken: googleAuth?.accessToken,
                              idToken: googleAuth?.idToken);
                          await FirebaseAuth.instance
                              .signInWithCredential(creds);
                        },
                        child: Container(
                          padding: EdgeInsets.all(15.0),
                          child: GridView.count(
                            crossAxisCount: 2,
                            children: <Widget>[
                              Card(
                                elevation: 9,
                                margin: EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyMonitor()));
                                    },
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                          Icon(Icons.favorite_sharp,
                                              size: 70.0, color: Colors.red),
                                          Text('Monitor',
                                              style: new TextStyle(
                                                  fontSize: 26.0)),
                                        ]))),
                              ),
                              Card(
                                elevation: 9,
                                margin: EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MapScreen()));
                                    },
                                    splashColor: Colors.green,
                                    child: Center(
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                          Icon(Icons.update,
                                              size: 70.0, color: Colors.green),
                                          Text('Live Tracker',
                                              style: new TextStyle(
                                                  fontSize: 26.0)),
                                        ]))),
                              ),
                              Card(
                                elevation: 9,
                                margin: EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                      /*  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserPage(urlImage: urlImage, name: name)));
                  */
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                    splashColor: Colors.blue,
                                    child: Center(
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                          Icon(Icons.people_alt_outlined,
                                              size: 70.0,
                                              color: Colors.blueGrey),
                                          Text('Users',
                                              style: TextStyle(fontSize: 26.0)),
                                        ]))),
                              ),
                              Card(
                                elevation: 9,
                                margin: EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CallAmbulance()));
                                    },
                                    splashColor: Colors.red,
                                    child: Center(
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                          Icon(Icons.call_outlined,
                                              size: 70.0, color: Colors.red),
                                          Text('Call Ambulance',
                                              style: new TextStyle(
                                                  fontSize: 20.0)),
                                        ]))),
                              ),
                            ],
                          ),
                        ))),
              );
            }),
        floatingActionButton: SpeedDial(
            closeManually: false,
            overlayColor: Colors.white10,
            overlayOpacity: 0.5,
            curve: Curves.bounceIn,
            backgroundColor: Colors.redAccent,
            child: const Icon(Icons.call),
            children: [
              SpeedDialChild(
                  child: const Icon(
                    Icons.emergency_sharp,
                    color: Colors.white,
                  ),
                  label: "Call Ambulance",
                  backgroundColor: const Color(0xFFD50000),
                  onTap: () async {
                    await FlutterPhoneDirectCaller.callNumber(number);
                  })
            ]));
  }
}
