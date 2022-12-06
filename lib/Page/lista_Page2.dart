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

class ListMusic1 extends StatefulWidget {
  ListMusic1({Key? key}) : super(key: key);

  @override
  State<ListMusic1> createState() => _ListMusic();
}

class _ListMusic extends State<ListMusic1> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  var action;
  int? select;
  String? nomeLista = '';
  var _db = Db();
  List<MusicModel> _listamusicas = [];

  Future acessoNomeLista() async {
    final prefs = await SharedPreferences.getInstance();

    action = prefs.getString('usuario');
    var loginModel = jsonDecode(action);
    var logi = LoginModel.fromJson(loginModel);
    var idList = logi.id;

    try {
      var result = await _db.recuperarDbPlayListId(idList);
      PlayListModel lista = jsonDecode(result);
      setState(() {
        nomeLista = lista.nomePlayList;
      });
    } catch (e) {
      _showMyDialogErro();
    }

    ;
  }

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

  Future _SaveListMusicSelect(MusicModel lista) async {
    var _db = DbListMusic();
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
      int result = await _db.salvar(list);
      return result;
    } catch (e) {
      _showMyDialogErro();
    }
  }

  Future _salveLista() async {
    var _db = DbPlayList();
    // PlayListModel lista = PlayListModel();
    final prefs = await SharedPreferences.getInstance();
    action = prefs.getString('usuario');
    var loginModel = await jsonDecode(action);
    var logi = LoginModel.fromJson(loginModel);

    action = prefs.getString('musica');
    var musicModel = jsonDecode(action);
    var music = MusicModel.fromJson(musicModel);

    //  lista.idUsuario = logi.id;
    // lista.nomePlayList = nomeLista;

    PlayListModel lista =
        PlayListModel(nomePlayList: nomeLista, idUsuario: logi.id);

    try {
      int result = await _db.salvar(lista);
      return result;
    } catch (e) {
      _showMyDialogErro();
    }
  }

  _recuperarListaDeMusicas() async {
    final prefs = await SharedPreferences.getInstance();
    action = prefs.getString('select');
    var playListnModel = await jsonDecode(action);
    var list = PlayListModel.fromMap(playListnModel);

    var anotacoesRecuperadas = await _db.recuperarDbList(list.id);

    List<MusicModel> listaTemporaria = [];
    for (var item in anotacoesRecuperadas) {
      MusicModel lista = MusicModel.fromMap(item);
      listaTemporaria.add(lista);
    }

    setState(() {
      _listamusicas = listaTemporaria;
    });

    //print("Lista anotacoes: " + anotacoesRecuperadas.toString() );
  }

  _recuperarLista() async {
    var anotacoesRecuperadas = await _db.recuperarDbPlayList();
    print('_recuperarLista $anotacoesRecuperadas');
  }

  _recuperarMusica() async {
    var anotacoesRecuperadas = await _db.recuperarDbMusic();
    print('_recuperarMusica $anotacoesRecuperadas');
  }

  _recuperarPlaylist() async {
    var anotacoesRecuperadas = await _db.recuperarDbList2();
    print('_recuperarPlaylist $anotacoesRecuperadas');
    //print("Lista anotacoes: " + anotacoesRecuperadas.toString() );
  }

  @override
  void initState() {
    _recuperarMusica();
    _recuperarListaDeMusicas();
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
        /*child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () {
            return _recuperarListaDeMusicas();
          },*/
        child: ReorderableListView.builder(
            itemCount: _listamusicas.length,
            onReorder: (index, newIndex) {},
            itemBuilder: (contex, index) {
              var lista = _listamusicas[index];
              select = lista.id;

              _recuperarListaDeMusicas();

              return ListView(
                children: [
                  Card(
                    child: ListTile(
                      title: Text("${lista.nomeMusica}  ${lista.tom}"),
                    ),
                  ),
                ],
              );
            }),
      ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        backgroundColor: Colors.white30,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );

    Widget buildUser(int index, MusicModel musica) => ListTile(
          key: ValueKey(musica),
          title: Text(musica.nomeMusica),
        );
  }
}
