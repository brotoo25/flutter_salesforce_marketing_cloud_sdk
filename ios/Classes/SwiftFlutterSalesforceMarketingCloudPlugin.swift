import Flutter
import UIKit

public class SwiftFlutterSalesforceMarketingCloudPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_salesforce_marketing_cloud", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterSalesforceMarketingCloudPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "init":
        print("Brotinhooooooooo")
        result(FlutterMethodNotImplemented)
        break
      default:
        result(FlutterMethodNotImplemented)
    }

    print("Broto2222")
    result("iOS " + UIDevice.current.systemVersion)
  }
}
