# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'game_of_life/version'

Gem::Specification.new do |spec|
  spec.name          = 'conways_game_of_life'
  spec.version       = GameOfLife::VERSION
  spec.authors       = ['aravind99']
  spec.email         = ['aravind@classpro.in']
  spec.summary       = 'Conway\'s Game of Life implemented in ruby'
  spec.homepage      = 'https://github.com/Aravind99/conways_game_of_life'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_path  = ['lib']
  spec.bindir        = 'bin'
  spec.executables   = ['conways_game_of_life']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
