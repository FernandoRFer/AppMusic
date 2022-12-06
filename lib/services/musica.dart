import 'dart:convert';
import 'package:flutter_application_1/models/music_model.dart';
import 'package:http/http.dart' as http;

class MusicSer {
  Future<List<MusicModel>> getData(String filters) async {
    http.Response response = await http
        .get(Uri.http('10.0.2.2:27686', '/music', {'filtroNome': filters}));

    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);

      List<MusicModel> music = mapResponse.map<MusicModel>((map) {
        return MusicModel.fromJson(map);
        //return Video.converterJson(map);
      }).toList();

      return music;
    } else {
      throw Exception('Failed to load login from the Internet');
    }
  }
}
