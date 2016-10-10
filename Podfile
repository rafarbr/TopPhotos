source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target 'TopPhotos' do

    pod 'BothamUI', '~> 1.0'
    pod 'Alamofire', '~> 3.5.1'
    pod 'AlamofireImage', '~> 2.5.0'
    pod 'SwiftyJSON', '~> 2.4.0'

    target 'TopPhotosTests' do
        pod 'Nimble', '~> 4.1.0'
        pod 'KIF', '~> 3.0', :configurations => ['Debug']
    end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '2.3'
    end
  end
end
