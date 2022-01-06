import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(color: const Color(0xFFbbbbbb), width: 2));

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
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
                    onPressed: () {},
                    child: Text("Войти"),
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36))),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
