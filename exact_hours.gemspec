# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exact_hours/version'

Gem::Specification.new do |spec|
  spec.name          = "exact_hours"
  spec.version       = ExactHours::VERSION
  spec.authors       = ["Pim Snel"]
  spec.email         = ["pim@lingewoud.nl"]
  spec.summary       = %q{CLI utility for Exact Online}
  spec.description   = %q{CLI Utility working with Exact Online. converts hours to CVS}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "simplecov", "~> 0.10"
  spec.add_development_dependency "minitest", "~> 5.1"

  spec.add_runtime_dependency "thor", "~> 0.19"
  spec.add_runtime_dependency "text-table", "~> 1.2"
end
