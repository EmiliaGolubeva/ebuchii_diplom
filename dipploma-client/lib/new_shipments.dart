import 'dart:convert';
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

Future<Delivery?> createDelivery(String date, String time, String address, String phone, String clientName, int amountOfSpaces, String organisation,
String status, String type, double weight, String marks) async{
  Uri uri = Uri.parse('http://25.33.48.59:8083/deliveries');

  final response = await http.post(uri, body: jsonEncode({
    "date": date,
    "time": time,
    "address": address,
    "phone": phone,
    "clientName": clientName,
    "amountOfSpaces": amountOfSpaces.toString(),
    "organisation": organisation,
    "status": status,
    "type": type,
    "weight": weight.toString(),
    "marks": marks
  }), headers: {'Content-Type': 'application/json'});

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

  TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  final TextEditingController amountOfSpaceController = TextEditingController();
  final TextEditingController organizationController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController marksController = TextEditingController();

  DateTime _dateTime = DateTime.now();
  // List<String> items = [ 'ФИО получателя','i1', 'i2', 'i3'];
  final clients = ['Данте из ДМЦ', 'Морган Ю', 'Ярл Баргулф Старший', 'Перекресток, Иванов Иван Иванович'];
  final types = ['Забор груза', 'Доставка', 'Доставка с частичным выкупом'];
  // String? selectedValue = 'ФИО получателя';

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
                        child: TextField(
                          controller: clientNameController,
                          decoration: InputDecoration(
                            labelText: "Клиент",
                            suffixIcon: PopupMenuButton<String>(
                              icon: const Icon(Icons.arrow_drop_down),
                              onSelected: (String value) {
                                clientNameController.text = value;
                              },
                              itemBuilder: (BuildContext context) {
                                return clients
                                    .map<PopupMenuItem<String>>((String value) {
                                  return PopupMenuItem(
                                      child: Text(value), value: value);
                                }).toList();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 12),
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        controller: dateController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'Дата доставки',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 12),
                      child: TextField(
                        controller: timeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          labelText: 'Временной промежуток',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 12),
                      child: TextField(
                        keyboardType: TextInputType.streetAddress,
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
                          right: 20, left: 20, bottom: 12),
                      child: TextField(
                        keyboardType: TextInputType.number,
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
                            right: 20, left: 20, bottom: 12),
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
                        child: TextField(
                          controller: typeController,
                          decoration: InputDecoration(
                            labelText: "Тип доставки",
                            suffixIcon: PopupMenuButton<String>(
                              icon: const Icon(Icons.arrow_drop_down),
                              onSelected: (String value) {
                                typeController.text = value;
                              },
                              itemBuilder: (BuildContext context) {
                                return types
                                    .map<PopupMenuItem<String>>((String value) {
                                  return PopupMenuItem(
                                      child: Text(value), value: value);
                                }).toList();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 12),
                        child: TextField(
                          keyboardType: TextInputType.datetime,
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
                           right: 20, left: 20, bottom: 12),
                        child: TextField(
                          controller: marksController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: 'Детали доставки *',
                          ),
                        ),
                      ),

                      Column(
                        children: [
                        //   const Padding(
                        //   padding: EdgeInsets.only(bottom: 10.0, right: 140),
                        //   child: Text("Выберите время доставки"),
                        // ),
                        //   Padding(
                        //     padding: const EdgeInsets.only(
                        //         bottom: 18, left: 15, right: 15),
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(20),
                        //         color: const Color.fromARGB(255, 209, 209, 209),
                        //       ),
                        //       child: TimePickerSpinner(
                        //         spacing: 30,
                        //         minutesInterval: 10,
                        //         onTimeChange: (time) {
                        //           setState(() {
                        //             _dateTime = time;
                        //           });
                        //         },
                        //       ),
                        //     ),
                        //   ),
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
                              if (clientNameController.text.isEmpty || dateController.text.isEmpty || timeController.text.isEmpty || addressController.text.isEmpty
                              || amountOfSpaceController.text.isEmpty || organizationController.text.isEmpty || typeController.text.isEmpty || weightController.text.isEmpty) {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: const Text(
                                      'Внимание',
                                    ),
                                    content: const Text(
                                      'Необходимо заполнить обязательные поля',
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.of(context).pop(),
                                        child: const Center(
                                          child: Text('OK'),
                                      ),
                                      ),
                                    ],
                                  ),
                                );
                                return;
                              } else {
                                final String date = dateController.text;
                                final String time = timeController.text;
                                final String address = addressController.text;
                                final String phone = phoneController.text;
                                String clientName = clientNameController.text;
                                int amountOfSpaces = int.parse(amountOfSpaceController.text);
                                final String organisation = organizationController.text;
                                final String status = statusController.text;
                                final String type = typeController.text;
                                final double weight = double.parse(weightController.text);
                                final String marks = marksController.text;

                                final Delivery? delivery = await createDelivery(
                                    date,
                                    time,
                                    address,
                                    phone,
                                    clientName,
                                    amountOfSpaces,
                                    organisation,
                                    status,
                                    type,
                                    weight,
                                    marks);
                              }},
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
