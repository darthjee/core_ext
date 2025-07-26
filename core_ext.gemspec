# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'darthjee/core_ext/version'

Gem::Specification.new do |gem|
  gem.name                  = 'darthjee-core_ext'
  gem.version               = Darthjee::CoreExt::VERSION
  gem.authors               = ['Darthjee']
  gem.email                 = ['darthjee@gmail.com']
  gem.summary               = 'Core Extensions'
  gem.homepage              = 'https://github.com/darthjee/core_ext'
  gem.description           = 'Extension of basic classes with usefull methods'
  gem.required_ruby_version = '>= 3.3.1'

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.add_dependency 'activesupport', '~> 7.x'

  gem.metadata['rubygems_mfa_required'] = 'true'
end
