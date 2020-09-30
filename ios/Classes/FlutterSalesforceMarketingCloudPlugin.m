#import "FlutterSalesforceMarketingCloudPlugin.h"
#if __has_include(<flutter_salesforce_marketing_cloud/flutter_salesforce_marketing_cloud-Swift.h>)
#import <flutter_salesforce_marketing_cloud/flutter_salesforce_marketing_cloud-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_salesforce_marketing_cloud-Swift.h"
#endif

@implementation FlutterSalesforceMarketingCloudPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterSalesforceMarketingCloudPlugin registerWithRegistrar:registrar];
}
@end
