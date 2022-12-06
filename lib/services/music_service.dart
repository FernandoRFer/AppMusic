import 'dart:convert';
import 'package:http/http.dart' as http;

class MusicService {
  Future<List> getData(Map<String, dynamic>? filters) async {
    Map<String, String> headers = {"Content-type": "application/json"};

    final response = await http
        .get(Uri.http('10.0.2.2:27686', '/music', filters), headers: headers)
        .timeout(const Duration(seconds: 03));

    if (response.statusCode == 200) {
      List<dynamic> mapResponse = json.decode(response.body);

      return mapResponse;
    } else {
      throw Exception('Failed to load login from the Internet');
    }
  }
}
