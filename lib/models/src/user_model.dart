// ignore_for_file: unnecessary_this

class UserModel {
  static String? username;
  static String? imagePath;
  static String? createdAt;
  static String? updatedAt;
  static String? objectId;
  static String? sessionToken;

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    imagePath = json['imagePath'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    objectId = json['objectId'];
    sessionToken = json['sessionToken'];
  }

  static Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['username'] = username;
    data['imagePath'] = imagePath;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['objectId'] = objectId;
    data['sessionToken'] = sessionToken;

    return data;
  }

  static clearUser() {
    username = null;
    imagePath = null;
    createdAt = null;
    updatedAt = null;
    objectId = null;
    sessionToken = null;
  }
}

class Owner {
  String sType = "Pointer";
  String className = "_User";
  String? objectId;

  Owner(this.objectId);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['__type'] = sType;
    data['className'] = className;
    data['objectId'] = objectId;

    return data;
  }
}
