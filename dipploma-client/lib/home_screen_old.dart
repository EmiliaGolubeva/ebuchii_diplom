import 'package:dudedelivery/widgets/card_view.dart';
import 'package:dudedelivery/widgets/custom_inputtext.dart';
import 'package:dudedelivery/widgets/drop_down_menu.dart';
import 'package:dudedelivery/widgets/notification_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF161615),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: maxSize.width * 0.04,
                right: maxSize.width * 0.04,
                bottom: maxSize.height * 0.06,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      // Text(
                      //   'Выберите город',
                      //   style: kLightGreyText.copyWith(fontSize: 12.0),
                      // ),
                      const NotificationWidget(),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     const Icon(
                  //       Icons.my_location,
                  //       color: Colors.white,
                  //       size: 13.0,
                  //     ),
                  //     SizedBox(
                  //       width: maxSize.width * 0.02,
                  //     ),
                  //     DropDownData(
                  //       category: const [
                  //         'Москва',
                  //         'Санкт-Петербург',
                  //         'Екатеринбург',
                  //         'Тихвин'
                  //       ],
                  //       elevation: 0,
                  //       labelText: 'Город',
                  //       iconColor: Colors.white,
                  //       labelstyle: kNormalText,
                  //       itemStyle: kNormalText.copyWith(
                  //         color: Colors.white,
                  //         fontSize: 10,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: maxSize.height * 0.03,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Доставляйте посылки где бы вы не находились!',
                          style: kMainHeading.copyWith(
                              color: Colors.white, fontSize: 18.0),
                        ),
                        SizedBox(
                          height: maxSize.height * 0.03,
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 18.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       Container(
                  //         width: maxSize.width * 0.8,
                  //         height: maxSize.height * 0.06,
                  //         decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         child: const Padding(
                  //           padding: EdgeInsets.only(left: 20.0),
                  //           child: CustomInputText(),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            const BottomScreen(),
          ],
        ),
      ),
    );
  }
}

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: maxSize.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardView(
                  maxSize: maxSize,
                  labelText: 'Новая доставка',
                  imageName: '2.png',
                  buttontap: () {
                    Navigator.pushNamed(context, '/newshimpent');
                  },
                ),
                CardView(
                  maxSize: maxSize,
                  labelText: 'Построить маршрут',
                  imageName: '1.png',
                  buttontap: () {
                    Navigator.pushNamed(context, '/map');
                  },
                ),
              ],
            ),
            SizedBox(
              height: maxSize.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardView(
                  maxSize: maxSize,
                  labelText: 'Завершенные',
                  imageName: 'completed.png',
                  buttontap: () {
                    Navigator.pushNamed(context, '/shipments');
                  },
                ),
                CardView(
                  maxSize: maxSize,
                  labelText: 'Посчитать',
                  imageName: 'calculate.png',
                  buttontap: () {
                    Navigator.pushNamed(context, '/test');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
