Gem::Specification.new do |s|
  s.name        = 'schemerald'
  s.version     = '0.0.5'
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
    "lib/schemerald/Lambda.rb",
    "lib/schemerald/Interpreter/Interpreter.rb",
    "lib/schemerald/Interpreter/defaults.rb",
    "lib/schemerald/Interpreter/special_forms.rb",
    "lib/schemerald/Exceptions/SchemeError.rb",
    "lib/schemerald/monkey_patching/Object.rb",
    "lib/schemerald/monkey_patching/Array.rb",
    "lib/schemerald/monkey_patching/Object.rb",
    "lib/schemerald/monkey_patching/Symbol.rb",
    "lib/schemerald/monkey_patching/NilClass.rb",
    "schemerald.gemspec"
  ]
  s.homepage    = "https://github.com/vntzy/schemerald"
  s.license       = 'MIT'

  s.add_runtime_dependency 'sxp', '>= 0.1.5'
end
