# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smileback/version'

Gem::Specification.new do |spec|
  spec.name          = 'smileback'
  spec.version       = Smileback::VERSION
  spec.authors       = ['Kevin Pheasey']
  spec.email         = ['kevin@mspcfo.com']

  spec.summary       = %q{An API v3 wrapper for smileback with OmniAuth OAuth2 strategy}
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/kpsoftware/smileback'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth', '>= 1.2', '< 3'
  spec.add_runtime_dependency 'omniauth-oauth2', '>= 1.0', '< 3'
  spec.add_runtime_dependency 'oauth2', '>= 1.4', '< 2'
  spec.add_runtime_dependency 'httparty', '~> 0.13'

  spec.add_development_dependency 'bundler', '~> 2.2'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
