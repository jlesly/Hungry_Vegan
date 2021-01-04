require_relative 'lib/hungry_vegan/version'

Gem::Specification.new do |spec|
  spec.name          = "hungry_vegan"
  spec.version       = HungryVegan::VERSION
  spec.authors       = ["Lesly"]
  spec.email         = ["leslyj2@gmail.com"]

  spec.summary       = "Vegan food finder"
  spec.description   = "Simple CLI app helps users find vegan food by typing in their zip code"
  spec.homepage      = "https://github.com/jlesly/hungry_vegan"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/jlesly/hungry_vegan'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jlesly/hungry_vegan"
  spec.metadata["changelog_uri"] = "https://github.com/jlesly/hungry_vegan"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "http"
  spec.add_dependency "dotenv"
  spec.add_dependency "colorize"
end

