import 'dart:convert';
import 'dart:developer';

import '../models/delivery.dart';
import 'package:http/http.dart' as http;

Future<List<Delivery>> fetchDelivery() async {
  Uri uri = Uri.parse('http://25.33.48.59:8083/delivery/');
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    return jsonDecode(response.body).map<Delivery>((e) => Delivery.fromJson(e)).toList();
  } else {
    throw Exception('Fail');
  }
}
