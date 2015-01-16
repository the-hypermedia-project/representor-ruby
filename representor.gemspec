# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'representor/version'

Gem::Specification.new do |s|
  s.name          = 'representor'
  s.version       = Representor::VERSION
  s.date          = Time.now.strftime('%Y-%m-%d')
  s.authors       = ['Mark W. Foster']
  s.email         = ['fosrias@gmail.com']
  s.summary       = 'Making Hypermedia accessible to the Ruby masses.'
  s.homepage      = 'http://github.com/the-hypermedia-project/representor-ruby'
  s.license       = 'MIT'

  s.description   = <<-DESC
    Making the generation and consumption of Hypermedia messages for multiple media types accessible to the Ruby masses.
  DESC

  s.files         = Dir['lib/**/*.rb']
  s.require_paths = ['lib']
  s.executables   = s.files.grep(/^bin\//) { |f| File.basename(f) }

  s.add_dependency('rake')
end
