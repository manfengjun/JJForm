platform :ios, '9.0'
use_frameworks!
target 'JJForm' do
    pod 'SnapKit', '~> 4.0.0'
end
swift_4_1_pod_targets = ['SnapKit']

post_install do | installer |
    installer.pods_project.targets.each do |target|
        if swift_4_1_pod_targets.include?(target.name)
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.1'
            end
        end
    end
end
