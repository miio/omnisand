$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "omnisand/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "omnisand"
  s.version     = Omnisand::VERSION
  s.authors     = ["miio mitani"]
  s.email       = ["info@miio.info"]
  s.homepage    = "https://github.com/miio/omnisand.git"
  s.summary     = "Simple Devise + Omniauth Bridge Engine"
  s.description = "Simple Devise + Omniauth Bridge Engine"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency 'devise', '3.2.2'
  s.add_dependency 'devise-encryptable', '0.1.2'
  s.add_dependency 'omniauth', '1.2.1'
  s.add_dependency 'omniauth-facebook', '1.6.0'
  s.add_dependency 'omniauth-twitter', '1.0.1'
  s.add_dependency 'omniauth-github', '1.1.1'

  s.add_development_dependency "sqlite3"
end
