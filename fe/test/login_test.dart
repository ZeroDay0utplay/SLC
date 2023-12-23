import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  var url = Uri.parse('http://127.0.0.1:3000/login');
  var headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  var data = <String, String>{
    'email': 'karim@etc.com',
    'password': 'karim123',
  };
  var body = json.encode(data);

  var response = await http.post(url, headers: headers, body: body);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
