import 'package:dudedelivery/models/clients.dart';
import 'package:dudedelivery/widgets/client_widget.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ClientsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final clientsList = List.generate(20, (index) => ClientsList.clients[0]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF161615),
        title: Text(
        'Мои клиенты',
        style: kMainHeading.copyWith(
            color: Colors.white, fontSize: 20.0),
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: clientsList.length,
            itemBuilder: (context, index) {
              return ClientWidget(
                client:  clientsList[index],
              );
            },
        ),
      ),
    );
  }
}
