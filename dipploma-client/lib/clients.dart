// import 'package:dudedelivery/models/client.dart';
// import 'package:dudedelivery/post/api_service.dart';
// import 'package:dudedelivery/search.dart';
// import 'package:flutter/material.dart';
//
// import 'constants.dart';
//
//
// class Clients extends StatefulWidget {
//   @override
//   _ClientsState createState() => _ClientsState();
// }
//
// class _ClientsState extends State<Clients> {
//   FetchClient _userList = FetchClient();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0xFF161615),
//           centerTitle: true,
//           title: Text(
//             'Клиенты',
//             style: kMainHeading.copyWith(color: Colors.white, fontSize: 20.0),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 showSearch(context: context, delegate: SearchUser());
//               },
//               icon: Icon(Icons.search_sharp),
//             )
//           ],
//         ),
//         body: Container(
//           padding: EdgeInsets.all(20),
//           child: FutureBuilder<List<Client>>(
//               future: _userList.getclientList(),
//               builder: (context, snapshot) {
//                 var data = snapshot.data;
//                 return ListView.builder(
//                     itemCount: data?.length,
//                     itemBuilder: (context, index) {
//                       if (!snapshot.hasData) {
//                         return Center(child: CircularProgressIndicator());
//                       }
//                       return Card(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ListTile(
//                             title: Row(
//                               children: [
//                                 Container(
//                                   width: 60,
//                                   height: 60,
//                                   decoration: BoxDecoration(
//                                     color: Colors.deepPurpleAccent,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       '${data?[index].id}',
//                                       style: TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 20),
//                                 Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         '${data?[index].firstName}',
//                                         style: TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                       SizedBox(height: 10),
//                                       Text(
//                                         '${data?[index].organisation}',
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ])
//                               ],
//                             ),
//                             // trailing: Text('More Info'),
//                           ),
//                         ),
//                       );
//                     });
//               }),
//         ),
//     );
//   }
// }