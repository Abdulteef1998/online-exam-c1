import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:online_exam_c1_online/data/base/result.dart';
import 'exceptions.dart';


Future <Result<T>> executeApi<T>( Future<Result<T>> Function() apiCall) async{
  try{
    var result = await apiCall.call() ;
    return result;
  }on DioException catch(e){
    return Fail(e);
  } on TimeoutException catch(e){
    return Fail(NoInternetException());
  }on IOException catch(e){
    return Fail(NoInternetException());
  }
}

