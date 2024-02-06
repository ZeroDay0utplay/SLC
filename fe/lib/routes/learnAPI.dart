import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../middlewares/auth.dart';

void sendByBT(String sym, String soundEncoded){
  return;
}

Future<void> learnBTN(String sym, String topic) async{
  var url = Uri.parse('http://${dotenv.get('IP')}:${dotenv.get("PORT")}/learn');
  var headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  var data = <String, String>{
    'auth_token': await getAuthToken() ?? '',
    'symbol': '$sym',
    'topic': '$topic',
  };
  var body = json.encode(data);

  var response = await http.post(url, headers: headers, body: body);
  Map<String, dynamic> jsonBody = jsonDecode(response.body);
  var soundEncoded = jsonBody["data"];
  if (response.statusCode == 200){
    sendByBT(sym, soundEncoded);
  }

}