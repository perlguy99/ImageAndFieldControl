#
#  Be sure to run `pod spec lint PickAndChoose.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

spec.platform              = :ios
spec.ios.deployment_target = '11.0'
spec.name                  = "ImageAndFieldControl"
spec.summary               = "A set of controls with an image and input area."
spec.requires_arc          = true

spec.version               = "1.0.2"

spec.license               = { :type => "MIT", :file => "LICENSE" }

spec.homepage              = "https://github.com/perlguy99/ImageAndFieldControl"

spec.author                = { "Brent Michalski" => "Brent.Michalski@gmail.com" }
spec.social_media_url      = "https://twitter.com/Perlguy2"

spec.source                = { :git => "https://github.com/perlguy99/ImageAndFieldControl.git", :tag => "#{spec.version}" }

spec.framework             = "UIKit"
spec.dependency 'DateToolsSwift'
spec.dependency 'FontAwesome.swift'

spec.source_files          = "ImageAndFieldControl/**/*.{swift}"

# 9
spec.resources             = "ImageAndFieldControl/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# 10
spec.swift_version         = "4.2"

  spec.description  = <<-DESC
A simple set of input controls that have an image on the left,
which can utilize FontAwesome images, and then an input area on
the right.  The input area can be configured so that if you tap
on it, a picker will pop up.
                   DESC

end
