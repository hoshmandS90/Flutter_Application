import 'package:flutter/material.dart';
import '../components/MyDrawer.dart';


class Contact extends StatefulWidget {
  const Contact({ Key? key }) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Flutter'),
        backgroundColor: new Color.fromARGB(255, 44, 45, 86),
      ),
      drawer: MyDrawer(),
      body: Center(
          child:Text("this is contact page")

      ),


    );
  }
}