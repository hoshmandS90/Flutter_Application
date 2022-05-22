import 'dart:convert';

import 'package:flutter/material.dart';
import '../components/MyDrawer.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

const api = "http://192.168.1.11/api";

class _HomeState extends State<Home> {
  @override
  Future getData() async {
    var url = Uri.parse("$api");
    var response = await http.get(url);
    var responseBody = json.decode(response.body);
    return responseBody;
  }

  Future deleteUser(id) async {
    var url = Uri.parse("$api/deleteuser.php");
    var response = await http.post(url, body: {
      "id": id,
    });
  }

  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
          size: 24,
        ),
        title: Image.asset(
          'assets/img/quote.png',
          width: 50,
          height: 30,
          fit: BoxFit.cover,
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: Icon(
              Icons.search,
              color: Color(0xFF1C1C1C),
              size: 20,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Color(0xFFEAE9EE),
      body: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data.length > 0) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: InkWell(
                          child: snapshot.data[index]['images'] != null
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    '$api/uploads/' +
                                        snapshot.data[index]['images'],
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundImage: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                                )),
                        ),
                        title: Container(
                            child: Row(
                          children: [
                            Text(snapshot.data[index]['name']),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: IconButton(
                                    onPressed: () {
                                      
                                          Navigator.pushNamed(context, '/edituser', arguments: snapshot.data[index]);

                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: Colors.amber,
                                    ))),
                          ],
                        )),
                        subtitle: Text(snapshot.data[index]['email'],
                            style: TextStyle(
                              color: Colors.grey[500],
                            )),
                        trailing: IconButton(
                            icon: Icon(Icons.cancel_outlined),
                            onPressed: () {
                              deleteUser(snapshot.data[index]['id']);
                              scaffoldKey.currentState?.showSnackBar(SnackBar(
                                  content: Text("user deleted successfully")));
                              Navigator.pushReplacementNamed(context, "/");
                            }),
                      );
                    });
              } else {
                return Center(
                  child: Text("No data is available",
                      style: TextStyle(color: Colors.red[500])),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/adduser');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
