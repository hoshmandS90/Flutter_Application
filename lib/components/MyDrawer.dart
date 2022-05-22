import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color: new Color.fromARGB(255, 24, 26, 45),
        ),
        accountName: Text('Hoshmand Kamal',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[300],
            )),
        accountEmail: Text("HoshmandG900@Gmail.com",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[500],
            )),
        currentAccountPicture: new CircleAvatar(
          backgroundImage: AssetImage("assets/img/4.jpg"),
          radius: 65.0,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: new Color.fromARGB(255, 44, 46, 86),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            title: Text("Home",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[500],
                )),
            leading: Icon(Icons.home, color: Colors.grey[500]),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: new Color.fromARGB(255, 44, 46, 86),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            title: Text("Contact",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[500],
                )),
            leading: Icon(Icons.contact_mail, color: Colors.grey[500]),
            onTap: () {
              Navigator.pushNamed(context, '/contact');
            },
          ),
        ),
      )
    ]));
  }
}
