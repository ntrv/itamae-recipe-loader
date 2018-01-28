# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae/recipe_loader/version'

Gem::Specification.new do |spec|
  spec.name          = 'itamae-recipe-loader'
  spec.version       = Itamae::RecipeLoader::VERSION
  spec.authors       = ['ntrv']
  spec.email         = ['hydrangea56@me.com']
  spec.summary       = 'Get out recipe names from itamae for using serverspec.'
  spec.description   = 'Get out recipe names from itamae for using serverspec.'
  spec.homepage      = 'https://github.com/ntrv/itamae-recipe-loader'
  spec.license       = 'Apache'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_dependency 'itamae'
end
