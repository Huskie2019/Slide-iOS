# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'Slide for Reddit' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  # Pods for Slide for Reddit

  pod 'reddift', :git =>  'https://github.com/ccrama/reddift'
  pod 'SDWebImage', '~>3.8'
  pod 'ChameleonFramework'
  pod 'XLPagerTabStrip', '~> 6.0'
  pod 'AMScrollingNavbar'
pod "BGTableViewRowActionWithImage"
  pod 'XLActionController'
  pod 'MHVideoPhotoGallery', :git => 'https://github.com/ccrama/MHVideoPhotoGallery’
  pod 'SideMenu'
  pod ‘UZTextView’, :git => ‘https://github.com/sonsongithub/UZTextView'
pod 'InAppSettingsKit'

  target 'Slide for RedditTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Slide for RedditUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
  end