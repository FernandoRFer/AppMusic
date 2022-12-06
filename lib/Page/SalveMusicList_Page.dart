import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/ListMusic_model.dart';
import 'package:flutter_application_1/models/PlayList_model.dart';
import 'package:flutter_application_1/models/login_model.dart';
import 'package:flutter_application_1/models/music_model.dart';
import 'package:flutter_application_1/services/Db.dart';
import 'package:flutter_application_1/services/DbLista.dart';
import 'package:flutter_application_1/services/DbPlayList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SalveList extends StatefulWidget {
  SalveList({Key? key}) : super(key: key);

  @override
  State<SalveList> createState() => _SalveListState();
}

class _SalveListState extends State<SalveList> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  var action;
  String nomeLista = '';
  var _db = Db();
  List<PlayListModel> _listamusicas = [];

  Future<void> _showMyDialogSalvo() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 82, 78, 78),
          title: const Text(
            'PlayList Salva! :D',
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

  Future<void> _showMyDialogErro() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 82, 78, 78),
          title: const Text(
            'Erro ao Salvar, Reinicie e tente novamente! :(',
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

  Future _SaveListMusicSelect(PlayListModel lista) async {
    final prefs = await SharedPreferences.getInstance();
    action = prefs.getString('musica');
    var musicModel = jsonDecode(action);
    var music = MusicModel.fromJson(musicModel);

    action = prefs.getString('usuario');
    var loginModel = await jsonDecode(action);
    var logi = LoginModel.fromJson(loginModel);

    ListMusicModel list = ListMusicModel(
        idMusica: music.id, idPlayList: lista.id, idUsuario: logi.id);

    try {
      int? resultmusic = await _db.salvarDbMusic(music);
      int result = await _db.salvarDbListMusic(list);

      print("resultmusic $resultmusic");
      return result;
    } catch (e) {
      _showMyDialogErro();
    }
  }

  Future<void> _addPlaylist() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 82, 78, 78),
          title: const Text(
            'Digite o Nome da Lista!',
            style: TextStyle(color: Colors.white70),
          ),
          actions: <Widget>[
            TextField(
              onChanged: (text) {
                nomeLista = text;
              },
              style: TextStyle(color: Colors.white70, fontSize: 25),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.white60, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelStyle: TextStyle(color: Colors.white70),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white70, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: const Icon(
                    Icons.save_alt,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    _salveLista();
                    setState(() {
                      _recuperarListas();
                      Navigator.of(context).pop();
                    });
                  },
                ),
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
            ),
          ],
        );
      },
    );
  }

  Future _salveLista() async {
    var _db = Db();
    // PlayListModel lista = PlayListModel();
    final prefs = await SharedPreferences.getInstance();
    action = prefs.getString('usuario');
    var loginModel = await jsonDecode(action);
    var logi = LoginModel.fromJson(loginModel);

    //  lista.idUsuario = logi.id;
    // lista.nomePlayList = nomeLista;

    PlayListModel lista =
        PlayListModel(nomePlayList: nomeLista, idUsuario: logi.id);

    try {
      int result = await _db.salvarDbPlayList(lista);
      return result;
    } catch (e) {
      _showMyDialogErro();
    }
  }

  _recuperarListas() async {
    var anotacoesRecuperadas = await _db.recuperarDbPlayList();

    List<PlayListModel> listaTemporaria = [];
    for (var item in anotacoesRecuperadas) {
      PlayListModel lista = PlayListModel.fromMap(item);
      listaTemporaria.add(lista);
    }

    setState(() {
      _listamusicas = listaTemporaria;
    });

    //print("Lista anotacoes: " + anotacoesRecuperadas.toString() );
  }

  @override
  void initState() {
    _recuperarListas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        title: Text('PlayList'),
      ),
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
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () {
            return _recuperarListas();
          },
          child: ListView.builder(
              itemCount: _listamusicas.length,
              itemBuilder: (contex, index) {
                final lista = _listamusicas[index];

                return GestureDetector(
                  onTap: () async {
                    var listselect = _listamusicas[index];
                    _SaveListMusicSelect(listselect);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text("${lista.nomePlayList}"),
                    ),
                  ),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _addPlaylist();
        },
        backgroundColor: Colors.white30,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
