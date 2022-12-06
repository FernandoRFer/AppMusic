import 'dart:convert';
import 'package:flutter_application_1/models/videos._model.dart';
import 'package:http/http.dart' as http;

var URL_BASE = ('www.googleapis.com/youtube/v3');
const Key = "AIzaSyAUBY9vyfYldF8REe_AnQ6z4fNyUM82HIs";

class ApiYouT {
  Future<List<Videos>> pesquisaYouT(String pesquisa) async {
    http.Response response =
        await http.get(Uri.https('www.googleapis.com', '/youtube/v3/search', {
      'part': 'snippet',
      'maxResults': '10',
      'order': 'date',
      'key': Key,
      'q': pesquisa,
    }));

    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);

      List<Videos> videos = mapResponse["items"].map<Videos>((map) {
        return Videos.fromJson(map);
        //return Video.converterJson(map);
      }).toList();

      return videos;
    } else {
      throw Exception('Failed to load login from the Internet');
    }
  }
}
