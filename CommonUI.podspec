Pod::Spec.new do |s|
  s.name             = 'CommonUI'
  s.version          = '0.2.4'
  s.summary          = 'Common UI layer.'
  s.homepage         = 'https://github.com/iCookbook/CommonUI'
  s.author           = { 'htmlprogrammist' => '60363270+htmlprogrammist@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/iCookbook/CommonUI.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'

  s.source_files = 'CommonUI/**/*.{swift}'
  
  s.dependency 'Resources'
  s.dependency 'Models'
  s.dependency 'Networking'
end
