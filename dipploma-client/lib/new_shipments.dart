import 'package:dudedelivery/widgets/card_with_check.dart';
import 'package:dudedelivery/widgets/common_app_bar.dart';
import 'package:dudedelivery/widgets/counter_button.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import 'package:flutter/material.dart';

import '../constants.dart';

class NewShipments extends StatefulWidget {
  const NewShipments({Key? key}) : super(key: key);

  @override
  _NewShipmentsState createState() => _NewShipmentsState();
}

class _NewShipmentsState extends State<NewShipments> {
  DateTime _dateTime = DateTime.now();
  String counterlabel = 'Document Count';

  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF161615),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            CommonAppBar(
              maxSize: maxSize,
              labeltext: 'Создать новую доставку',
              aheight: 0.09,
              icolor: Colors.white,
            ),
            Expanded(
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
                      height: maxSize.height * 0.04,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     CardWithCheck(
                    //       maxSize: maxSize,
                    //       labelText: 'Документы',
                    //       imageName: 'envelope.png',
                    //       buttontap: () {
                    //         counterlabel = 'Documnet Count';
                    //       },
                    //     ),
                    //     CardWithCheck(
                    //       maxSize: maxSize,
                    //       labelText: 'Пакет',
                    //       imageName: 'parcel.png',
                    //       buttontap: () {
                    //         counterlabel = 'Documnet Count';
                    //       },
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'ФИО получателя',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 12.0, right: 20, left: 20, bottom: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'Адрес доставки',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 12.0, right: 20, left: 20, bottom: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'Телефон получателя',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10.0, right: 140),
                      child: Text("Выберите время доставки"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 9.582857, left: 15, right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 209, 209, 209),
                        ),
                        child: TimePickerSpinner(
                          spacing: 30,
                          minutesInterval: 10,
                          onTimeChange: (time) {
                            setState(() {
                              _dateTime = time;
                            });
                          },
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[850],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Сохранить',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
