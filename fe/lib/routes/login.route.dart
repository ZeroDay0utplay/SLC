import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../middlewares/auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



Future<int> login(String? email, String? password) async {
  var url = Uri.parse('http://${dotenv.get('IP')}:${dotenv.get("PORT")}/login');
  var headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  var data = <String, String>{
    'email': '$email',
    'password': '$password',
  };
  var body = json.encode(data);

  var response = await http.post(url, headers: headers, body: body);
  Map<String, dynamic> jsonBody = jsonDecode(response.body);
  if (response.statusCode == 200){ // we could add test for existence of auth token
    saveAuthToken(jsonBody["auth_token"]);
  }
  return response.statusCode;
}
