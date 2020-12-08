#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_salesforce_marketing_cloud.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_salesforce_marketing_cloud'
  s.version          = '0.0.1'
  s.summary          = 'Flutter SalesForce Marketing Cloud SDK Plugin'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/brotoo25'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Broto Tech' => 'brotoo25@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'MarketingCloudSDK', '~> 7.2'
  s.platform = :ios, '10.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'
end
