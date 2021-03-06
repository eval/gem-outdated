# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gem_outdated/version"

Gem::Specification.new do |s|
  s.name        = "gem-outdated"
  s.version     = GemOutdated::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Gert Goet"]
  s.email       = ["gert@thinkcreate.nl"]
  s.homepage    = ""
  s.summary     = %q{gem outdated => gem outdated STRING}
  s.description = %q{gem outdated => gem outdated STRING}

  s.rubyforge_project = "gem-outdated"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec', '~> 2.3.0'
end
