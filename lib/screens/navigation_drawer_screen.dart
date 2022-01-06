import 'package:flutter/material.dart';

var navigationDrawer = Drawer(
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
        title: const Text("Каталог"),
        onTap: () {},
      ),
    ],
  ),
);
