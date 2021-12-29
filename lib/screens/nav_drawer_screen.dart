import 'package:flutter/material.dart';

import 'films_screen.dart';
import 'news_screen.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("AppBar"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.local_airport)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            TextButton(
              onPressed: () {},
              child: const Text("Profile"),
              style: buttonStyle,
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/512px-Google-flutter-logo.svg.png"),
                        ),
                        const Text("Flutter Navigation"),
                      ],
                    ),
                  )),
              ListTile(
                leading: const Icon(Icons.one_k),
                title: const Text("News"),
                onTap: () {
                  Route route = MaterialPageRoute(
                      builder: (context) => const NewsScreen());
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: const Icon(Icons.two_k),
                title: const Text("Films"),
                onTap: () {
                  Route route = MaterialPageRoute(
                      builder: (context) => const FilmsScreen());
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: const Icon(Icons.three_k),
                title: const Text("Mults"),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text("Home"),
        ),
      ),
    );
  }
}
