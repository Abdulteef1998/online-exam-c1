import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/core/utils/api_constans.dart';
import 'package:online_exam_c1_online/domain/model/auth_response.dart';
import 'package:online_exam_c1_online/domain/model/register_model.dart';

@singleton
class ApiManager {
  final _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  String? token;
  ApiManager() {
    token = '';
    _dio
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      logPrint: (object) {
        print('api ::   $object');
      },
    ));
  }

  Future<AuthResponse> login(String email, String password) async {
    final json = {
      "email": email,
      "password": password,
    };
    var apiCall = await _dio.post(
      ApiConstants.loginApi,
      data: jsonEncode(json),
    );
    print(apiCall.statusCode);
    print(apiCall.data);
    return AuthResponse.fromJson(apiCall.data);
  }

  Future<AuthResponse> register(RegisterRequest requestBody) async {
    final json = {
      "username": requestBody.userName,
      "firstName": requestBody.firstName,
      "lastName": requestBody.lastName,
      "email": requestBody.email,
      "password": requestBody.password,
      "rePassword": requestBody.rePassword,
      "phone": requestBody.phone,
    };
    var apiCall =
        await _dio.post(ApiConstants.registerApi, data: jsonEncode(json));
    return AuthResponse.fromJson(apiCall.data);
  }

  Future<AuthResponse> forgotPassword(String email) async {
    final json = {"email": email};
    var apiCall = await _dio.post(
      ApiConstants.forgotPasswordApi,
      data: jsonEncode(json),
    );
    print(apiCall.statusCode);
    print(apiCall.data);
    return AuthResponse.fromJson(apiCall.data);
  }

  Future<AuthResponse> verifyResetCode(String resetCode) async {
    final json = {"resetCode": resetCode};
    var apiCall = await _dio.post(
      ApiConstants.verifyResetCodeApi,
      data: jsonEncode(json),
    );
    print(apiCall.statusCode);
    print(apiCall.data);
    return AuthResponse.fromJson(apiCall.data);
  }

  Future<AuthResponse> resetPassword(String email, String newPassword) async {
    final json = {
      "email": email,
      "newPassword": newPassword,
    };
    var apiCall = await _dio.put(
      ApiConstants.resetPasswordApi,
      data: jsonEncode(json),
    );
    print(apiCall.statusCode);
    print(apiCall.data);
    return AuthResponse.fromJson(apiCall.data);
  }
}
