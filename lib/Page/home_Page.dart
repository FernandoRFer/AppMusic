import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_application_1/models/login_model.dart';
import 'package:flutter_application_1/models/videos._model.dart';
import 'package:flutter_application_1/services/ApiYT.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  var action;
  String nomeLogin = '';
  var pesquisa = '';

  @override
  void initState() {
    super.initState();
    acessoUruario();
  }

  _listarVideos() {
    ApiYouT api = ApiYouT();
    return api.pesquisaYouT(pesquisa);
  }

  Future acessoUruario() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      action = prefs.getString('usuario');
      var loginModel = jsonDecode(action);
      var logi = LoginModel.fromJson(loginModel);
      nomeLogin = logi.login!;
    });
  }

  //final pageViewControler = PageController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: (Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 51, 23, 23),
              Color.fromARGB(255, 0, 0, 0),
            ])),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Olá ' + nomeLogin + ' !',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.settings,
                                color: Colors.white70,
                                size: 40,
                              ),
                              Text(
                                "Settings",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                    fontSize: 15),
                                textAlign: TextAlign.left,
                              ),
                            ]),
                        onPressed: () async {}),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white10,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: 400,
                  child: FutureBuilder<List<Videos>>(
                      future: _listarVideos(),
                      builder: (contex, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                            break;
                          case ConnectionState.active:
                          case ConnectionState.done:
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  itemBuilder: (context, index) {
                                    List<Videos>? videos = snapshot.data;
                                    Videos video = videos![index];
                                    return Column(
                                      children: <Widget>[
                                        Container(
                                          height: 180,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      video.imagem))),
                                        ),
                                        Container(
                                          color: Colors.black12,
                                          child: ListTile(
                                            textColor: Colors.white,
                                            title: Text(
                                              video.titulo,
                                            ),
                                            subtitle: Text(
                                              video.canal,
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                  /*separatorBuilder: (context, index) => Divider(
                                          height: 2,
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        ),*/
                                  itemCount: snapshot.data!.length);
                            } else {
                              return Center(
                                child: Text("Nenhum dado a ser exibido!"),
                              );
                            }
                            break;
                        }
                      }),
                ),
              ),
            ),
          ],
        ),
      )),
    );

    /*Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 51, 23, 23),
              Color.fromARGB(255, 0, 0, 0),
            ])),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // ignore: sort_child_properties_last
        child: Padding(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Olá ' + nomeLogin + ' !',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.settings,
                                color: Colors.white70,
                                size: 40,
                              ),
                              Text(
                                "Settings",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                    fontSize: 15),
                                textAlign: TextAlign.left,
                              ),
                            ]),
                        onPressed: () async {}),
                  ],
                ),
              ),
              Column(children: [
                ,
            ],
          ),
        ),
      ),
    );*/
  }
}
