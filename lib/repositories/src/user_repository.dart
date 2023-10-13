import 'package:contact_app/api/contact_app_api.dart';
import 'package:contact_app/models/models.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final _api = ContactAppAPI().dio;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      _api.options.headers['X-Parse-Revocable-Session'] = '1';
      var response =
          await _api.get('/login?username=$username&password=$password');

      _api.options.headers['X-Parse-Session-Token'] =
          response.data['sessionToken'];
      var me = await _api.get('/users/me');

      UserModel.fromJson(me.data);
    } catch (e) {
      throw Error();
    }
  }

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

  Future<void> changeAvatar({required String imagePath}) async {
    _api.options.headers['X-Parse-Session-Token'] = UserModel.sessionToken;

    var data = {
      'username': UserModel.username,
      'imagePath': imagePath,
    };

    await _api.put('/users/${UserModel.objectId}', data: data);

    var me = await _api.get('/users/me');

    UserModel.fromJson(me.data);
  }

  Future<void> logout() async {
    _api.options.headers['X-Parse-Session-Token'] = UserModel.sessionToken;

    const body = {};

    await _api.post('/logout', data: body).then((_) {
      UserModel.clearUser();
    });
  }
}
