import 'package:flutter/material.dart';
import '../components/scheme.dart';

class ExtraDetailsScreen extends StatelessWidget {
  final Scheme user;

  ExtraDetailsScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(user.name),
          backgroundColor: Colors.deepPurple,
        ),
        body: Card(
            margin: EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 130.0),
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 30.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image(
                        image: NetworkImage(
                            'https://ui-avatars.com/api/?name=' + user.name)),
                    Text(
                      'Full name: ' + user.name,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text('Username: ' + user.username,
                        style: TextStyle(fontSize: 18.0)),
                    Text('Email: ' + user.email,
                        style: TextStyle(fontSize: 18.0)),
                    Text('Phone Number: ' + user.number,
                        style: TextStyle(fontSize: 18.0)),
                  ]),
            )));
  }
}
