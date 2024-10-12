import 'dart:async';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/core/utils/api_constans.dart';
import 'package:online_exam_c1_online/domain/model/auth_response.dart';
import 'package:online_exam_c1_online/domain/model/register_model.dart';


@singleton
class ApiManager{
  final _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl
  ));

  ApiManager(){
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

  Future<AuthResponse> login(String email,String password) async{
    var apiCall = await _dio.post(ApiConstants.loginApi, data: {
      "email":email,
      "password":password
    });
    print(apiCall.statusCode);
    print(apiCall.data);
    return AuthResponse.fromJson(apiCall.data);
  }

  Future<AuthResponse> register(RegisterRequest requestBody)async{
    var apiCall = await _dio.post(ApiConstants.registerApi, data: requestBody.toJson());
    return AuthResponse.fromJson(apiCall.data);
  }

}