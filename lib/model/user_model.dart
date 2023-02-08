import 'package:cloud_firestore/cloud_firestore.dart';

class UserGoogleLogin {
  String? displayName;
  String? email;
  String? photoUrl;
  String? accessToken;

  UserGoogleLogin(
      {this.displayName, this.email, this.photoUrl, this.accessToken});

  factory UserGoogleLogin.fromJson(Map<String, dynamic> json) {
    return UserGoogleLogin(
      email: json['email'],
      displayName: json['displayName'],
      accessToken: json['accessToken'],
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'displayName': displayName,
      'email': email,
      'accessToken': accessToken,
    };
  }
}

class UserData {
  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? location;
  final String? fcmtoken;
  final Timestamp? createAt;

  UserData(
      {this.id,
      this.name,
      this.email,
      this.photoUrl,
      this.location,
      this.fcmtoken,
      this.createAt});

  factory UserData.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserData(
        id: data?['id'],
        name: data?['name'],
        email: data?['email'],
        photoUrl: data?['photoUrl'],
        location: data?['location'],
        fcmtoken: data?['fcmtoken'],
        createAt: data?["createAt"]);
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (photoUrl != null) "photour]": photoUrl,
      if (location != null) "location": location,
      if (fcmtoken != null) "fcmtoken": fcmtoken,
      if (createAt != null) "addtime": createAt,
    };
  }
}
