
Pod::Spec.new do |s|
  s.name         = "HEPLog"
  s.version      = "2.0.0"
  s.summary      = "HEPLog."
  s.description  = <<-DESC
  HEPLog
                   DESC
  s.homepage     = "https://github.com/ha-minh-vuong/HEPLog.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = "Ha Minh Vuong"

  s.ios.deployment_target = "9.0"
  s.osx.deployment_target = "10.9"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/ha-minh-vuong/HEPLog.git", :tag => "#{s.version}" }

  s.source_files  = "Source/**/*.{h,m,swift}"
end
