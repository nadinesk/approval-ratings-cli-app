# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'approval_ratings/version'

Gem::Specification.new do |spec|
  spec.authors       = ["Avi Flombaum"]
  spec.email         = ["avi@learn.co"]
  spec.description   = %q{Movies playing}
  spec.summary       = %q{Movies playing}
  spec.homepage      = "https://learn.co"

  spec.files         = `git ls-files`.split($\)
  spec.executables   = ["now-playing"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.name          = "now-playing-cli-gem"
  spec.require_paths = ["lib", "lib/now_playing"]
  spec.version       = NowPlaying::VERSION
  spec.license       = "MIT"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
