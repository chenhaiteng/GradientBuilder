#
# Be sure to run `pod lib lint GradientBuilder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GradientBuilder'
  s.version          = '1.2.1'
  s.summary          = 'A result builder to make create gradient easier'
# s.swift_version:begin
  s.swift_version  = '6.0.0'
  # s.swift_version    = '${SWIFT_VERSION}'

# s.platform:begin
  s.platform = :ios, '13.0'
  s.ios.deployment_target = '13.0'
  s.platform = :osx, '10.15'
  s.osx.deployment_target = '10.15'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'GradientBuilder is written with result builder. It provides a DSL(Domain Specific Language) style to create Gradient. With GradintBuilder, you can create a gradient just like swiftUI View.'

  s.homepage         = 'https://github.com/chenhaiteng/GradientBuilder'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Chen-Hai Teng' => 'chenhaiteng@gmail.com' }
  s.source           = { :git => 'https://git@github.com/chenhaiteng/GradientBuilder.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.source_files = 'Sources/GradientBuilder/**/*.swift'

  # s.resource_bundles = {
  #   'GradientBuilder' => ['GradientBuilder/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'Cocoa'

  # s.dependency 'AFNetworking', '~> 2.3'
  # parse and add dependency here
  # s.dependency:begin

end
