# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cake_lang/version'

Gem::Specification.new do |spec|
  spec.name          = "cake_lang"
  spec.version       = CakeLang::VERSION
  spec.authors       = ["Benny1992"]
  spec.email         = ["klotz.benjamin@yahoo.de"]
  spec.summary       = %q{CakeLang}
  spec.description   = %q{CakeLang is just a language for learning purpose (ragel && racc)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = File.read(File.expand_path('../MANIFEST', __FILE__)).split("\n")

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'racc'
  spec.add_dependency 'ast'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
