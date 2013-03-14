# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'glimpse/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "glimpse-rails"
  spec.version       = Glimpse::Rails::VERSION
  spec.authors       = ["Jerry Cheung"]
  spec.email         = ["jollyjerry@gmail.com"]
  spec.description   = %q{glimpse profiling plugin for Rails}
  spec.summary       = %q{glimpse profiling plugin for Rails}
  spec.homepage      = "https://github.com/jch/glimpse-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
