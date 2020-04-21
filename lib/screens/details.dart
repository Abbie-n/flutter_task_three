import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../components/scheme.dart';
import 'extraDetails.dart';

class UsersApp extends StatefulWidget {
  @override
  _UsersAppState createState() => _UsersAppState();
}

class _UsersAppState extends State<UsersApp> {
  Future<List<Scheme>> fetchUsers() async {
    var apiUrl = 'https://jsonplaceholder.typicode.com/users';
    var result = await http.get(apiUrl);

    var users = List<Scheme>();

    if (result.statusCode == 200) {
      var usersJson = json.decode(result.body);
      for (var user in usersJson) {
        users.add(Scheme.json(user));
      }
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Users'),
            backgroundColor: Colors.deepPurple,
          ),
          body: Container(
            child: FutureBuilder<List<dynamic>>(
              future: fetchUsers(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExtraDetailsScreen(
                                          snapshot.data[index])));
                            },
                            child: Card(
                                elevation: 4,
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(20.0, 30.0, 0, 30.0),
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        leading: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                                'https://ui-avatars.com/api/?name=' +
                                                    snapshot.data[index].name)),
                                        title: Text('Full Name: ' +
                                            snapshot.data[index].name),
                                        subtitle: Text('Email: ' +
                                            snapshot.data[index].email),
                                      )
                                    ],
                                  ),
                                )));
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }
}
