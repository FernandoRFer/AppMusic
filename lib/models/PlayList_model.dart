// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PlayListModel {
  int? id;
  String? nomePlayList;
  int? idUsuario;

  PlayListModel({
    this.id,
    this.nomePlayList,
    this.idUsuario,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = id;
    data['NomePlayList'] = nomePlayList;
    data['IdUsuario'] = idUsuario;

    return data;
  }

  factory PlayListModel.fromJson(Map<String, dynamic> json) {
    return PlayListModel(
        id: json["Id"],
        nomePlayList: json['NomePlayList'],
        idUsuario: json['IdUsuario']);
  }

  factory PlayListModel.fromMap(Map<String, dynamic> map) {
    return PlayListModel(
      id: map['Id'],
      nomePlayList: map['NomePlayList'],
      idUsuario: map['IdUsuario'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'NomePlayList': nomePlayList,
      'IdUsuario': idUsuario,
    };
  }
}
