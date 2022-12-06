import 'dart:convert';

import 'package:flutter_application_1/models/music_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbMusica {
  String nomeTabela = "musicasalva";
  static final DbMusica _dbMusica = DbMusica._();
  Database? _db;

  factory DbMusica() {
    return _dbMusica;
  }

  DbMusica._() {}

  get db async {
    _db ??= await inicializarDB();
    return _db;
  }

  _onCreate(Database db, int version) {
    String sql =
        "CREATE TABLE $nomeTabela (Id INTEGER, NomeMusica TEXT,Cifra VARCHAR,Artista VARCHAR ,Tom VARCHAR ,Ritimo VARCHAR )";
    db.execute(sql);
  }

  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");

    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);

    return db;
  }

  Future<int?> salvarMusica(MusicModel musicModel) async {
    Database bancoDados = await db;
    var reculpera = await recuperarMusicasId(musicModel);

    if (reculpera == null) {
      var musica = musicModel.toMap();
      int resultado = await bancoDados.insert(nomeTabela, musica);
      return resultado;
    } else {
      return null;
    }
  }

  recuperarMusicas() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY NomeMusica DESC ";
    List<Map> anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;
  }

  recuperarMusicasId(MusicModel musicModel) async {
    var bancoDados = await db;
    var id = musicModel.id;
    var tom = musicModel.tom;

    String sql = "SELECT * FROM $nomeTabela WHERE Id = $id AND Tom = '$tom' ";
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
