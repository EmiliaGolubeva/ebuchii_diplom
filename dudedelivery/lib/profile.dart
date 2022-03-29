import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 30),
          children: [
            const Text(
              "Dude Delivery",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.account_circle_outlined,
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Профиль",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.settings,
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Настройки",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.app_settings_alt_outlined,
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          "О приложении",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
