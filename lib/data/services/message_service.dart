import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/foundation.dart';
part 'message_service.freezed.dart';

@freezed
class Message<T> with _$Message {
  const factory Message.warning(String tr, {String? content}) = _Warning;

  const factory Message.error({String? content}) = _Error;

  const factory Message.success({String? content}) = _Success;

  const factory Message.networkError() = _NetworkLostConnect;

  factory Message.data({T? content}) = _Data;

  const factory Message.loading() = _Loading;

  const factory Message.loaded() = _Loaded;
}

class MessageService extends GetxService {
  final _message$ = BehaviorSubject<Message?>.seeded(null);
  late final StreamSubscription _messageSub;

  bool isShowNetworkError = false;

  Stream<dynamic> get dataStream => _message$.stream.transform(
        StreamTransformer.fromHandlers(handleData: (data, sink) {
          data?.maybeMap(
            orElse: () {},
            data: (data) {
              sink.add(data.content);
            },
          );
        }),
      );

  @override
  void onReady() {
    _messageSub = _message$.listen(
      (message) {
        message?.when(
          error: (error) {
            _showError(error);
          },
          warning: (tr, content) {
            Get.showSnackbar(
              GetSnackBar(
                message: content,
                backgroundColor: Colors.black,
                duration: Duration(milliseconds: 3000),
              ),
            );
          },
          data: (content) {
            Get.log(content.toString());
          },
          loaded: () {
            EasyLoading.dismiss();
          },
          loading: () {
            EasyLoading.show();
          },
          networkError: () {
            Future.delayed(const Duration(milliseconds: 500), () {
              _showNetworkError();
            });
          },
          success: (String? content) {
            Get.showSnackbar(
              GetSnackBar(
                message: content,
                backgroundColor: Colors.black,
                duration: Duration(milliseconds: 3000),
              ),
            );
          },
        );
      },
    );
    super.onReady();
  }

  T? data<T>() => _message$.value != null
      ? _message$.value?.maybeWhen(
          data: (data) => data as T,
          orElse: () => null,
        )
      : null;

  bool get isLoading => EasyLoading.isShow;

  @override
  void onClose() {
    _messageSub.cancel();
    super.onClose();
  }

  void send(Message message) {
    _message$.add(message);
  }

  void _showNetworkError() {
    if (isShowNetworkError) {
      return;
    }
    setVariable(isShowNetworkError);

    Get.showSnackbar(
      GetSnackBar(
        message: 'network_error'.tr,
        backgroundColor: Colors.black,
        duration: duration,
      ),
    );
  }

  bool isShowError = false;
  void _showError(String? error) {
    if (isShowError) {
      return;
    }
    setVariable(isShowError);
    Get.showSnackbar(
      GetSnackBar(
        message: error,
        backgroundColor: Colors.black,
        duration: duration,
      ),
    );
  }

  void setVariable(bool vari) {
    vari = true;
    Future.delayed(durationBack, () {
      vari = false;
    });
  }

  static int timeShowError = 3000;
  static Duration duration = Duration(milliseconds: timeShowError);
  static Duration durationBack = Duration(milliseconds: timeShowError + 50);
}
