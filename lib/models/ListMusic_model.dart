// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ListMusicModel {
  int? id;
  int? idPlayList;
  int? idMusica;
  int? idUsuario;

  ListMusicModel({this.id, this.idPlayList, this.idMusica, this.idUsuario});

  factory ListMusicModel.fromMap(Map<String, dynamic> map) {
    return ListMusicModel(
      id: map['Id'],
      idPlayList: map['idPlayList'],
      idMusica: map['idMusica'],
      idUsuario: map['idUsuario'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'idPlayList': idPlayList,
      'idMusica': idMusica,
      'IdUsuario': idUsuario,
    };
  }
}
