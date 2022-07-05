import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'google_login_controller.dart';
import 'livetrack.dart';
import 'login_page.dart';
import 'map_main.dart';
import 'monitor.dart';
import 'caretaker_home.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final name = 'Yasmin';
    final email = 'yasmeenabeel9@gmail.com';
    final urlImage =
        'https://lh3.googleusercontent.com/a-/AOh14Gh2IKK3ddU8x0huFJTu-m0y3zXTZ-Qo3Y6lhPMLw7E=s360-p-rw-no';

    return Drawer(
        child: Material(
            color: const Color(0xFF006064),
            child: Column(children: <Widget>[
              buildHeader(
                urlImage: urlImage,
                name: name,
                email: email,
                onClicked: () {},
              ),
              const SizedBox(height: 48),
              buildMenuItem(
                text: 'Home',
                icon: Icons.home,
                onClicked: () => selectedItem(context, 0),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Users',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 1),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Live Tracker',
                icon: Icons.update,
                onClicked: () => selectedItem(context, 2),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Monitor',
                icon: Icons.favorite_border,
                onClicked: () => selectedItem(context, 3),
              ),
              const SizedBox(height: 24),
              const Divider(color: Colors.white70),
              const SizedBox(height: 24),
              buildMenuItem(
                text: 'Contact Us',
                icon: Icons.call,
                onClicked: () {},
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'FAQ',
                icon: Icons.question_answer,
                onClicked: () {},
              ),
              const SizedBox(height: 16),
            ])));
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    required VoidCallback? onClicked,
  }) {
    final color = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
        break;

      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
        break;

      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyLocationPage(),
        ));
        break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyMonitor(),
        ));
        break;

      case 6:
        final provider =
            Provider.of<GoogleSignInController>(context, listen: false);
        provider.logOut();
        break;
    }
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
          child: Container(
              padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
              child: Row(children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(urlImage),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    const SizedBox(height: 5),
                    Text(email,
                        style: TextStyle(fontSize: 14, color: Colors.white)),
                  ],
                )
              ])));
}
