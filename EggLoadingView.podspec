#
# Be sure to run `pod lib lint EggLoadingView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EggLoadingView'
  s.version          = '0.1.5'
  s.summary          = 'Create Custom LoadingView.'
  s.swift_version    = '5.0'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/thanavatC/EggLoadingView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Thanavat Chaopaknam' => 'thanavat.chao@gmail.com' }
  s.source           = { :git => 'https://github.com/thanavatC/EggLoadingView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.4'
  s.source_files = ['EggLoadingView/Classes/**/*', 'EggLoadingView/Assets/**/*']
  s.dependency 'EggDeviceExt'
  s.dependency 'SwiftyGif'
end
