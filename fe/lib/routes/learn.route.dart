import '../middlewares/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';



Future<Map<String, dynamic>> learn(String? symbol, String? topic) async {
  var url = Uri.parse('http://${dotenv.get('IP')}:${dotenv.get("PORT")}/learn');
  var headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  String? auth_token = await getAuthToken();
  var data = <String, String>{
    'symbol': '$symbol',
    'topic': '$topic',
    'auth_token': '$auth_token'
  };
  var body = json.encode(data);

  var response = await http.post(url, headers: headers, body: body);
  Map<String, dynamic> jsonBody = jsonDecode(response.body);

  return jsonBody;
}
