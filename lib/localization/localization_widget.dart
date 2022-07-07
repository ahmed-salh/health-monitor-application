import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'local_provider.dart';

class LocalizationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<LocalProvider>(context);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: IconButton(
                alignment: Alignment.bottomCenter,
                onPressed: () {
                  appLanguage.appLocal == Locale('ar')
                      ? appLanguage.changeLanguage(Locale("en"))
                      : appLanguage.changeLanguage(Locale("ar"));
                },
                icon: Icon(Icons.language),
                color: Colors.white),
          ),
          Text(
            appLanguage.appLocal == Locale('ar') ? 'ع' : 'en',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
