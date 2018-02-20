#
# Be sure to run `pod lib lint iosutilities.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'iosutilities'
s.version          = '1.0.0'
s.summary          = 'IOs resources for totalplay developers.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
library for TotalPlay IOs developpers, this pod include some of a most used classes and objects.
DESC

s.homepage         = 'https://github.com/developersmoviletp/utilsIOS'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Juan Reynaldo Escobar Miron' => 'jrescobarmiron@gmail.com' }
s.source           = { :git => 'https://github.com/developersmoviletp/utilsIOS.git', :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '9.0'

s.source_files = 'Resources/Classes/**/*'

# s.resource_bundles = {
#   'iosutilities' => ['iosutilities/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'
# s.dependency 'AFNetworking', '~> 2.3'

s.dependency 'PKHUD', '~> 4.0'
s.dependency 'AlamofireObjectMapper', '~> 5.0'
s.dependency 'Alamofire', '~> 4.5'
s.dependency 'ActionSheetPicker-3.0'
s.dependency 'RealmSwift'

end
