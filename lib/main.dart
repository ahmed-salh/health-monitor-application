import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'google_login_controller.dart';
import 'login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GoogleSignInController(),
            child: LoginPage(),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: Color(0xFF006064),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color(0xFF006064),
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          title: 'Health Tracker System',
          home: LoginPage(
              //title: 'Health Monitor',
              ),
        ));
  }
}
