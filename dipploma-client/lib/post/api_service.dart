import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/client.dart';

class FetchClient {
  var data = [];
  List<Client> results = [];
  String urlList = 'http://25.33.48.59:8083/clients/';

  Future<List<Client>> getclientList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {

        data = json.decode(response.body);
        results = data.map((e) => Client.fromJson(e)).toList();
        if (query!= null){
          results = results.where((element) => element.firstName!.toLowerCase().contains((query.toLowerCase()))).toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}