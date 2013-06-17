# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'find_by_shortcut/version'

Gem::Specification.new do |spec|
  spec.name          = "find_by_shortcut"
  spec.version       = FindByShortcut::VERSION
  spec.authors       = ["Mike Nomitch", "Erik Nomitch"]
  spec.email         = ["mikenomitch@gmail.com"]
  spec.description   = %Q{Shortcuts for Active Record queries in the ruby console.}
  spec.summary       = %Q{Allows for quick 'find_by_' calls on classes that inherit from ActiveRecord::Base. Instead of typing "find_by_attribute()" after a Class name, you can type "fb" followed by 
the first character(s) of the attribute you want to search by. If multiple attributes begin with those the characters following fb, the first will be selected. Do not add any spaces or underscores after "fb".}
  spec.homepage      = "https://github.com/mikenomitch/find_by_shortcut"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails"
end
