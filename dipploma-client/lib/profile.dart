import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                ),
                const SizedBox(
                  width: 50,
                )
              ],
            ),

            
            const Text(
              "pussydone@gmail.com",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/editprofile');
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        CupertinoIcons.person_alt_circle,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Настройки профиля",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'SourceSansPro',
                      ),
                    )
                  ]),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/page');
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        CupertinoIcons.link_circle,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Партнерская программа",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )
                  ]),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        CupertinoIcons.question_circle,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "О приложении",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
