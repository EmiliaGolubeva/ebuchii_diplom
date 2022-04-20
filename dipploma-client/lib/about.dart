import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding:
                  EdgeInsets.only(top: 12.0, right: 20, left: 48, bottom: 10),
                  child: Text(
                    "Dude Delivery",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                )
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            const SizedBox(
              width: 110,
              height: 110,
              child: Image(
                image: AssetImage('assets/images/Logo.png'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 400,
                width: 700,
                decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "By ITMO University",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      "Версия 1.0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 300),
                      child: const Text(
                        "От 21 апреля 2022",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const Text(
                      "All rights reserved",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                  // height: 400,
                  // decoration: BoxDecoration(
                  //     color: Colors.grey[850],
                  //     borderRadius: BorderRadius.circular(15)),
                  // child: Column(
                  //   children: const [
                  //     Padding(
                  //       padding: EdgeInsets.only(
                  //           top: 16.0, right: 20, left: 20, bottom: 10),
                  //       child: Text("Приложение сделано студентами из группы Y2438",
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
