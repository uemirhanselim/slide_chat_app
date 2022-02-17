import 'package:firebase_database/firebase_database.dart';
import 'package:slide_chat_app/service/base/database_service.dart';

class DatabaseService extends DatabaseServiceBaseClass {
  final firebaseRef = FirebaseDatabase.instance.reference();
  @override
  Future update(String? userName, String? tag, String? aboutMe,
      String? coverImage, String? profileImage) {
    final map = {
      'userName': userName,
      'tag': tag,
      'aboutMe': aboutMe,
      'coverImage': coverImage,
      'profileImage': profileImage,
    };
    return firebaseRef.child('users').child(userName!).update(map);
  }
}
