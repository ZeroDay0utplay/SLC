import 'package:http/http.dart' as http;
import 'dart:convert';


Future<int> register(String? email, String? password, String? fname, String? lname) async {
  var url = Uri.parse('http://192.168.1.3:3000/register');
  var headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  var data = <String, String>{
    'email': '$email',
    'password': '$password',
    'fname': '$fname',
    'lname': '$lname'
  };
  var body = json.encode(data);

  var response = await http.post(url, headers: headers, body: body);
  return response.statusCode;
}
