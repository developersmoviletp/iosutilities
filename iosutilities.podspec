
Pod::Spec.new do |s|
s.name             = 'iosutilities'
s.version          = '1.0.2'
s.summary          = 'IOs resources for totalplay developers.'

s.description      = <<-DESC
library for TotalPlay IOs developpers, this pod include some of a most used classes and objects.
DESC

s.homepage         = 'https://github.com/developersmoviletp/iosutilities'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Juan Reynaldo Escobar Miron' => 'jrescobarmiron@gmail.com' }
s.source           = { :git => 'https://github.com/developersmoviletp/iosutilities.git', :tag => s.version.to_s }

s.ios.deployment_target = '9.0'

s.source_files = 'Resources/Classes/**/*'

s.dependency 'PKHUD'
s.dependency 'AlamofireObjectMapper'
s.dependency 'Alamofire'
s.dependency 'ActionSheetPicker-3.0'
s.dependency 'RealmSwift'
s.dependency 'CryptoSwift'

end
