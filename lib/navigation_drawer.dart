import 'package:flutter/material.dart';
import 'package:grad_app/user_page.dart';
import 'package:grad_app/users.dart';
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
                /* onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserPage(
                            name: name,
                            urlImage: urlImage,
                          )))*/
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
              /* ActionChip(
                padding: EdgeInsets.all(10),
                //backgroundColor: Color(0xFFFF9E80),
                avatar: Icon(Icons.logout, color: Colors.white),
                label: Text("Log Out"),
                onPressed: () {
                  Provider.of<GoogleSignInController>(context, listen: false)
                      .logOut();
                },
              ),*/
              /*_createFooterItem(
                  icon: Icons.login_outlined,
                  text: 'Logout',
                  onTap: () => Provider.of<GoogleSignInController>(context,
                          listen: false)
                      .logOut())*/
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
      /*case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UserPage(
            urlImage: urlImage,
            name: name,
          ),
        ));
        break;*/
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MapScreen(),
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

  Widget _createFooterItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
