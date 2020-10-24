platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

def common
  pod 'RxSwift' 
  pod 'RxCocoa'
  pod 'RxRealm'
  pod 'RealmSwift'
  pod 'Alamofire', '~> 5.1'
  pod 'Firebase'
  pod 'Firebase/Messaging'
  pod 'Firebase/Crashlytics'
  pod 'PureLayout'
  pod 'MarqueeLabel'
  pod 'ISEmojiView'
  pod 'Giphy'
  pod 'GoogleWebRTC'
  pod 'PusherSwift'
  pod 'SwiftyStoreKit'
end

def shared
  pod 'KeychainSwift'
end

target 'TestCo' do
  common
  shared
  pod 'LanguagesManager'
  pod 'lottie-ios'
  pod 'TransitionButton'
  pod 'CropViewController'
  pod 'NVActivityIndicatorView'
end

target 'TestCoTests' do
  common
  pod 'RxBlocking'
end

target 'TestCoUITests' do
  common
  pod 'RxBlocking'
end