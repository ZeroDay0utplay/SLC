import 'package:http/http.dart' as http;
import 'dart:convert';


Future<String> register(String? email, String? password, String? name, String? age) async {
  var url = Uri.parse('http://192.168.1.3:3000/register');
  var headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  var data = <String, String>{
    'email': '$email',
    'password': '$password',
    'name': '$name',
    'age': '$age'
  };
  var body = json.encode(data);

  var response = await http.post(url, headers: headers, body: body);
  //Map<String, dynamic> jsonBody = jsonDecode(response.body);
  if (response.statusCode == 200){ // we could add test for existence of auth token
    return "/login";
  }
  return "/register";
}
