// ignore_for_file: avoid_print
import 'package:ionmobile/api/app_dio.dart';
import 'package:ionmobile/constants/api_contants.dart';


class ApiWebserver {
  final AppDio _appDio = AppDio();
  static final ApiWebserver shared = ApiWebserver._internal();
  ApiWebserver._internal();

  Future<bool> login() async {
    print('------------ Login Call');
    // Map<String, dynamic> params = {
    //   APIParams.email: email,
    //   APIParams.password: password,
    //   APIParams.api: APICons.login,
    // };
    final response =
        await _appDio.sendPostRequest('https://api-myntq-dev.ntq.solutions/news/categories/all', null, false);
    //   User.fromJson(response.data);
    // final loginUser =
    //     BaseModel<User>.fromJson(response.data, (data) => User.fromJson(data as Map<String, dynamic>));
    return true;
  }

}
