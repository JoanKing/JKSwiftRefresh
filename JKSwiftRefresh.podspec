#
# Be sure to run `pod lib lint JKSwiftRefresh.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JKSwiftRefresh'
  s.version          = '0.1.0'
  s.summary          = 'Swift版本的Refresh'
  s.description      = '这是一个对NJRefresh的封装，主要是为了在Swift里面方便使用'
  s.homepage         = 'https://github.com/JoanKing/JKSwiftRefresh'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'JoanKing' => 'chongwang27@creditease.cn' }
  s.source           = { :git => 'https://github.com/JoanKing/JKSwiftRefresh.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'JKSwiftRefresh/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JKSwiftRefresh' => ['JKSwiftRefresh/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'MJRefresh'
end
