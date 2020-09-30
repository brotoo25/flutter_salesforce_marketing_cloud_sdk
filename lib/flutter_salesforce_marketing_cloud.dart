
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterSalesforceMarketingCloud {
  static const MethodChannel _channel =
      const MethodChannel('flutter_salesforce_marketing_cloud');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
