# -*- encoding: utf-8 -*-
# stub: hiera 1.3.4 ruby lib

Gem::Specification.new do |s|
  s.name = "hiera".freeze
  s.version = "1.3.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Puppet Labs".freeze]
  s.date = "2014-06-06"
  s.description = "A pluggable data store for hierarcical data".freeze
  s.email = "info@puppetlabs.com".freeze
  s.executables = ["hiera".freeze]
  s.files = ["bin/hiera".freeze]
  s.homepage = "https://github.com/puppetlabs/hiera".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Light weight hierarchical data store".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json_pure>.freeze, [">= 0"])
    else
      s.add_dependency(%q<json_pure>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<json_pure>.freeze, [">= 0"])
  end
end
