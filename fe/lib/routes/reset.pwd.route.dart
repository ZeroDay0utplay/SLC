import 'dart:convert';
import 'package:http/http.dart' as http;


Future<int> resetPWD(String email, String pwd) async {
  var url = Uri.parse('http://192.168.1.3:3000/resetPwd');
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