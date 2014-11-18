$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "multitenant_push/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "multitenant_push"
  s.version     = MultitenantPush::VERSION
  s.authors     = ["2point0 Concepts", "Edgaras Poplavskis"]
  s.email       = ["epoplavskis@2point0concepts.com"]
  s.homepage    = "https://github.com/2point0concepts/multitenant_push"
  s.summary     = "Multitenant Push"
  s.description = "Multitenant push helps to integrate pushmeup push notifications with milia tenancy gem."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.6"

  s.add_dependency 'milia', '~>1.0'
  s.add_dependency 'pushmeup'
end
