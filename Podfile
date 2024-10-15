# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared_pods
	pod 'Firebase/Core'
	pod 'Firebase/Auth'
	pod 'IQKeyboardManagerSwift'
	pod 'Firebase/Firestore'
	pod 'Kingfisher', '~> 4.0'
	pod 'CodableFirebase'
end

target 'SellMyArt' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SellMyArt
	shared_pods
	pod 'Stripe'
	pod 'Alamofire'

end

target 'sellMyArtAdmin' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for sellMyArtAdmin
	shared_pods
	pod 'CropViewController'
end
