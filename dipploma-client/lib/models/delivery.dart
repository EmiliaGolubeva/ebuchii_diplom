
import 'dart:developer';

class Delivery {
  final int id;
  final int amountOfSpaces;
  final String organisation;
  final String address;
  final String clientName;
  final String date;
  final String phone;
  final String status;
  final String type;
  final double weight;
  final String marks;
  final String time;

  const Delivery({
    required this.id,
    required this.amountOfSpaces,
    required this.organisation,
    required this.address,
    required this.clientName,
    required this.date,
    required this.phone,
    required this.status,
    required this.type,
    required this.weight,
    required this.marks,
    required this.time,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      id: json['id'],
      amountOfSpaces: json['amountOfSpaces'],
      organisation: json['organisation'],
      address: json['address'],
      clientName: json['clientName'],
      date: json['date'],
      phone: json['phone'],
      status: json['status'],
      type: json['type'],
      weight: json['weight'],
      marks: json['marks'],
      time: json['time'],
    );
  }
}
