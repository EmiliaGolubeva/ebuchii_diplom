import 'package:flutter/material.dart';

import 'package:dudedelivery/models/client.dart';
import 'package:dudedelivery/post/api_service.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchUser extends SearchDelegate {
  FetchClient _clientList = FetchClient();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Client>>(
        future: _clientList.getclientList(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.all(20),
                      child: const CircularProgressIndicator(
                        strokeWidth: 3.0,
                        valueColor : AlwaysStoppedAnimation(Colors.black87),
                      ),
                    ),
                  );
          }
          List<Client>? data = snapshot.data;
          return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
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
                      padding: const EdgeInsets.only(top: 8.0),
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
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Поиск клиентов',
        style: TextStyle(color: Colors.black87, fontSize: 18),),
    );
  }
}