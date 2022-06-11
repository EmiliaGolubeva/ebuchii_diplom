import 'dart:async';

import 'package:http/http.dart' as http;
 Future<http.Response> fetchDelivery() {
   Uri uri = Uri.parse('http://25.33.48.59:8083/deliveries/');
   return http.get(uri);
 }
