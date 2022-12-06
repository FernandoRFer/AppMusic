import 'dart:convert';

import 'package:flutter_application_1/Page/playList.dart';
import 'package:flutter_application_1/models/ListMusic_model.dart';
import 'package:flutter_application_1/models/PlayList_model.dart';
import 'package:flutter_application_1/models/music_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbListMusic {
  String nomeTabela = "ListMusic";
  static final DbListMusic _dbMusica = DbListMusic._();
  Database? _db;

  factory DbListMusic() {
    return _dbMusica;
  }

  DbListMusic._() {}

  get db async {
    _db ??= await inicializarDB();
    return _db;
  }

  _onCreate(Database db, int version) {
    String sql =
        "CREATE TABLE $nomeTabela (Id INTEGER PRIMARY KEY NOT NULL, IdPlayList INTEGER,IdMusica INTEGER, IdUsuario INTEGER )";
    db.execute(sql);
  }

  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "listmusic.db");

    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);

    return db;
  }

  Future<int> salvar(ListMusicModel listMusic) async {
    Database bancoDados = await db;

    try {
      var list = listMusic.toMap();
      int resultado = await bancoDados.insert(nomeTabela, list);
      print('DbListMusic $resultado');
      return resultado;
    } catch (e) {
      throw Exception("Error on server");
    }
  }

  recuperar(int id) async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela where IdPlayList = $id ";
    List<Map> anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;
  }

  Future<int> atualizarMusica(MusicModel musicModel) async {
    var bancoDados = await db;
    return await bancoDados.update(nomeTabela, musicModel,
        where: "id = ?", whereArgs: [musicModel.id]);
  }

  Future<int> removerMusica(int id) async {
    var bancoDados = await db;
    return await bancoDados
        .delete(nomeTabela, where: "id = ?", whereArgs: [id]);
  }
}
