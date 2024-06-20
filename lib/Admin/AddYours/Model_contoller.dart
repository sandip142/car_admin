class FormModel {
  String name;
  String address;
  String location;
  int slots;
  String mobileNumber;

  FormModel({
   required this.name,
    required this.address,
    required this.location,
    required this.slots,
    required this.mobileNumber,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        name: json['name'],
        address: json['address'],
        location: json['location'],
        slots: json['slots'],
        mobileNumber: json['mobileNumber'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'location': location,
        'slots': slots,
        'mobileNumber': mobileNumber,
      };
}
