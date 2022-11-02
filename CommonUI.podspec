#
# Be sure to run `pod lib lint CommonUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CommonUI'
  s.version          = '0.1.2'
  s.summary          = 'Common UI layer.'
  
  s.homepage         = 'https://github.com/htmlprogrammist/CommonUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'htmlprogrammist' => '60363270+htmlprogrammist@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/htmlprogrammist/CommonUI.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'

  s.source_files = 'CommonUI//**/*.{swift}'
end
