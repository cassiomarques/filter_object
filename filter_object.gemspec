# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "filter_object/version"

Gem::Specification.new do |s|
  s.name        = "filter_object"
  s.version     = FilterObject::VERSION
  s.authors     = ["Cássio Marques"]
  s.email       = ["cassiommc@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Create objects to handle filter logic and clean up your controllers}
  s.description = %q{You can use filter_object to write classes whose instances encapsulate your filter logic, so you can have testable code and cleaner controllers}

  s.rubyforge_project = "filter_object"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
