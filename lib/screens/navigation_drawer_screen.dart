import 'package:flutter/material.dart';
import 'package:ugntu_final/screens/user_detail_screen.dart';

import 'auth_screen.dart';
import 'users_screen.dart';

class NavigationDrawerScreen extends StatelessWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Container(
              height: 200,
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
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.one_k),
            title: const Text("Authenticate"),
            onTap: () {
              var route = MaterialPageRoute(builder: (context) => AuthScreen());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            leading: const Icon(Icons.two_k),
            title: const Text("Users list"),
            onTap: () {
              var route =
                  MaterialPageRoute(builder: (context) => UsersScreen());
              Navigator.push(context, route);
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.three_k),
          //   title: const Text("User detail"),
          //   onTap: () {
          //     var route =
          //         MaterialPageRoute(builder: (context) => UserDetailScreen());
          //     Navigator.push(context, route);
          //   },
          // ),
        ],
      ),
    );
  }
}
