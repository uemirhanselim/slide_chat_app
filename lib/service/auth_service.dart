import 'package:firebase_database/firebase_database.dart';
import 'package:slide_chat_app/service/base/auth_service.dart';

class AuthService extends AuthServiceBaseClass {
  final firebaseRef = FirebaseDatabase.instance.reference();

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

    firebaseRef.child('users').child(userName.toLowerCase()).set(map);
  }

  @override
  Future<dynamic> login(String? email, String? password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
