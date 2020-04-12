import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        print(response.body);

        return json.decode(response.body);
      } catch (e) {
        print(e);
      }
    } else {
      print(response.statusCode);
    }
  }

}