Pod::Spec.new do |s|
  s.name             = 'UISliderTwoSide'
  s.version          = '0.0.1'
  s.summary          = 'UISliderTwoSide is a Slider. by : farhad faramarzi'


  s.homepage         = 'https://github.com/farhad1985/UISliderTwoSide'
  s.author           = { 'Farhad Faramarzi' => 'farhad.public@gmail.com' }
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.source           = { :git => 'https://github.com/farhad1985/UISliderTwoSide.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.source_files = 'UISliderTwoSide/*', "UISliderTwoSide/**/*.{swift,h,m}"
  s.exclude_files = "UISliderTwoSide/**/*.plist"
  s.swift_version = '4.2'

end
