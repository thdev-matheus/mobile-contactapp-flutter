import 'package:contact_app/models/models.dart';

class ContactModel {
  String objectId = "";
  String imagePath = "";
  String name = "";
  String number = "";
  String createdAt = "";
  String updatedAt = "";
  Owner owner = Owner(UserModel.objectId);

  ContactModel(
    this.objectId,
    this.imagePath,
    this.name,
    this.number,
    this.createdAt,
    this.updatedAt,
  );

  ContactModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    imagePath = json['imagePath'];
    name = json['name'];
    number = json['number'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['objectId'] = objectId;
    data['imagePath'] = imagePath;
    data['name'] = name;
    data['number'] = number;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['owner'] = owner.toJson();

    return data;
  }
}
