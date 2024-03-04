#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint contact_add.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'contact_add'
  s.version          = '0.0.3'
  s.summary          = 'Add contacts to Android, iOS or macOS without additional permissions.'
  s.description      = <<-DESC
Add contacts to Android, iOS or macOS without additional permissions. This is done using native views for the user to complete the contact and save it to the address book.
                       DESC
  s.homepage         = 'https://github.com/yhlbr/contact_add'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Yannick Hilber' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
