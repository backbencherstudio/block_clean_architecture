abstract class AuthApiRepository {
  Future<bool> login(String email, String password);
}