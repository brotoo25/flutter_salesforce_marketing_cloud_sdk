import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_salesforce_marketing_cloud/flutter_salesforce_marketing_cloud.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_salesforce_marketing_cloud');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    // expect(await FlutterSalesforceMarketingCloud.platformVersion, '42');
  });
}
