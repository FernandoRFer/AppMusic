import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Delegate/SearchDelegate.dart';
import 'package:flutter_application_1/services/music_service.dart';

import '../models/music_model.dart';

class Pesquisa extends StatefulWidget {
  const Pesquisa({
    Key? key,
  }) : super(key: key);

  @override
  State<Pesquisa> createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  List<MusicModel> musica = [];
  var busca = '';

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Digite o nome da musica!'),
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

  Future<bool> _postCifra(MusicModel musicaselect) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('musica', jsonEncode(musicaselect));

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> _getMusicas() {
    final service = MusicService();

    var map = <String, dynamic>{};
    map["filtroNome"] = busca;

    return service.getData(map).then((value) {
      if (mounted) {
        setState(() {
          for (var i = 0; i < value.length; i++) {
            musica.add(MusicModel.fromJson(value[i]));
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState?.show());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text('Busca:   $busca'),
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
        child: ListView.builder(
          itemCount: musica.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                var musicaselect = musica[index];
                var teste = await _postCifra(musicaselect);
                if (teste) {
                  Navigator.of(context).pushNamed('/cifra');
                } else {
                  _showMyDialog();
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  color: Colors.white10,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  musica[index].nomeMusica,
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 20),
                                ),
                                Text(' - ',
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 20)),
                                Text(musica[index].artista,
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 20)),
                              ]),
                        ),
                      ]),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result =
              await showSearch(context: context, delegate: SearchMusic());
          setState(() {
            musica.clear();
            busca = result.toString();
            if (busca == "") {
              busca;
              _showMyDialog();
            } else {
              _getMusicas();
            }
          });
        },
        backgroundColor: Colors.white30,
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
