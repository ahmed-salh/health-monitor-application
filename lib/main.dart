import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:grad_app/caretaker_home.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';
import 'google_login_controller.dart';
//import 'caretaker_home.dart';
import 'login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),*/
    //child:

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GoogleSignInController(),
            child: LoginPage(),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(
            // primarySwatch: Colors.blueGrey,
            appBarTheme: const AppBarTheme(
              color: Color(0xFF006064),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color(0xFF006064),
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          title: 'Health Monitor System',
          /*theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),*/
          home: LoginPage(
            //title: 'Health Monitor',
          ),
        ));
  }
}
