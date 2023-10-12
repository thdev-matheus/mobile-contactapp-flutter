import 'package:contact_app/api/contact_app_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ContactAppAPI {
  final _dio = Dio();

  Dio get dio => _dio;

  ContactAppAPI() {
    _dio.options.baseUrl = dotenv.get('CONTACT_APP_BASE_URL');
    _dio.options.headers['Content-Type'] = 'application/json';

    _dio.interceptors.add(ContactAppAPIInterceptor());
  }
}
