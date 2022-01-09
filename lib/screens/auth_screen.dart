import 'package:flutter/material.dart';

import '../constants.dart';
import 'users_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _phoneController = TextEditingController();
  final _passwordContoller = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(color: const Color(0xFFbbbbbb), width: 2));

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(8)),
              Image.asset(
                "assets/images/bird.png",
                height: 100,
              ),
              Padding(padding: EdgeInsets.all(8)),
              Text(
                "Введите логин в виде 10 цифр номера телефона",
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6)),
              ),
              Padding(padding: EdgeInsets.all(8)),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFeceff1),
                  labelText: "Телефон",
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              TextField(
                controller: _passwordContoller,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFeceff1),
                  labelText: "Пароль",
                  enabledBorder: borderStyle,
                  focusedBorder: borderStyle,
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Container(
                width: 150,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (_phoneController.text == allowedLogin &&
                        _passwordContoller.text == allowedPassword) {
                      var route = MaterialPageRoute(
                          builder: (context) => UsersScreen());
                      Navigator.push(context, route);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 5),
                        backgroundColor: Colors.red,
                        content: Text("Incorrect phone number or password"),
                      ));
                    }
                  },
                  child: Text("Войти"),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
