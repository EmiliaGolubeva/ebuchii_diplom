import 'dart:developer';

import 'package:dudedelivery/models/delivery.dart';
import 'package:dudedelivery/widgets/common_app_bar.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class NewShipments extends StatefulWidget {
  const NewShipments({Key? key}) : super(key: key);

  @override
  _NewShipmentsState createState() => _NewShipmentsState();
}

Future<Delivery?> createDelivery(String clientName, String organisation, String address, double weight,
int amountOfSpaces, String marks, String date) async{
  Uri uri = Uri.parse('http://25.33.48.59:8083/delivery/');

  final response = await http.post(uri, body: {
    "date": date,
    "address": address,
    "clientName": clientName,
    "amountOfSpaces": amountOfSpaces,
    "organisation": organisation,
    "weight": weight,
    "marks": marks
  });

  log('${response.body}', name: 'createDelivery body');
  log('${response.statusCode}', name: 'createDelivery status');

  if (response.statusCode == 200) {
    final String responseString = response.body;

    return deliveryFromJson(responseString);
  }
  else {
   return null;
  }
}

class _NewShipmentsState extends State<NewShipments> {

  late Delivery _delivery;

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController clientNameController = TextEditingController();
  final TextEditingController amountOfSpaceController = TextEditingController();
  final TextEditingController organizationController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController marksController = TextEditingController();

  DateTime _dateTime = DateTime.now();
  List<String> items = [ 'ФИО получателя','i1', 'i2', 'i3'];
  String? selectedItem = 'ФИО получателя';

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
                child: ListView(
                  children: [
                    SizedBox(
                      height: maxSize.height * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: DropdownButton<String>
                          (
                          value: selectedItem,
                          elevation: 2,
                          isExpanded: true,
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item, style: TextStyle(fontSize: 15)),
                          ))
                              .toList(),
                          onChanged: (item) => setState(() => selectedItem = item),
                        ),
                      ),


                    ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 12),
                        child: TextField(
                          controller: clientNameController,
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
                          controller: organizationController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Организация',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0, right: 20, left: 20, bottom: 12),
                        child: TextField(
                          controller: addressController,
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
                          controller: weightController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Вес груза',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0, right: 20, left: 20, bottom: 12),
                        child: TextField(
                          controller: amountOfSpaceController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Количество',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12.0, right: 20, left: 20, bottom: 12),
                        child: TextField(
                          controller: marksController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Детали доставки',
                          ),
                        ),
                      ),

                      Column(
                        children: [
                          const Padding(
                          padding: EdgeInsets.only(bottom: 10.0, right: 140),
                          child: Text("Выберите время доставки"),
                        ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 18, left: 15, right: 15),
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
                            onPressed: () async {
                              final String clientName = clientNameController.text;
                              final String organisation = organizationController.text;
                              final String address = addressController.text;
                              final double weight = double.parse(weightController.text);
                              final int amountOfSpaces = int.parse(amountOfSpaceController.text);
                              final String marks = marksController.text;
                              final String date = dateController.text;
                              
                              final Delivery? delivery = await createDelivery(clientName, organisation, address, weight, amountOfSpaces, marks, date);
                              },
                            child: const Text(
                              'Сохранить',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
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
