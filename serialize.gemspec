# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'serialize'
  s.version = '0.1.1.1'
  s.summary = 'Common interface for serialization and deserialization, and serializer discovery'
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/serialize'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.3.3'

  s.add_development_dependency 'test_bench'
end
