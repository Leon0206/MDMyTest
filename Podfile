#source 'https://github.com/CocoaPods/Specs.git'
source 'https://cdn.cocoapods.org/'
source 'https://github.com/Leon0206/MDSpecs.git'

platform :ios, '15.0'
inhibit_all_warnings!
use_modular_headers!
use_frameworks! :linkage => :static

install! 'cocoapods',
        :preserve_pod_file_structure => false,
        :deterministic_uuids => false,
        :generate_multiple_pod_projects => true,
        :incremental_installation => true,
        :lock_pod_sources => false,
        :disable_input_output_paths => true

workspace 'MDSwiftProject.xcworkspace'
project 'MDSwiftProject'

target 'MDSwiftProject' do
  
  
  pod 'Programming', :path => './LocalPods/Programming', :inhibit_warnings => false
  pod 'Home', :path => './LocalPods/Home', :inhibit_warnings => false
  
#  pod 'AKOCommonToolsKit', :path => '/Users/zitao0206/Desktop/MainProject/AKOCommonToolsKit/', :inhibit_warnings => false

  # level 1
  pod 'AKOCommonToolsKit', '0.0.11'
  pod 'EasyLayout', '~> 1.0.0'
  
  # level 0-1 for Swift
  pod 'RxSwift', '6.2.0'
  pod 'RxCocoa', '6.2.0'
  pod 'Alamofire'
  
  # level 0-0 For ObjC
#  pod 'ReactiveObjC', '3.1.0'
#  pod 'TMCache', '2.1.0'
#  pod 'PINCache', '2.0'
#  pod 'SDWebImage', '4.4.2'
#  pod 'Masonry', '0.6.1'
#  pod 'JSPatch'
#  pod 'Aspects', '1.4.1'
#  pod 'SSZipArchive', '0.4.0'
#  pod 'AFNetworking','3.2.1'

  
end

