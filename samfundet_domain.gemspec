$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "samfundet_domain/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "samfundet_domain"
  s.version     = SamfundetDomain::VERSION
  s.authors     = ["MG::Web", "Jonas Amundsen"]
  s.email       = ["mg-web@samfundet.no", "jonasba@gmail.com"]
  s.homepage    = "https://github.com/Samfundet/SamfundetDomain"
  s.summary     = "The student society of Trondheims domain models."
  s.description = "A mountable Rails engine which provides an application with the basic domain models of the student society of Trondheim."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.0.0.1"

  # jquery-rails is used by the dummy application
  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "sqlite3"
end
