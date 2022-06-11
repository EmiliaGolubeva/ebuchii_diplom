import 'package:dudedelivery/models/client.dart';
import 'package:dudedelivery/post/api_service.dart';
import 'package:dudedelivery/search.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants.dart';

class Clients extends StatefulWidget {
  @override
  _ClientsState createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  FetchClient _userList = FetchClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF161615),
        centerTitle: true,
        title: Text(
          'Клиенты',
          style: kMainHeading.copyWith(color: Colors.white, fontSize: 20.0),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchUser());
            },
            icon: Icon(Icons.search_sharp),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: FutureBuilder<List<Client>>(
            future: _userList.getclientList(),
            builder: (context, snapshot) {
              var data = snapshot.data;
              return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.all(20),
                          child: const CircularProgressIndicator(
                            strokeWidth: 3.0,
                            valueColor: AlwaysStoppedAnimation(Colors.black87),
                          ),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(right: 3.0, left: 3.0),
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                            width: 0.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                          ),
                          child: ListTile(
                            leading: const Image(
                              image: AssetImage('assets/images/client.png'),
                            ),
                            title: Text('${data?[index].firstName} ${data?[index].lastName}'),
                            subtitle: Text('Организация: ${data?[index].organisation}\nАдрес: ${data?[index].address}'),
                            trailing: IconButton(
                              icon: Icon(Icons.phone_in_talk),
                              onPressed: () async {
                                launch('tel://+7${data?[index].phone}');
                              },
                            ),
                            isThreeLine: true,
                          ),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
