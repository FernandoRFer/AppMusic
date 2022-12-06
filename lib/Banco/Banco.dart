import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CaminhoBancoa {
  caminho() async {
    final caminhoBanco = await getDatabasesPath();
    final locaBancoDados = join(caminhoBanco, "banco.db");

    openDatabase(
      locaBancoDados,
      version: 1,
      onCreate: (db, dbVersaoRecente) {
        String sql =
            "CREATE TABLE Playlist ( idList INTERGER PRIMARY KEY AUTOINCREMENTE, id INTEGER, nomeMusica VARCHAR, artista VARCHAR, tom VARCHAR, ritimo VARCHAR , cifra VARCHAR, ";

        db.execute(sql);
      },
    );
  }
}
