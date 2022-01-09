import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/Todo.dart';
import '../models/User.dart';
import 'app_bar.dart';
import 'navigation_drawer_screen.dart';

class UserDetailScreen extends StatefulWidget {
  final User user;
  const UserDetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  Future<List<Todo>> fetchTodos() async {
    var iiid = widget.user.id.toString();
    var response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/todos?userId=' +
            widget.user.id.toString()));

    if (response.statusCode == 200) {
      return List<Todo>.from(
          jsonDecode(response.body).map((x) => Todo.fromJson(x)));
    } else {
      throw Exception(
          'Failed to load' + widget.user.username.toString() + "'s todos");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: const NavigationDrawerScreen(),
      body: Container(
        child: FutureBuilder(
          future: fetchTodos(),
          builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  for (var item in snapshot.data!)
                    Card(
                      elevation: 1,
                      child: ListTile(
                        onTap: () {},
                        title: Text(item.title),
                        // subtitle: Text("${item.completed}"),
                        trailing:
                            Checkbox(value: item.completed, onChanged: null),
                      ),
                    ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
