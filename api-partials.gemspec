$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "api/partials/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "api-partials"
  spec.version     = Api::Partials::VERSION
  spec.authors     = ["Mark VanLandingham"]
  spec.email       = ["markvanlan@gmail.com"]
  spec.homepage    = "https://github.com/brandnewbox/api-partials"
  spec.summary     = "Summary of Api::Partials."
  spec.description = "Description of Api::Partials."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.2"
  spec.add_dependency "jbuilder"
end
