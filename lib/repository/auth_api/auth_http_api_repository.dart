
import 'package:flutter/widgets.dart';

import '../../data/network/network_api_services.dart';
import '../../utils/app_url.dart';
import 'auth_api_repository.dart';

class AuthHttpApiRepository implements AuthApiRepository {
  final NetworkApiServices _apiServices;

  AuthHttpApiRepository(this._apiServices);

  @override
  @override
  Future<bool> login(String email, String password) async {
    try {
      final response = await _apiServices.postApi(
        AppUrl.loginUrl,
        {'username': email, 'password': password},
      );
      debugPrint('Login response: $response');
      return response['success'] == true;
    } catch (e) {
      debugPrint('Login failed: $e');
      rethrow;
    }
  }

}