// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'constants.dart';
//
//
// class Clients extends StatefulWidget {
//   const Clients({Key? key}) : super(key: key);
//
//   @override
//   _ClientsState createState() => _ClientsState();
// }
//
// class _ClientsState extends State<Clients> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: const Color(0xFF161615),
//         title: Text(
//           'Клиенты',
//           style: kMainHeading.copyWith(
//               color: Colors.white, fontSize: 20.0),
//         ),
//       ),
//       body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Container(
//               height: 60,
//               decoration: BoxDecoration(
//                   color: Colors.grey[850],
//                   borderRadius: BorderRadius.circular(10)),
//               child:
//                   Column(children: const [
//                     Padding(
//                       padding: EdgeInsets.only(left: 10.0),
//                       child: Icon(
//                         CupertinoIcons.person_alt_circle,
//                         color: Colors.white,
//                         size: 30,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       "клиент1",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                         fontFamily: 'SourceSansPro',
//                       ),
//                     )
//                   ]),
//                   // const SizedBox(
//                   //   height: 18,
//                   // ),
//                   // const Padding(
//                   //   padding: EdgeInsets.only(bottom: 10.0),
//                   //   child: Text(
//                   //     "Ibragym Alibekov",
//                   //     style: TextStyle(
//                   //       fontSize: 20,
//                   //     ),
//                   //   ),
//                   // ),
//                 ]
//             ),
//     )
//       )
//     );
//   }
// }
