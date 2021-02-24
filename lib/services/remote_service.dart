import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/models/mcq_response.dart';
import 'package:quiz_app/services/api.dart';

class RemoteServices {
  static http.Client client = http.Client();

  static Future<List<Mcq>> fetchMcqs() async {
    final response = await client.get(baseUrl);
    if (response.statusCode == 200) {
      //final jsonString = response.body;

      final body = json.decode(response.body);

      return McqResponse.fromJson(body as Map<String, dynamic>).results;
    } else {
      //show error message
      return null;
    }
  }
}
