
class NotificationModel {
  String? id;
  String? title;
  String? resone;
  String? description;

  NotificationModel({this.id, this.title, this.resone, this.description});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["resone"] is String) {
      resone = json["resone"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["resone"] = resone;
    _data["description"] = description;
    return _data;
  }
}