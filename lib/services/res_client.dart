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

  //ws untuk logout
  logout(apiUrl, token) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl), headers: _setHeaders(token));
  }

  //ws untuk post orders
  orders(data, apiUrl, token) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: convert.jsonEncode(data), headers: _setHeaders(token));
  }

  getOrders(apiUrl, token) async {
    var fullUrl = _url + apiUrl;
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders(token));
  }

  emailVerification(apiUrl, data) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: convert.jsonEncode(data), headers: _setHeaders(token));
  }

  reset(apiUrl, data) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: convert.jsonEncode(data), headers: _setHeaders(token));
  }
}
