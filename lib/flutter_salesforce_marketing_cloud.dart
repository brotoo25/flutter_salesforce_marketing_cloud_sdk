import 'dart:async';

import 'package:flutter/services.dart';

class FlutterSalesforceMarketingCloud {
  static const MethodChannel _channel =
      const MethodChannel('flutter_salesforce_marketing_cloud');

  static Future<void> init(
    String mid,
    String appId,
    String accessToken,
    String fcmSenderId,
  ) async {
    await _channel.invokeMethod('init', <String, String>{
      'mid': mid,
      'fcm_sender_id': appId,
      'mc_access_token': appId,
      'mc_application_id': appId,
    });
  }
}
