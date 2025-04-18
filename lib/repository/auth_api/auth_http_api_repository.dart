
import '../../data/network/network_api_services.dart';
import '../../utils/app_url.dart';
import 'auth_api_repository.dart';

class AuthHttpApiRepository implements AuthApiRepository {
  final NetworkApiServices _apiServices;

  AuthHttpApiRepository(this._apiServices);

  @override
  Future<bool> login(String email, String password) async {
    try {
      // Mock API call (replace with real endpoint)
      final response = await _apiServices.postApi(
        AppUrl.loginUrl,
        {'email': email, 'password': password},
      );
      // Assume response contains a token or success indicator
      return response['success'] == true; // Adjust based on your API
    } catch (e) {
      rethrow;
    }
  }
}