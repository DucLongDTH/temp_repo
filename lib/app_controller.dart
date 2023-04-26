import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AppController extends SuperController {
  var isUserLogined = false.obs;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    isUserLogined.value = false;
    super.onInit();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  Future<bool> isAvailableInternet() async {
    _connectionStatus = await _connectivity.checkConnectivity();
    return (_connectionStatus == ConnectivityResult.mobile ||
        _connectionStatus == ConnectivityResult.wifi ||
        _connectionStatus == ConnectivityResult.ethernet);
  }
}
