import 'dart:convert';

import 'package:flutter_application_1/Page/playList.dart';
import 'package:flutter_application_1/models/ListMusic_model.dart';
import 'package:flutter_application_1/models/PlayList_model.dart';
import 'package:flutter_application_1/models/music_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//Class Singleton

class Db {
  String dbMusic = "dbMusic";
  String dbListMusic = 'DbListMusic';
  String dbPlayList = 'DbPlayList';
  static final Db _dbMusica = Db._();
  Database? _db;

  factory Db() {
    return _dbMusica;
  }

  Db._() {}

  get db async {
    _db ??= await inicializarDB();
    return _db;
  }

  _onCreate(Database db, int version) {
    String sql =
        "CREATE TABLE $dbListMusic (Id INTEGER PRIMARY KEY NOT NULL, IdPlayList INTEGER, IdMusica INTEGER, IdUsuario INTEGER )";
    db.execute(sql);

    String sql1 =
        "CREATE TABLE $dbMusic (Id INTEGER, NomeMusica TEXT, Cifra VARCHAR, Artista VARCHAR ,Tom VARCHAR ,Ritimo VARCHAR )";
    db.execute(sql1);

    String sql2 =
        "CREATE TABLE $dbPlayList (Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, NomePlayList VARCHAR, IdUsuario INTEGER )";
    db.execute(sql2);
  }

  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "database.db");

    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);

    return db;
  }

  Future<int> salvarDbListMusic(ListMusicModel listMusic) async {
    Database bancoDados = await db;

    try {
      var list = listMusic.toMap();
      int resultado = await bancoDados.insert(dbListMusic, list);
      print('DbListMusic $resultado');
      return resultado;
    } catch (e) {
      throw Exception("Error on server");
    }
  }

  Future<int?> salvarDbMusic(MusicModel musicModel) async {
    Database bancoDados = await db;

    var reculpera = await recuperarDbMusicId(musicModel);

    if (reculpera == true) {
      var musica = musicModel.toMap();
      int resultado = await bancoDados.insert(dbMusic, musica);
      return resultado;
    } else {
      return null;
    }
  }

  Future<int> salvarDbPlayList(PlayListModel playList) async {
    Database bancoDados = await db;

    try {
      var lista = playList.toMap();
      int resultado = await bancoDados.insert(dbPlayList, lista);
      return resultado;
    } catch (e) {
      throw Exception("Error on server");
    }
  }

  recuperarDbPlayListId(var id) async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $dbPlayList Id = $id";
    List<Map> anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;
  }

  recuperarDbList(var id) async {
    var bancoDados = await db;
    String sql =
        "SELECT * FROM $dbListMusic lm INNER JOIN $dbMusic m ON lm.IdMusica = m.Id WHERE lm.IdPlayList = $id ";
    List<Map> anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;
  }

  recuperarDbList2() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $dbListMusic ";
    List<Map> anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;
  }

  recuperarDbMusicId(MusicModel musicModel) async {
    var bancoDados = await db;
    int id = musicModel.id;
    var tom = musicModel.tom;

    String sql = "SELECT * FROM $dbMusic WHERE Id = $id AND Tom = '$tom' ";
    List<Map> anotacoes = await bancoDados.rawQuery(sql);

    return anotacoes.isEmpty;
  }

  recuperarDbPlayList() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $dbPlayList ";
    List<Map> anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;
  }

  recuperarDbMusic() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $dbMusic ";
    List<Map> anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;
  }

  recuperar(int id) async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $dbListMusic where IdPlayList = $id ";
    List<Map> anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;
  }

  Future<int> atualizarMusica(MusicModel musicModel) async {
    var bancoDados = await db;
    return await bancoDados.update(dbListMusic, musicModel,
        where: "id = ?", whereArgs: [musicModel.id]);
  }

  Future<int> removerdbListMusic(int id) async {
    var bancoDados = await db;
    return await bancoDados
        .delete(dbListMusic, where: "id = ?", whereArgs: [id]);
  }
}
