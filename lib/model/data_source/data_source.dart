import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class DataSource {
  Future<dynamic> get(http.Client client);
}

abstract class API {

  static Future<dynamic> get(http.Client client, String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }

  static Future<dynamic> post(http.Client client, String url) async {
    final response = await client.post(Uri.parse(url));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }

  static Future<dynamic> put(http.Client client, String url) async {
    final response = await client.put(Uri.parse(url));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data');
    }
  }


}