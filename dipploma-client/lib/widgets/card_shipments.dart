import 'package:flutter/material.dart';

import '../models/delivery.dart';

class ShipmentCard extends StatefulWidget {
  final Delivery delivery;

  ShipmentCard(this.delivery);

  @override
  State<StatefulWidget> createState() {
    return _ShipmentCardState(delivery);
  }
}

class _ShipmentCardState extends State<ShipmentCard> {
  Delivery delivery;


  _ShipmentCardState(this.delivery);

  Widget get deliveryCard {
    return
      new Card(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.album),
                  title: Text('The ${delivery.id} is having:'),
                  subtitle: Text('${delivery.amountOfSpaces} Votes.'),
                ),
              ]
          ));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:  deliveryCard,
    );
  }
}