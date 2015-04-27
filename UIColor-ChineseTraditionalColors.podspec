Pod::Spec.new do |s|
  s.name         = "UIColor-ChineseTraditionalColors"
  s.version      = "0.0.1"
  s.summary      = "A swift extension that extends UIColor with a list of Chinese traditional colors."
  s.description  = <<-DESC
                  A swift extension that extends UIColor with a list of Chinese traditional colors from http://ylbook.com/cms/web/chuantongsecai/chuantongsecai.htm
                   DESC
  s.homepage     = "https://github.com/zhxnlai/UIColor-ChineseTraditionalColors"
  s.screenshots  = "https://github.com/zhxnlai/UIColor-ChineseTraditionalColors/raw/master/Previews/1.png"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Zhixuan Lai" => "zhxnlai@gmail.com" }
  s.social_media_url   = "http://twitter.com/ZhixuanLai"

  s.ios.deployment_target = '8.0'

  s.source       = { :git => "https://github.com/zhxnlai/UIColor-ChineseTraditionalColors.git", :tag => "0.0.1" }
  s.source_files = 'UIColor+ChineseTraditionalColors/*.swift'
  s.framework  = "UIKit"
  s.requires_arc = true
end
