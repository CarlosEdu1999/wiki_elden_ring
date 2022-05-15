import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class data {

  Future main() async {
    final list = await fetch();

    print(list.elementAt(0)['imageURL']);
  }

 static Future<List<Map>> fetch() async {
    var url = 'https://eldenringwiki.herokuapp.com/v1/items';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    List<Map>userData = List<Map>.from(json);
    return userData;
  }
}