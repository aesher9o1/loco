import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 30),
        children: <Widget>[
          generateText("Find A Pool", context),
          generateText("Find Peers", context),
          generateText("Setting", context)
        ],
      ),
    );
  }

  Widget generateText(String textToGenerate, BuildContext context) {
    return ListTile(
      title: Text(textToGenerate,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
