import 'package:slide_chat_app/base/auth_service_base.dart';
import 'package:slide_chat_app/helpers/locator.dart';
import 'package:slide_chat_app/service/auth_service.dart';

class AuthRepository extends AuthServiceBase {
  final AuthService _service = locator<AuthService>();
  @override
  void register(
      String? userName,
      String? email,
      String? password,
      String? coverImage,
      String? profileImage,
      String? aboutMe,
      String? tag) async {
    _service.register(
        userName, email, password, coverImage, profileImage, aboutMe, tag);
  }

  @override
  Future<dynamic> login(String? email, String? password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
