import 'package:flutter/material.dart';

import 'package:grad_app/caretaker_home.dart';
import 'package:grad_app/patient_home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'caretaker_home.dart';
import 'google_login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF006064),
      appBar: AppBar(
        title: Text('Health Monitor System'),
        backgroundColor: Color(0xFF006064),
      ),
      body: loginUI(),
    );
  }

  loginUI() {
    return Consumer<GoogleSignInController>(builder: (context, model, child) {
      if (model.googleAccount != null) {
        return Center(
          child: loggedInUI(model),
        );
      } else {
        return loginControls(context);
      }
    });
  }

  /*loggedInUI(GoogleSignInController model) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage:
                Image.network(model.googleAccount!.photoUrl ?? '').image,
            radius: 70,
          ),
          SizedBox(height: 8),
          Text('Welcome ${model.googleAccount!.displayName ?? ''}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
          Text(model.googleAccount!.email,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 40),
          Text(
            'To continue to the Home Page, please pick your status: \n',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          ElevatedButton.icon(
            icon: Text('Caretaker', style: TextStyle(color: Color(0xFF006064))),
            label:
                Icon(Icons.family_restroom_outlined, color: Color(0xFF006064)),
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
            icon: Text('Patient', style: TextStyle(color: Color(0xFF006064))),
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
        ]);
  }
*/
  loginControls(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            CircleAvatar(
              backgroundImage: AssetImage('images/appicon.jfif'),
              radius: 100,
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hey there,\n Welcome Back!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sign Up with your Google account',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 15),
            //Image.asset()
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Color(0xFF006064),
                minimumSize: Size(double.infinity, 50),
              ),
              icon: FaIcon(FontAwesomeIcons.google),
              label: Text('Sign Up with Google'),
              onPressed: () {
                Provider.of<GoogleSignInController>(context, listen: false)
                    .login();
              },
            ),
          ],
        ));
  }

  loggedInUI(GoogleSignInController model) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage:
                Image.network(model.googleAccount!.photoUrl ?? '').image,
            radius: 70,
          ),
          SizedBox(height: 8),
          Text('Welcome ${model.googleAccount!.displayName ?? ''}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
          Text(model.googleAccount!.email,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 40),
          Text(
            'To continue to the Home Page, please pick your status: \n',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          ElevatedButton.icon(
            icon: Text('Caretaker', style: TextStyle(color: Color(0xFF006064))),
            label:
                Icon(Icons.family_restroom_outlined, color: Color(0xFF006064)),
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
            icon: Text('Patient', style: TextStyle(color: Color(0xFF006064))),
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
        ]);
  }
}