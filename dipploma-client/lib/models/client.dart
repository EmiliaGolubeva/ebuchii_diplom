class ClientsList{
  static final clients = [
    Client(
      clientId: 1,
      clientName: "Митя Фомин",
      clientPhone: "+8 (800) 555-35-35",
      clientAddress: "Песочная набережная дом 14",
      clientOrganization: "1000-7",
    )
  ];
}

class Client {
  final int clientId;
  final String clientName;
  final String clientPhone;
  final String clientAddress;
  final String clientOrganization;

  Client({required this.clientId,required this.clientName, required this.clientPhone, required this.clientAddress, required this.clientOrganization});
}