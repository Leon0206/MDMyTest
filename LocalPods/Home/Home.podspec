#
# Be sure to run `pod lib lint CUIDemoElements.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Home'
  def self.smart_version
  tag = `git describe --abbrev=0 --tags 2>/dev/null`.strip
  if $?.success? then tag else "0.0.1" end
  end
  s.version          = '0.0.1'
  s.summary          = 'A short description of MDSwiftProject.'
  s.homepage         = 'https://github.com/Leon0206/MDSwiftProject'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Leon0206' => '63437613@qq.com' }
  s.source           = { :git => 'https://github.com/Leon0206/MDSwiftProject.git', :tag => s.version.to_s }
  s.pod_target_xcconfig = { 'GCC_PREPROCESSOR_DEFINITIONS' => '__MODULE_NAME__=\"Home\" MODULE_NAME=@\"Home\"'}
  s.ios.deployment_target = '13.0'
  s.source_files = [
    'Home.swift',
    'Classes/**/*'
  ]
  s.resource_bundles = {
    'Home' => ['Assets/**/*']
  }
  s.frameworks = 'UIKit', 'Foundation', 'MapKit'
  s.dependency 'AKOCommonToolsKit'
end
