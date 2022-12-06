import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/cadastro_servive.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _Cadastro();
}

class _Cadastro extends State<CadastroPage> {
  String senha = '';
  String login = '';
  String nome = ' ';

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Por favor, Preencha os campos corretamente!'),
          actions: <Widget>[
            TextButton(
              child: const Text('Voltar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _casatroconcluido() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
              'Cadastro concluído com sucesso. Faça login na sua conta!'),
          actions: <Widget>[
            TextButton(
              child: const Text('Logar'),
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> _cadastro() async {
    final service = CadastroModel();
    final datacadastro = DateTime.now();

    var map = <String, dynamic>{};

    map["nome"] = nome;
    map["login"] = login;
    map["senha"] = senha;

    var usuario = await service.postData(map);
    return usuario;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  colors: const [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 148, 64, 64),
                Color.fromARGB(255, 0, 0, 0),
              ])),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  height: 100,
                  width: 180,
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 80,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Cadastro',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                fontSize: 60,
                              )),
                        ]),
                  ),
                ),
                TextField(
                  onChanged: (text) {
                    nome = text;
                  },
                  obscureText: false,
                  style: TextStyle(color: Colors.white70),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white60, width: 2.0),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    labelText: 'Nome',
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
                    login = text;
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
                    senha = text;
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
                SizedBox(height: 15),
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
                        children: const [
                          Text(
                            " Cadastrar",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                          Icon(
                            Icons.how_to_reg,
                            color: Colors.white,
                            size: 30,
                          )
                        ]),
                    onPressed: () async {
                      bool ok = await _cadastro();

                      if (ok) {
                        _casatroconcluido();
                      } else {
                        _showMyDialog();
                      }
                      //Navigator.of(context).pushNamed('/home');
                    },
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
