Pod::Spec.new do |s|

  s.name         = "ArrowedTabBarViewController"
  s.version      = "1.0.1"
  s.summary      = "ArrowedTabBarViewController is an nice animated UITabBarController."
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.homepage = "https://www.facebook.com/profile.php?id=100004234983243"

  s.license = { :type => 'MIT', :file => 'LICENSE' }

  s.author = { "VoidStudio" => "voidstudiomain@gmail.com" }

  s.source = { :git => "https://github.com/ihorrapalyuk/ArrowedTabBarViewController.git", :tag => "1.0.1"}

  s.source_files  = "Classes/**/*.{swift,storyboard,xib}"

  s.framework  = "UIKit"

end
