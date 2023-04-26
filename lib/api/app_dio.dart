// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide FormData, MultipartFile, Response;
import 'package:ionmobile/api/error_process.dart';
import 'package:ionmobile/app_controller.dart';
import 'package:ionmobile/constants/api_contants.dart';

enum DioMethod {
  post,
  get,
  delete,
  put,
}

class AppDio {
  Dio dio = Dio();
  AppController appController = Get.find();

  BaseOptions options = BaseOptions(
    baseUrl: APICons.baseURL,
    contentType: 'application/json',
    connectTimeout: Duration(seconds: 30),
    sendTimeout: Duration(seconds: 30),
    receiveTimeout: Duration(seconds: 30),
  );

  AppDio() {
    dio.options = options;
    dio.httpClientAdapter = IOHttpClientAdapter();
    dio.interceptors.add(InterceptorsWrapper(
        onError: (DioError error, ErrorInterceptorHandler handler) async {
      if (error.response?.statusCode == 401) {
        debugPrint(
            '=========================================== onErrorIntercepor 403');
        // final opt = error.response!.requestOptions;
        // await Future.delayed(Duration(seconds: 3));
        // final token = await RefreshToken().refreshToken();
        //// next step: update token in header
        /// retry call with dio
      }
      return handler.next(error);
    }, onRequest: (options, handler) async {
      if (await appController.isAvailableInternet()) {
        debugPrint(
            '=========================================== available Internet');
      } else {
        debugPrint('=========================================== no Internet');
      }
      handler.next(options);
    }));
  }

  Future<dynamic> sendPostRequest(
      String apiPath, Map<String, dynamic>? param, bool hasToken) async {
    try {
      print(
          '====================================== START POST REQUEST =============================================');
      print('API:$apiPath \nPARAM: $param-------------');
      print(
          '======================================  END POST REQUEST  =========================================\n');
      Map<String, dynamic>? params = param;
      if (hasToken) {
        //TODO: add TOKEN
        // dio.options.headers["Authorization"] =
        //     "Bearer ${controller.loginUser.token}";
      }
      final response = await dio.post(apiPath, data: params);

      print(
          '====================================== START RESPONSE API =========================================');
      print('API: $apiPath  \nRESPONSE: $response ------------');
      print(
          '======================================  END RESPONSE API  =========================================\n');
      return await _response(response, apiPath, param, DioMethod.post);
    } on DioError catch (error) {
      return _handleError(error, apiPath);
    }
  }

  Future<dynamic> sendGetRequest(
      String apiPath, Map<String, dynamic>? param, bool hasToken) async {
    try {
      print(
          '====================================== START GET REQUEST ==========================================');
      print('API:$apiPath \nPARAM: $param');
      print(
          '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  END GET REQUEST  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n');
      Map<String, dynamic>? params = param;
      if (hasToken) {
        //TODO: add TOKEN
        // dio.options.headers["Authorization"] =
        //     "Bearer ${controller.loginUser.token}";
      }
      final response = await dio.get(apiPath, queryParameters: params);
      print(
          '====================================== START GET RESPONSE =========================================');
      print('API: $apiPath  \nRESPONSE: $response');
      print(
          '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  END GET RESPONSE  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n');
      return await _response(response, apiPath, param, DioMethod.get);
    } on DioError catch (error) {
      return _handleError(error, apiPath);
    }
  }

  Future<dynamic> sendPutRequest(
      String apiPath, Map<String, dynamic>? param, bool hasToken) async {
    try {
      print(
          '====================================== START PUT REQUEST ==========================================');
      print('API:$apiPath \nPARAM: $param');
      print(
          '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  END PUT REQUEST  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n');
      Map<String, dynamic>? params = param;
      if (hasToken) {
        //TODO add TOKEN
        // dio.options.headers["Authorization"] =
        //     "Bearer ${controller.loginUser.token}";
      }
      final response = await dio.put(apiPath, data: params);
      print(
          '====================================== START PUT RESPONSE =========================================');
      print('API: $apiPath  \nRESPONSE: $response');
      print(
          '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  END PUT RESPONSE  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n');
      return await _response(response, apiPath, param, DioMethod.put);
    } on DioError catch (error) {
      return _handleError(error, apiPath);
    }
  }

  Future<dynamic> sendDeleteRequest(
      String apiPath, Map<String, dynamic>? param, bool hasToken) async {
    try {
      print(
          '====================================== START DEL REQUEST ==========================================');
      print('API:$apiPath \nPARAM: $param-------------');
      print(
          '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  END DEL REQUEST  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n');
      Map<String, dynamic>? params = param;
      if (hasToken) {
        //TODO add Token
        // dio.options.headers["Authorization"] =
        //     "Bearer ${controller.loginUser.token}";
      }
      final response = await dio.put(apiPath, queryParameters: params);
      print(
          '====================================== START DEL RESPONSE =========================================');
      print('API: $apiPath  \nRESPONSE: $response');
      print(
          '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  END DEL RESPONSE  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n');
      return await _response(response, apiPath, param, DioMethod.delete);
    } on DioError catch (error) {
      return _handleError(error, apiPath);
    }
  }

  Future<dynamic> uploadFile(String apiPath, String filePath) async {
    try {
      //TODO: add TOKEN
      // dio.options.headers["Authorization"] =
      //     "Bearer ${controller.loginUser.token}";
      dio.options.contentType = "multipart/form-data";
      print('------------ Request API: $apiPath-------------');
      var formData = FormData.fromMap({
        'avatarFile': await MultipartFile.fromFile(filePath, filename: 'upload')
      });
      final response = await dio.put(apiPath, data: formData);
      print(
          '------------  Response api: $apiPath - data: $response ------------');
      dio.options.contentType = "application/json";
      return await _response(response, apiPath, null, DioMethod.put);
    } on DioError catch (error) {
      dio.options.contentType = "application/json";
      return _handleError(error, apiPath);
    }
  }

  int _handleError(DioError error, String apiPath) {
    bool e = _checkConnectionError(error);
    int errorCode = ErrorCode.networkError;
    if (error.response != null) {
      if (e == false && error.response!.statusCode != null) {
        errorCode = error.response!.statusCode!;
      }
    }
    print('------data: handleError $apiPath $errorCode');

    EasyLoading.dismiss(animation: true);
    return errorCode;
  }

  dynamic _response(Response<dynamic> response, String apiPath,
      Map<String, dynamic>? param, DioMethod method) async {
    if (response.data.toString().isEmpty) {
      return response.data;
    }
    final code = response.data[APIParams.code];
    if (code == null) {
      return response.data;
    }

    EasyLoading.dismiss(animation: true);
    print('------------ Code $code');
    ErrorProcess.handleError(code);
    return code;
  }

  bool _checkConnectionError(e) {
    if (e.toString().contains('SocketException') ||
        e.toString().contains('HandshakeException')) {
      return true;
    } else {
      return false;
    }
  }
}
