import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/TrocaDeTom.dart';
import 'package:flutter_application_1/models/PlayList_model.dart';
import 'package:flutter_application_1/models/music_model.dart';
import 'package:flutter_application_1/services/Db.dart';
import 'package:flutter_application_1/services/DbMusica.dart';
import 'package:flutter_application_1/services/DbPlayList.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class Cifra extends StatefulWidget {
  const Cifra({super.key});

  @override
  State<Cifra> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Cifra> {
  int id = 0;
  String nomeMusica = '';
  String artista = '';
  String cifra = '';
  String tom = '';
  String ritimo = '';
  var action;
  var _paginaAtual = 0;
  var music;

  String novoOriginal = '';

  var _db = Db();
  List<PlayListModel> _listamusicas = [];

  Future<void> _SelectList() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 82, 78, 78),
          title: const Text(
            'Musica Salva! :D',
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

  Future _acessoMusica() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      action = prefs.getString('musica');
      var musicModel = jsonDecode(action);
      music = MusicModel.fromJson(musicModel);

      nomeMusica = music.nomeMusica;
      artista = music.artista;
      cifra = music.cifra;
      tom = music.tom;
      ritimo = music.ritimo;
      id = music.id;
    });
  }

  Future<void> _trocaTom() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 82, 78, 78),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Selecine o Tom',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              if (tom == 'Am' || tom == 'C')
                Text(
                  'C - Am',
                  style: TextStyle(color: Colors.red, fontSize: 40),
                ),
              if (tom != 'C' && tom != 'Am')
                TextButton(
                  child: Text(
                    'C - Am',
                    style: TextStyle(color: Colors.white70, fontSize: 40),
                  ),
                  onPressed: () {
                    var novotom = TrocaDeTom();
                    var novacifra = novotom.mudardetom(cifra, tom);
                    var cifraSol = novotom.mudarParaDo(novacifra);
                    var novot = novotom.mudardetom(tom, tom);
                    var tomNovo = novotom.mudarParaDo(novot);
                    tom = tomNovo;

                    setState(() {
                      cifra = cifraSol;
                      tom = tomNovo;
                      Navigator.of(context).pop();
                    });
                  },
                ),
              if (tom == 'Db' || tom == 'Bbm')
                Text(
                  'Db - Bbm',
                  style: TextStyle(color: Colors.red, fontSize: 40),
                ),
              if (tom != 'Db' && tom != 'Bbm')
                TextButton(
                  child: Text(
                    'Db - Bbm',
                    style: TextStyle(color: Colors.white70, fontSize: 40),
                  ),
                  onPressed: () {
                    var novotom = TrocaDeTom();
                    var novacifra = novotom.mudardetom(cifra, tom);
                    var cifraSol = novotom.mudarParaReBemol(novacifra);
                    var novot = novotom.mudardetom(tom, tom);
                    var tomNovo = novotom.mudarParaReBemol(novot);
                    tom = tomNovo;

                    setState(() {
                      cifra = cifraSol;
                      tom = tomNovo;
                      Navigator.of(context).pop();
                    });
                  },
                ),
              if (tom != 'Bm' && tom != 'D')
                TextButton(
                  onPressed: () {
                    var novotom = TrocaDeTom();
                    var novacifra = novotom.mudardetom(cifra, tom);
                    var cifraSol = novotom.mudarParaRe(novacifra);
                    var novot = novotom.mudardetom(tom, tom);
                    var tomNovo = novotom.mudarParaRe(novot);
                    tom = tomNovo;

                    setState(() {
                      cifra = cifraSol;
                      tom = tomNovo;
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text(
                    'D - Bm',
                    style: TextStyle(color: Colors.white70, fontSize: 40),
                  ),
                ),
              if (tom == 'Bm' || tom == 'D')
                Text(
                  'D - Bm',
                  style: TextStyle(color: Colors.red, fontSize: 40),
                ),
              if (tom != 'Em' && tom != 'G')
                TextButton(
                  child: Text(
                    'G - Em',
                    style: TextStyle(color: Colors.white70, fontSize: 40),
                  ),
                  onPressed: () {
                    var novotom = TrocaDeTom();
                    var novacifra = novotom.mudardetom(cifra, tom);
                    var cifraSol = novotom.mudarParaSol(novacifra);
                    var novot = novotom.mudardetom(tom, tom);
                    var tomNovo = novotom.mudarParaSol(novot);

                    setState(() {
                      cifra = cifraSol;
                      tom = tomNovo;
                      Navigator.of(context).pop();
                    });
                  },
                ),
              if (tom == 'Em' || tom == 'G')
                Text(
                  'G - Em',
                  style: TextStyle(color: Colors.red, fontSize: 40),
                ),
            ],
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

  Future _salveMusica() async {
    final prefs = await SharedPreferences.getInstance();

    var _db = DbMusica();
    //Database bd = await reculperarbanco.recuperarBancoDados();

    //action = prefs.getString('musica');
    //var musicModel = jsonDecode(action);
    //var music = MusicModel.fromJson(musicModel);

    int? resultado = await _db.salvarMusica(music);
    _SelectList();

    print('salva2222 $resultado');
  }

  @override
  void initState() {
    super.initState();
    _acessoMusica();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        automaticallyImplyLeading: true,
        title: Text(nomeMusica + ' - ' + artista),
      ),
      body: Container(
        /*  decoration: BoxDecoration(
           gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: const [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 51, 23, 23),
              Color.fromARGB(255, 0, 0, 0),
            ])),
            */
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () async {
                    _trocaTom();
                  },
                  child: Text('Tom: ' + tom,
                      style: TextStyle(color: Colors.white70, fontSize: 30)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.transparent,
                  child: Text(cifra,
                      style: TextStyle(color: Colors.white70, fontSize: 30)),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context).pushNamed('/SalveList');
        },
        backgroundColor: Colors.white30,
        child: const Icon(Icons.save_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
