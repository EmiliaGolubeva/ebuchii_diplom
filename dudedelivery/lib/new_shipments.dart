import 'package:dudedelivery/widgets/card_with_check.dart';
import 'package:dudedelivery/widgets/common_app_bar.dart';
import 'package:dudedelivery/widgets/counter_button.dart';

import 'package:flutter/material.dart';

import '../constants.dart';

class NewShipments extends StatefulWidget {
  const NewShipments({Key key}) : super(key: key);

  @override
  _NewShipmentsState createState() => _NewShipmentsState();
}

class _NewShipmentsState extends State<NewShipments> {
  String counterlabel = 'Document Count';
  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    return Scaffold(
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
                      height: maxSize.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardWithCheck(
                          maxSize: maxSize,
                          labelText: 'Документы',
                          imageName: 'envelope.png',
                          buttontap: () {
                            counterlabel = 'Documnet Count';
                          },
                        ),
                        CardWithCheck(
                          maxSize: maxSize,
                          labelText: 'Пакет',
                          imageName: 'parcel.png',
                          buttontap: () {
                            counterlabel = 'Documnet Count';
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CounterButton(),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[400],
                                  offset: const Offset(6.0, 6.0),
                                  blurRadius: 8.0,
                                  spreadRadius: 1.0,
                                ),
                                const BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-6.0, -6.0),
                                  blurRadius: 8.0,
                                  spreadRadius: 1.0,
                                ),
                              ]),
                          child: SizedBox(
                            width: maxSize.width * 0.12,
                            height: maxSize.height * 0.06,
                            child: const Icon(Icons.other_houses_outlined),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[400],
                                  offset: const Offset(6.0, 6.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 1.0,
                                ),
                                const BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-6.0, -6.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 1.0,
                                ),
                              ]),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: maxSize.width * 0.09,
                              right: maxSize.width * 0.09,
                            ),
                            child: DropdownButton(
                                elevation: 10,
                                underline: Container(),
                                hint: const Text('Выберите компанию'),
                                items: <String>[
                                  'A',
                                  'B',
                                  'C',
                                  'A',
                                  'B',
                                  'C',
                                  'A',
                                  'B',
                                  'C',
                                  'A',
                                  'B',
                                  'C',
                                  'A',
                                  'B',
                                  'C',
                                  'A',
                                  'B',
                                  'C',
                                  'A',
                                  'B',
                                  'C',
                                  'A',
                                  'B',
                                  'C',
                                  'A',
                                  'B',
                                  'C'
                                ].map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (_) {}),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: maxSize.height * 0.07,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kMainColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 55, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/map');
                      },
                      child: const Text(
                        'Сохранить',
                        style: TextStyle(fontSize: 18),
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
