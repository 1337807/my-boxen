# -*- encoding: utf-8 -*-
# stub: puppetlabs_spec_helper 0.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "puppetlabs_spec_helper".freeze
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Puppet Labs".freeze]
  s.date = "2013-02-08"
  s.description = "Contains rake tasks and a standard spec_helper for running spec tests on puppet modules".freeze
  s.email = ["puppet-dev@puppetlabs.com".freeze]
  s.homepage = "http://github.com/puppetlabs/puppetlabs_spec_helper".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Standard tasks and configuration for module spec tests".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<rspec>.freeze, [">= 2.9.0"])
      s.add_runtime_dependency(%q<mocha>.freeze, [">= 0.10.5"])
      s.add_runtime_dependency(%q<rspec-puppet>.freeze, [">= 0.1.1"])
    else
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 2.9.0"])
      s.add_dependency(%q<mocha>.freeze, [">= 0.10.5"])
      s.add_dependency(%q<rspec-puppet>.freeze, [">= 0.1.1"])
    end
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 2.9.0"])
    s.add_dependency(%q<mocha>.freeze, [">= 0.10.5"])
    s.add_dependency(%q<rspec-puppet>.freeze, [">= 0.1.1"])
  end
end
