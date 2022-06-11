// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';
//
// import 'constants.dart';
//
// Future<List<Client>> fetchClient() async {
//   Uri uri = Uri.parse('http://25.33.48.59:8083/clients/');
//   final response = await http.get(uri);
//
//   if (response.statusCode == 200) {
//     return jsonDecode(response.body).map<Client>((e) => Client.fromJson(e)).toList();
//   } else {
//     throw Exception('Failed to load client');
//   }
// }
//
// class Client {
//   final int id;
//   final String firstName;
//   final String lastName;
//   final String phone;
//   final String organisation;
//   final String address;
//
//   const Client({required this.id, required this.firstName, required this.lastName, required this.phone, required this.organisation, required this.address});
//
//   factory Client.fromJson(Map<String, dynamic> json) {
//     return Client(
//         id: json['id'],
//         firstName: json['firstName'],
//         lastName: json['lastName'],
//         phone: json['phone'],
//         organisation: json['organisation'],
//         address: json['address']);
//   }
// }
//
// class Clients extends StatefulWidget {
//   Clients({Key? key}) : super(key: key);
//
//   @override
//   _ClientsState createState() => _ClientsState();
// }
//
// class _ClientsState extends State<Clients> {
//   late Future<List<Client>> futureClient;
//
//   @override
//   void initState() {
//     super.initState();
//     // futureClient = fetchClient();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF161615),
//         centerTitle: true,
//         title: Text(
//           'Клиенты',
//           style: kMainHeading.copyWith(color: Colors.white, fontSize: 20.0),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Expanded(
//               child: FutureBuilder<List<Client>>(
//                 future: fetchClient(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return ListView(
//                       shrinkWrap: true,
//                       children: [
//                         ...snapshot.requireData.map<Widget>(
//                               (e) => Padding(
//                             padding: const EdgeInsets.only(right: 3.0, left: 3.0),
//                             child: Card(
//                               color: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 side: BorderSide(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   width: 0.5,
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 8.0,),
//                                 child: ListTile(
//                                   leading: const Image(
//                                     image: AssetImage('assets/images/client.png'),
//                                   ),
//                                   title: Text('${e.firstName} ${e.lastName}'),
//                                   subtitle: Text('Организация: ${e.organisation}\nАдрес: ${e.address} '),
//                                   trailing: IconButton(
//                                     icon: Icon(Icons.phone_in_talk),
//                                     onPressed: () async {
//                                       launch('tel://+7${e.phone}');
//                                     },
//                                   ),
//                                   isThreeLine: true,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }
//                   return Center(
//                     child: Container(
//                       height: 40,
//                       width: 40,
//                       margin: const EdgeInsets.all(20),
//                       child: const CircularProgressIndicator(
//                         strokeWidth: 3.0,
//                         valueColor : AlwaysStoppedAnimation(Colors.black87),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
