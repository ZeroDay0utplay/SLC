import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';



Future<int> resetPWD(String email, String pwd) async {
  var url = Uri.parse('http://${dotenv.get('IP')}:${dotenv.get("PORT")}/resetPwd');
  var headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  var data = <String, String>{
    'email': email,
    'password': pwd
  };

  var body = jsonEncode(data);

  var response = await http.post(url, headers: headers, body: body);

  return response.statusCode;
}