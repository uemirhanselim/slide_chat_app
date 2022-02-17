import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/scheduler.dart';
import 'package:slide_chat_app/service/base/auth_service.dart';
import 'package:intl/intl.dart';

class AuthService extends AuthServiceBaseClass {
  final firebaseRef = FirebaseDatabase.instance.ref();

  @override
  void register(String? userName, String? email, String? password,
      String? coverImage, String? profileImage, String? aboutMe, String? tag) {
    print("register func called");
    final map = {
      'email': email!.toLowerCase(),
      'userName': userName!.toLowerCase(),
      'password': password,
      'coverImage': coverImage,
      'profileImage': profileImage,
      'tag': tag,
      'aboutMe': aboutMe
    };

    firebaseRef.child('users').child(userName.toLowerCase()).setWithPriority(map,getDate());
  }

  @override
  Future<dynamic> login(String? email, String? password) {
    // TODO: implement login
    throw UnimplementedError();
  }
  String getDate() {
  final formatter = DateFormat("dd-MM-yyyy");
  final date = DateTime.now();
  return formatter.format(date);
}
}
