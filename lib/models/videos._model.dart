import 'dart:convert';

class Videos {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Videos({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.imagem,
    required this.canal,
  });

  factory Videos.fromJson(Map<String, dynamic> json) {
    return Videos(
        id: json["id"]["videoId"],
        titulo: json["snippet"]["title"],
        descricao: json["snippet"]["description"],
        imagem: json["snippet"]["thumbnails"]["high"]["url"],
        canal: json["snippet"]["channelTitle"]);
  }
}
