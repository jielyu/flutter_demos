#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint d0010_opencv.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'd0010_opencv'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'

  s.library = 'c++'
  s.vendored_libraries = 'opencv-4.5.4/lib/*.a'
  s.xcconfig = { 
    'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/../../../macos/opencv-4.5.4/include/opencv4"',
    'LIBRARY_SEARCH_PATHS' => '"${PODS_ROOT}/../../../macos/opencv-4.5.4/lib"',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'ONLY_ACTIVE_ARCH' => 'YES',
  }
end
