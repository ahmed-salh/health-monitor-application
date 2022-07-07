import 'package:flutter/material.dart';

import 'package:grad_app/caretaker_home.dart';
import 'package:grad_app/patient_home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'caretaker_home.dart';
import 'google_login_controller.dart';
import 'localization/app_localiztion.dart';
import 'localization/localization_widget.dart';

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
        title: Text("${AppLocalizations.of(context)?.translate('appTitle')}",
            style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30)),
        backgroundColor: Color(0xFF006064),
        elevation: 20,
        leading: Container(
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: AssetImage('images/logogreen.jpg'),
            radius: 150,
          ),
        ),
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

  loginControls(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            CircleAvatar(
              backgroundImage: AssetImage('images/logogreen.jpg'),
              radius: 150,
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${AppLocalizations.of(context)?.translate('welcomeBanner')}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: "PatuaOne",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${AppLocalizations.of(context)?.translate('signInGoogle')}',
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: "Montserrat Regular",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Color(0xFF006064),
                minimumSize: Size(double.infinity, 50),
              ),
              icon: FaIcon(FontAwesomeIcons.google),
              label: Text(
                  '${AppLocalizations.of(context)?.translate('signInButton')}',
                  style: TextStyle(
                      fontFamily: 'Montserrat Medium',
                      fontWeight: FontWeight.bold)),
              onPressed: () {
                Provider.of<GoogleSignInController>(context, listen: false)
                    .login();
              },
            ),
            SizedBox(height: 30),
            LocalizationWidget(),
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
          Text(
              '${AppLocalizations.of(context)?.translate('welcomeUser')} ${model.googleAccount!.displayName ?? ''}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "PatuaOne",
                  fontWeight: FontWeight.bold)),
          Text(model.googleAccount!.email,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Montserrat Regular',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 40),
          Text(
            '${AppLocalizations.of(context)?.translate('checkStatus')}',
            style: TextStyle(
              fontFamily: "PatuaOne",
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          ElevatedButton.icon(
            icon: Text(
                '${AppLocalizations.of(context)?.translate('caretakerButton')}',
                style: TextStyle(
                    fontFamily: "PatuaOne",
                    color: Color(0xFF006064),
                    fontSize: 29)),
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
          ElevatedButton.icon(
            icon: Text(
                '${AppLocalizations.of(context)?.translate('patientButton')}',
                style: TextStyle(
                    fontFamily: "PatuaOne",
                    color: Color(0xFF006064),
                    fontSize: 30)),
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
          SizedBox(height: 28),
          ActionChip(
            padding: EdgeInsets.all(10),
            backgroundColor: Colors.white,
            avatar: Icon(Icons.logout, color: Color(0xFF006064)),
            label: Text("${AppLocalizations.of(context)?.translate('logout')}",
                style: TextStyle(
                    color: Color(0xFF006064),
                    fontSize: 20,
                    fontFamily: 'BebasNeue')),
            onPressed: () {
              Provider.of<GoogleSignInController>(context, listen: false)
                  .logOut();
            },
          )
        ]);
  }
}
