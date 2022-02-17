abstract class AuthServiceBase {
  void register(
    String? userName,
    String? email,
    String? password,
    String? coverImage,
    String? profileImage,
    String? aboutMe,
    String? tag,
  );
  Future<dynamic> login(
    String? email,
    String? password,
  );
}
