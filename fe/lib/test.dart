import 'package:fe/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future<Map<String, dynamic>> test(String? topic) async {
  var url = Uri.parse('http://192.168.1.3:3000/test');
  var headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  String? auth_token = await getAuthToken();
  var data = <String, String>{
    'topic': '$topic',
    'auth_token': '$auth_token'
  };
  var body = json.encode(data);

  var response = await http.post(url, headers: headers, body: body);
  Map<String, dynamic> jsonBody = jsonDecode(response.body);

  return jsonBody;
}
