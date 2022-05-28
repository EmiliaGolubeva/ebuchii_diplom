import 'dart:convert';
import 'dart:developer';

import '../models/delivery.dart';
import 'package:http/http.dart' as http;

Future<Map<int, Delivery>> fetchDelivery() async {
  Uri uri = Uri.parse('http://25.33.48.59:8083/deliveries/');
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    Map<int, Delivery> resultMap = {};
    var entries = jsonDecode(response.body).map<Delivery>((e) => Delivery.fromJson(e)).toList().forEach((Delivery e) => resultMap[e.id] = e);
    return resultMap;
  } else {
    log('${response.body}', name: 'fetchDelivery');
    log('${response.statusCode}', name: 'fetchDelivery');
    throw Exception('Fail');
  }
}
