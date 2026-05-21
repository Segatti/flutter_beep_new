#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_beep_new.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_beep_new'
  s.version          = '1.2.0'
  s.summary          = 'Play system sounds and beep for flutter apps (no sound files)'
  s.description      = <<-DESC
Play system sounds and beep for flutter apps (no sound files).
                       DESC
  s.homepage         = 'https://github.com/Segatti/flutter_beep_new'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Segatti' => 'https://github.com/Segatti' }
  s.source           = { :path => '.' }
  s.source_files = 'flutter_beep_new/Sources/flutter_beep_new/**/*.{h,m}'
  s.public_header_files = 'flutter_beep_new/Sources/flutter_beep_new/include/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
