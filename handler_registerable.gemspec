require File.expand_path('../lib/handler_registerable/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "handler_registerable"
  spec.version       = HandlerRegisterable::VERSION
  spec.authors       = %q{Sage One Development Team}
  spec.email         = %q{support@sageone.com}
  spec.summary       = %q{A gem to provide handler registry functionality}
  spec.description   = %q{A gem to provide handler registry functionality}
  spec.homepage      = "https://www.github.com/Sage/handler_registerable"
  spec.license       = "Apache-2.0"

  spec.files         = Dir['lib/**/*']
  spec.test_files    = Dir['spec/**/*.rb']
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'fudge'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'cane'
  spec.add_development_dependency 'flay'
  spec.add_development_dependency 'flog'
  spec.add_development_dependency 'yard'
end
