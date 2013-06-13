$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple-settings/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple-settings"
  s.version     = SimpleSettings::VERSION
  s.authors     = ["Alex Smith"]
  s.email       = ["aosmith@gmail.com"]
  s.homepage    = "http://alexsmith.io"
  s.summary     = "A gem to easily handle environment specific settings"
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
end
