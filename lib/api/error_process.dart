import 'package:flutter/material.dart';
import 'package:ionmobile/constants/api_contants.dart';

class ErrorProcess {
  static handleError(double error) {
    debugPrint('=========================================== handleError $error');
    if (error == ErrorCode.connectServer || error == ErrorCode.serverError) {
      
    }

    if (error == ErrorCode.maintain) {
     
    }

    if (error == ErrorCode.networkError) {
     
    }
  }
}
