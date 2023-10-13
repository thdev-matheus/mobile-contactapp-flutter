// ignore_for_file: unnecessary_this

import 'package:contact_app/models/models.dart';

class UserContactsModel {
  static List<ContactModel> contacts = [];

  UserContactsModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      contacts = <ContactModel>[];
      json['results'].forEach((v) {
        contacts.insert(0, ContactModel.fromJson(v));
      });
    }
  }

  static Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['results'] = contacts.map((v) => v.toJson()).toList();

    return data;
  }
}
