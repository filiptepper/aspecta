# encoding: utf-8

$:.push File.expand_path("../lib", __FILE__)
require "aspecta/version"

Gem::Specification.new do |s|
  s.name        = "aspecta"
  s.version     = Aspecta::VERSION
  s.authors     = ["Filip Tepper"]
  s.email       = ["filip@tepper.pl"]
  s.homepage    = "http://github.com/filiptepper/aspecta"
  s.summary     = %q{image dimensions ActiveRecord validator for carrierwave gem}
  s.description = %q{image dimensions ActiveRecord validator for carrierwave gem}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "activemodel"
  s.add_development_dependency "carrierwave"
  s.add_dependency "fastimage"
end