# -*- encoding: utf-8 -*-
# stub: librarian-puppet 2.2.3 ruby lib

Gem::Specification.new do |s|
  s.name = "librarian-puppet".freeze
  s.version = "2.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tim Sharpe".freeze, "Carlos Sanchez".freeze]
  s.date = "2016-04-21"
  s.description = "Simplify deployment of your Puppet infrastructure by\n  automatically pulling in modules from the forge and git repositories with\n  a single command.".freeze
  s.email = ["tim@sharpe.id.au".freeze, "carlos@apache.org".freeze]
  s.executables = ["librarian-puppet".freeze]
  s.files = ["bin/librarian-puppet".freeze]
  s.homepage = "https://github.com/voxpupuli/librarian-puppet".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.0".freeze)
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Bundler for your Puppet modules".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<librarianp>.freeze, [">= 0.6.3"])
      s.add_runtime_dependency(%q<rsync>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<puppet_forge>.freeze, ["~> 2.1"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<cucumber>.freeze, [">= 0"])
      s.add_development_dependency(%q<aruba>.freeze, ["< 0.8.0"])
      s.add_development_dependency(%q<puppet>.freeze, ["~> 4.1.0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5"])
      s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0.9.0"])
    else
      s.add_dependency(%q<librarianp>.freeze, [">= 0.6.3"])
      s.add_dependency(%q<rsync>.freeze, [">= 0"])
      s.add_dependency(%q<puppet_forge>.freeze, ["~> 2.1"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<cucumber>.freeze, [">= 0"])
      s.add_dependency(%q<aruba>.freeze, ["< 0.8.0"])
      s.add_dependency(%q<puppet>.freeze, ["~> 4.1.0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5"])
      s.add_dependency(%q<mocha>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0.9.0"])
    end
  else
    s.add_dependency(%q<librarianp>.freeze, [">= 0.6.3"])
    s.add_dependency(%q<rsync>.freeze, [">= 0"])
    s.add_dependency(%q<puppet_forge>.freeze, ["~> 2.1"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<cucumber>.freeze, [">= 0"])
    s.add_dependency(%q<aruba>.freeze, ["< 0.8.0"])
    s.add_dependency(%q<puppet>.freeze, ["~> 4.1.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5"])
    s.add_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0.9.0"])
  end
end
