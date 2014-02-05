Gem::Specification.new do |s|
  s.name        = 'schemerald'
  s.version     = '0.0.3'
  s.date        = '2014-02-05'
  s.summary     = "(scheme? yes no)"
  s.description = "A Scheme interpreter in Ruby"
  s.authors     = ["Ventsislav Velkov"]
  s.email       = 'vntzyv@gmail.com'
  s.files       = [
    "README.md",
    "LICENSE.txt",
    "Gemfile",
    "bin/schemerald",
    "lib/schemerald.rb",
    "lib/schemerald/Cons.rb",
    "lib/schemerald/Environment.rb",
    "lib/schemerald/monkey_patching.rb",
    "lib/schemerald/Lambda.rb",
    "lib/schemerald/Interpreter.rb",
    "schemerald.gemspec"
  ]
  s.homepage    = "http://rubygems.org/gems/schemerald"
  s.license       = 'MIT'

  s.add_dependency "sxp", ">= 0.1.5"
end