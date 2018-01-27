# -*- encoding: utf-8 -*-
# stub: puppet 3.8.7 ruby lib

Gem::Specification.new do |s|
  s.name = "puppet".freeze
  s.version = "3.8.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Puppet Labs".freeze]
  s.date = "2016-04-25"
  s.description = "Puppet, an automated configuration management tool".freeze
  s.email = "info@puppetlabs.com".freeze
  s.executables = ["puppet".freeze]
  s.files = ["bin/puppet".freeze]
  s.homepage = "https://github.com/puppetlabs/puppet".freeze
  s.rdoc_options = ["--title".freeze, "Puppet - Configuration Management".freeze, "--main".freeze, "README.md".freeze, "--line-numbers".freeze]
  s.rubyforge_project = "puppet".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Puppet, an automated configuration management tool".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<facter>.freeze, ["< 3", "> 1.6"])
      s.add_runtime_dependency(%q<hiera>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<json_pure>.freeze, [">= 0"])
    else
      s.add_dependency(%q<facter>.freeze, ["< 3", "> 1.6"])
      s.add_dependency(%q<hiera>.freeze, ["~> 1.0"])
      s.add_dependency(%q<json_pure>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<facter>.freeze, ["< 3", "> 1.6"])
    s.add_dependency(%q<hiera>.freeze, ["~> 1.0"])
    s.add_dependency(%q<json_pure>.freeze, [">= 0"])
  end
end
