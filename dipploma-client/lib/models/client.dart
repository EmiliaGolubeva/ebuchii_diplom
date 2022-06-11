import 'dart:developer';

class Client {
  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? organisation;
  String? address;


   Client({
     this.id,
     this.firstName,
     this.lastName,
     this.phone,
     this.organisation,
     this.address
  });

   Client.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      firstName = json['firstName'];
      lastName = json['lastName'];
      phone = json['phone'];
      organisation = json['organisation'];
      address = json['address'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['organisation'] = this.organisation;
    data['address'] = this.address;
    return data;
  }
}
