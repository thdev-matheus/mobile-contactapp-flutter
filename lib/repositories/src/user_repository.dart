import 'package:contact_app/api/contact_app_api.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final _api = ContactAppAPI().dio;

  Future<void> register({
    required String username,
    required String password,
    required String imagePath,
  }) async {
    try {
      _api.options.headers['X-Parse-Revocable-Session'] = '1';
      var data = {
        "username": username,
        "password": password,
        "imagePath": imagePath
      };

      await _api.post('/users', data: data);
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        stackTrace: e.stackTrace,
        error: e.error,
        message: e.message,
        type: e.type,
      );
    } catch (_) {
      throw Exception();
    }
  }
}
