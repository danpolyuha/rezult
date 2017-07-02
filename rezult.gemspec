# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rezult/version"

Gem::Specification.new do |spec|
  spec.name          = "rezult"
  spec.version       = RezultVersion::VERSION
  spec.authors       = ["Dan Polyuha"]
  spec.email         = ["dpolyuha@gmail.com"]

  spec.summary       = "A very lightweight gem for communication with service classes and subroutines"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/danpolyuha/rezult"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
