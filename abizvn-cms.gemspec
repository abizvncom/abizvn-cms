require_relative "lib/abizvn/cms/version"

Gem::Specification.new do |spec|
  spec.name        = "abizvn-cms"
  spec.version     = Abizvn::Cms::VERSION
  spec.authors     = [ "Juan" ]
  spec.email       = [ "juanonsoftware@gmail.com" ]
  spec.homepage    = "https://github.com/abizvncom/abizvn-cms"
  spec.summary     = "Cms"
  spec.description = "Cms System"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/abizvncom/abizvn-cms"
  spec.metadata["changelog_uri"] = "https://github.com/abizvncom/abizvn-cms"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir.glob(["app/**/*", "config/**/*", "db/**/*", "lib/**/*", "spec/**/*", "MIT-LICENSE", "Rakefile", "README.md"]).reject { |f| f.start_with?("spec/dummy/") }
  end

  spec.add_dependency "rails", "~> 7.2"
  spec.add_dependency 'commonbase', '~> 0.2'
  spec.add_dependency "abizvn-general", "~> 0.2"
  spec.add_dependency "abizvn-media", "~> 0.1"
  spec.add_dependency "jsonapi-serializer", "~> 2.2"
  spec.add_dependency 'friendly_id', '~> 5.1'

  spec.add_development_dependency 'rspec-rails', '~> 8.0'
  spec.add_development_dependency 'shoulda-matchers', '~> 6.2'
  spec.add_development_dependency "factory_bot_rails", '~> 6.4'
  spec.add_development_dependency "byebug", '~> 11.1'
end
