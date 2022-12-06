import 'dart:convert';
import 'package:flutter_application_1/models/PlayList_model.dart';
import 'package:flutter_application_1/models/music_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbPlayList {
  String nomeTabela = "playlist";
  static final DbPlayList _dbMusica = DbPlayList._();
  Database? _db;

  factory DbPlayList() {
    return _dbMusica;
  }

  DbPlayList._() {}

  get db async {
    _db ??= await inicializarDB();
    return _db;
  }

  _onCreate(Database db, int version) {
    String sql =
        "CREATE TABLE $nomeTabela (Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, NomePlayList VARCHAR, IdUsuario INTEGER )";
    db.execute(sql);
  }

  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "playlist.db");

    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);

    return db;
  }

  Future<int> salvar(PlayListModel playList) async {
    Database bancoDados = await db;

    try {
      var lista = playList.toMap();
      int resultado = await bancoDados.insert(nomeTabela, lista);
      return resultado;
    } catch (e) {
      throw Exception("Error on server");
    }
  }

  recuperar() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ";
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
