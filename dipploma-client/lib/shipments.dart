import 'package:dudedelivery/post/convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'models/delivery.dart';

class Shipments extends StatefulWidget {
  const Shipments({Key? key}) : super(key: key);

  @override
  _ShipmentsState createState() => _ShipmentsState();
}

class _ShipmentsState extends State<Shipments> {
  late Future<List<Delivery>> futureDelivery;

  @override
  void initState() {
    super.initState();
    // futureDelivery = fetchDelivery();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(text: 'Новые'),
                  Tab(text: 'В работе'),
                  Tab(text: 'Выполненные б'),
                ],
              ),
              centerTitle: true,
              backgroundColor: const Color(0xFF161615),
              title: Text(
                'Доставки',
                style: kMainHeading.copyWith(
                    color: Colors.white, fontSize: 20.0),
              ),
            ),
            body: TabBarView (
              children: [
                  Center(
                    child: Column(
                      children: [
                          Expanded(
                              child: FutureBuilder<List<Delivery>>(
                                future: fetchDelivery(),
                                builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                return ListView(
                                shrinkWrap: true,
                                children: [
                              ...snapshot.requireData.map<Widget>(
                                      (e) => Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0, right: 8.0, left: 8.0),
                                        child: Card(
                                          color: Colors.grey[850],
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            side: BorderSide(
                                              color: Colors.grey.withOpacity(0.5),
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              ListTile(
                                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(9),
                                                  topRight: Radius.circular(9),
                                                  ),
                                                ),
                                                tileColor: Colors.blue[100],
                                                  title: Text('№: ${e.id} (${e.type})\nВес:${e.weight}, Количество: ${e.amountOfSpaces}',
                                                    style: const TextStyle(
                                                        color: Colors.black87
                                                    ),
                                                  ),
                                                trailing: Text('${e.date}\n${e.time}',
                                                  style: const TextStyle(
                                                      color: Colors.black87
                                                  ),
                                                ),
                                                // subtitle: Text('Клиент: ${e.clientName}\n\nОрганизация: ${e.organisation}'),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                                                child: ListTile(
                                                  subtitle: Text('Адрес: ${e.address}\n\nКлиент: ${e.clientName}\n\nОрганизация: ${e.organisation}\n\nДетали: ${e.marks}',
                                                    style: const TextStyle(
                                                        color: Colors.white
                                                    ),
                                                  ),
                                                  // subtitle: Text('Клиент: ${e.clientName}\n\nОрганизация: ${e.organisation}'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                              ],
                            );
                          }
                                return CircularProgressIndicator();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: FutureBuilder<List<Delivery>>(
                          future: fetchDelivery(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView(
                                shrinkWrap: true,
                                children: [
                                  ...snapshot.requireData.map<Widget>(
                                          (e) => Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10.0, right: 8.0, left: 8.0),
                                            child: Card(
                                              color: Colors.grey[850],
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  width: 0.5,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  ListTile(
                                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(9),
                                                      topRight: Radius.circular(9),
                                                    ),
                                                    ),
                                                    tileColor: Colors.yellow[100],
                                                    title: Text('№: ${e.id} (${e.type})\nВес:${e.weight}, Количество: ${e.amountOfSpaces}',
                                                      style: const TextStyle(
                                                          color: Colors.black87
                                                      ),
                                                    ),
                                                    trailing: Text('${e.date}\n${e.time}',
                                                      style: const TextStyle(
                                                          color: Colors.black87
                                                      ),
                                                    ),
                                                    // subtitle: Text('Клиент: ${e.clientName}\n\nОрганизация: ${e.organisation}'),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                                                    child: ListTile(
                                                      subtitle: Text('Адрес: ${e.address}\n\nКлиент: ${e.clientName}\n\nОрганизация: ${e.organisation}\n\nДетали: ${e.marks}',
                                                        style: const TextStyle(
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                      // subtitle: Text('Клиент: ${e.clientName}\n\nОрганизация: ${e.organisation}'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              );
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: FutureBuilder<List<Delivery>>(
                          future: fetchDelivery(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView(
                                shrinkWrap: true,
                                children: [
                                  ...snapshot.requireData.map<Widget>(
                                          (e) => Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10.0, right: 8.0, left: 8.0),
                                            child: Card(
                                              color: Colors.grey[850],
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  width: 0.5,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  ListTile(
                                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(9),
                                                      topRight: Radius.circular(9),
                                                    ),
                                                    ),
                                                    tileColor: Colors.green[200],
                                                    title: Text('№: ${e.id} (${e.type})\nВес:${e.weight}, Количество: ${e.amountOfSpaces}',
                                                      style: const TextStyle(
                                                          color: Colors.black87
                                                      ),
                                                    ),
                                                    trailing: Text('${e.date}\n${e.time}',
                                                      style: const TextStyle(
                                                          color: Colors.black87
                                                      ),
                                                    ),
                                                    // subtitle: Text('Клиент: ${e.clientName}\n\nОрганизация: ${e.organisation}'),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                                                    child: ListTile(
                                                      subtitle: Text('Адрес: ${e.address}\n\nКлиент: ${e.clientName}\n\nОрганизация: ${e.organisation}\n\nДетали: ${e.marks}',
                                                        style: const TextStyle(
                                                            color: Colors.white
                                                        ),
                                                      ),
                                                      // subtitle: Text('Клиент: ${e.clientName}\n\nОрганизация: ${e.organisation}'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              );
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        )
    );
  }
}
