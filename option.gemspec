# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'option/version'

Gem::Specification.new do |spec|
  spec.name          = "option"
  spec.version       = Option::VERSION
  spec.authors       = ["Jonathan Schwietert"]
  spec.email         = ["jonathan.schwietert@gmail.com"]
  spec.summary       = %q{Wrap that nil in something more explicit.}
  spec.description   = %q{Modeled after Scala's Option type that eliminates null checks - for us the unknown of nil.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~>3.4'
end
