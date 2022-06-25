import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad_app/patient_home.dart';
import 'package:provider/provider.dart';
import 'caretaker_home.dart';
import 'login_page.dart';
import 'google_login_controller.dart';
/*
class UserPage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Welcome'), centerTitle: true, actions: []),
        body: Container(
            alignment: Alignment.center,
            color: Colors.blueGrey.shade50,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 32),

              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user!.photoURL.toString()),
              ),
              SizedBox(height: 20),
              Text('Welcome ' + user!.displayName.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 15),
              Text('${user!.email}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                'To continue to the Home Page, please pick your status: \n',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                icon: Text('Caretaker',
                    style: TextStyle(color: Color(0xFF006064))),
                label: Icon(Icons.family_restroom_outlined,
                    color: Color(0xFF006064)),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    primary: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
              ),
              SizedBox(height: 10),
              //child: const Text('Caretaker?')),
              ElevatedButton.icon(
                icon:
                    Text('Patient', style: TextStyle(color: Color(0xFF006064))),
                label: Icon(Icons.sick_outlined, color: Color(0xFF006064)),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 62, vertical: 10),
                    primary: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyPatientPage()),
                  );
                },
              ),
              SizedBox(height: 20),
              ActionChip(
                padding: EdgeInsets.all(10),
                backgroundColor: Colors.white,
                avatar: Icon(Icons.logout, color: Color(0xFF006064)),
                label: Text("Log Out",
                    style: TextStyle(color: Color(0xFF006064), fontSize: 20)),
                onPressed: () {
                  Provider.of<GoogleSignInController>(context, listen: false)
                      .logOut();
                },
              )
            ])));
  }
}*/
