$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "swatches/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "swatches"
  s.version     = Swatches::VERSION
  s.authors     = ["Wyatt Greene", "Ian McLean"]
  s.homepage    = "https://github.com/dmcouncil/swatches"
  s.summary     = "This engine provides a flexible SASS color framework."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.19", "< 4.2.0"
  s.add_dependency 'sass', '~> 3.2.1'
  s.add_dependency 'sass-rails', '~> 4.0.3'

end
