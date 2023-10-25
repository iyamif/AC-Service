import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ResClient {
  final String _url = 'http://10.0.2.2:8000/api';

  // ignore: prefer_typing_uninitialized_variables
  var token;

  //untuk header di setiap function web services
  _setHeaders(token) => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

  //ws untuk login
  authData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: convert.jsonEncode(data),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        });
  }
}
