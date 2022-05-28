import 'dart:developer';

class Client {
  final int id;
  final int firstName;
  final String lastName;
  final String phone;
  final String organisation;


  const Client({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.organisation,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      organisation: json['organisation'],
    );
  }
}
