import 'package:http/http.dart' as http;
import 'dart:convert';



Future<int> resend(String? email) async {
  var url = Uri.parse('http://192.168.1.3:3000/resend');
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