# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'feint/version'

Gem::Specification.new do |spec|
  spec.name          = "feint"
  spec.version       = Feint::VERSION
  spec.authors       = ["shelling"]
  spec.email         = ["navyblueshellingford@gmail.com"]

  spec.summary       = %q{A Presenter Layer for ORM(s)}
  spec.description   = %q{A Presenter Layer for ORM(s)}
  spec.homepage      = "https://github.com/shelling/feint"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "pg"
  spec.add_development_dependency "mysql2"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "mongoid"
end
