import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class Matches {
  List<dynamic> res = [];

  Future<List<dynamic>> getMatches() async {
    const String apiKey =
        "13168c1e06f16aa2e1569db27e4cb1572d3ab56042b2be6925af97e1266aac1b";
    const String action = "get_events";

    final uri = Uri.parse(
        "https://apiv2.apifootball.com/?action=$action&match_live=1&APIkey=$apiKey");

    Response response = await http.get(uri);
    List<dynamic> parsedResp = jsonDecode(response.body);
    return parsedResp;
  }

  String baseUrl = "http://localhost/";
  Future<List<dynamic>> fetchUsers() async {
    final uri = Uri.parse("${baseUrl}flutter_app/get_user.php");
    final resp = await http.get(uri);
    if (resp.statusCode == 200) {
      return jsonDecode(resp.body);
    } else {
      return [];
    }
  }
}
