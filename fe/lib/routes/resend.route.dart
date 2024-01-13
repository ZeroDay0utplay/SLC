import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';




Future<int> resend(String? email) async {
  var url = Uri.parse('http://${dotenv.get('IP')}:${dotenv.get("PORT")}/resend');
  var headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  var data = <String, String>{
    'email': '$email',
  };
  var body = json.encode(data);

  var response = await http.post(url, headers: headers, body: body);

  return response.statusCode;
}