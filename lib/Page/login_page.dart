import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/login_model.dart';
import 'package:flutter_application_1/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<LoginModel> login = [];

  String login1 = '';
  String senha1 = '';

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 82, 78, 78),
          title: const Text(
            'Login ou Senha Incorreto',
            style: TextStyle(color: Colors.white70),
          ),
          actions: <Widget>[
            TextButton(
              child: const Icon(
                Icons.clear_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> _postLogdin() async {
    final service = LoginService();

    var map = <String, dynamic>{};
    map["login"] = login1;
    map["senha"] = senha1;

    try {
      var usuario = await service.postData(map);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('usuario', jsonEncode(usuario));

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: const [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 51, 23, 23),
                Color.fromARGB(255, 0, 0, 0),
              ])),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(height: 60),
                Container(
                  height: 100,
                  width: 180,
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 80,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('IICipher',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Color.fromARGB(207, 255, 255, 255),
                                fontSize: 60,
                              )),
                          Image.asset(
                            "assets/playlist.png",
                            color: Color.fromARGB(207, 255, 255, 255),
                          ),
                        ]),
                  ),
                ),
                SizedBox(height: 30),
                /*SizedBox(
                  child: Text('Digite seu Login e Senha',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Color.fromARGB(221, 255, 255, 255))),
                ),
                SizedBox(height: 15),
                TextFormField(
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    labelText: "Login",
                    labelStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    )),
              ),*/
                TextField(
                  onChanged: (text) {
                    login1 = text;
                  },
                  obscureText: false,
                  style: TextStyle(color: Colors.white70),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white60, width: 2.0),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    labelText: 'Login',
                    labelStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white70, width: 2.0),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  onChanged: (text) {
                    senha1 = text;
                  },
                  style: TextStyle(color: Colors.white70),
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white60, width: 2.0),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white70, width: 2.0),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      "Recuperar Senha",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color.fromARGB(255, 159, 159, 159),
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.3, 1],
                      colors: const [
                        Color.fromARGB(255, 52, 61, 64),
                        Color.fromARGB(255, 0, 0, 0),
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: SizedBox.expand(
                      child: TextButton(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Entar",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                                fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                          Image.asset("assets/sol.png")
                        ]),
                    onPressed: () async {
                      bool login = await _postLogdin();

                      if (login) {
                        Navigator.of(context).pushNamed('/start');
                      } else {
                        _showMyDialog();
                      }
                      //Navigator.of(context).pushNamed('/home');
                    },
                  )),
                ),
                SizedBox(height: 15),
                /*
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Color(0xFF3C5A99),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                   child: SizedBox.expand(
                      child: TextButton(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Entar com Facebook ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                                fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                          Image.asset("assets/facebook.png")
                        ]),
                    onPressed: () {},
                  )),
                ),*/
                SizedBox(height: 5),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: TextButton(
                    child: Text(
                      "Fazer Cadastro",
                      style: TextStyle(
                        color: Color.fromARGB(255, 159, 159, 159),
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/cadastro');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
