pod 'REFrostedViewController', '~> 2.4.5'
pod 'PixateFreestyle', '~> 2.1.2'
pod 'ROADFramework', '~> 1.3.2'
pod 'SDWebImage', '~> 3.6'

post_install do |installer|
    require File.expand_path('ROADConfigurator.rb', './Pods/libObjCAttr/libObjCAttr/Resources/')
    ROADConfigurator::post_install(installer)
end
