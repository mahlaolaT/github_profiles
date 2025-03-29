import 'package:dio/dio.dart';

class AuthorizationInterceptor extends Interceptor {
  final String token;

  AuthorizationInterceptor({required this.token});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers["Authorization"] = "Bearer $token";
    handler.next(options); // Continue with the request
  }
}
