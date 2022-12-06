import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MusicModel {
  int id;
  String nomeMusica;
  String artista;
  String cifra;
  String tom;
  String ritimo;

  MusicModel({
    required this.id,
    required this.nomeMusica,
    required this.artista,
    required this.cifra,
    required this.tom,
    required this.ritimo,
  });

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
        id: json["Id"],
        nomeMusica: json["NomeMusica"],
        cifra: json["Cifra"],
        artista: json["Artista"],
        tom: json["Tom"],
        ritimo: json["Ritimo"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = id;
    data['NomeMusica'] = nomeMusica;
    data['Artista'] = artista;
    data['Cifra'] = cifra;
    data['Tom'] = tom;
    data['Ritimo'] = ritimo;

    return data;
  }

  factory MusicModel.fromMap(Map<String, dynamic> map) {
    return MusicModel(
        id: map['Id'],
        nomeMusica: map['NomeMusica'],
        artista: map['Artista'],
        cifra: map['Cifra'],
        tom: map['Tom'],
        ritimo: map["Ritimo"]);
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'NomeMusica': nomeMusica,
      'Artista': artista,
      "Cifra": cifra,
      'Tom': tom,
      'Ritimo': ritimo,
    };
  }
/*
  @override
  String toString() {
    return 'musicaModel{Id: $id, NomeMusica: $nomeMusica, Artista: $artista,Cifra: $cifra, Tom: $tom, Ritimo: $ritimo }';
  }
  */
}
