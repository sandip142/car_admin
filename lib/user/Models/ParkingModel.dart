class ParkingModel {
  String? id;
  String? name;
  String? address;
  String? latitude;
  String? longitude;
  String? price;
  String? status;
  String? bookingTime;
  String? parkingTime;
  String? vehicalNumber;
  String? slotNumber;
  String? parkingFromTime;
  String? parkingToTime;
  String? totalTime;
  String? totalRemainingTime;
  String? totalAmount;
  String? parkingStatus;
  String? liveVideoUrl;
  String? checkOutTime;

  ParkingModel({
    this.id,
    this.name,
    this.address,
    this.latitude,
    this.longitude,
    this.price,
    this.status,
    this.bookingTime,
    this.parkingTime,
    this.vehicalNumber,
    this.slotNumber,
    this.parkingFromTime,
    this.parkingToTime,
    this.totalTime,
    this.totalRemainingTime,
    this.totalAmount,
    this.parkingStatus,
    this.liveVideoUrl,
    this.checkOutTime,
  });

  ParkingModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    address = json["address"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    price = json["price"];
    status = json["status"];
    bookingTime = json["bookingTime"];
    parkingTime = json["parkingTime"];
    vehicalNumber = json["vehicalNumber"];
    slotNumber = json["slotNumber"];
    parkingFromTime = json["parkingFromTime"];
    parkingToTime = json["parkingToTime"];
    totalTime = json["totalTime"];
    totalRemainingTime = json["totalRemainingTime"];
    totalAmount = json["totalAmount"];
    parkingStatus = json["parkingStatus"];
    liveVideoUrl = json["liveVideoUrl"];
    checkOutTime = json["checkOutTime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["address"] = address;
    _data["latitude"] = latitude;
    _data["longitude"] = longitude;
    _data["price"] = price;
    _data["status"] = status;
    _data["bookingTime"] = bookingTime;
    _data["parkingTime"] = parkingTime;
    _data["vehicalNumber"] = vehicalNumber;
    _data["slotNumber"] = slotNumber;
    _data["parkingFromTime"] = parkingFromTime;
    _data["parkingToTime"] = parkingToTime;
    _data["totalTime"] = totalTime;
    _data["totalRemainingTime"] = totalRemainingTime;
    _data["totalAmount"] = totalAmount;
    _data["parkingStatus"] = parkingStatus;
    _data["liveVideoUrl"] = liveVideoUrl;
    _data["checkOutTime"] = checkOutTime;
    return _data;
  }
}
