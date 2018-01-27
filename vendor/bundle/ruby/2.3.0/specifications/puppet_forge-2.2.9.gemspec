# -*- encoding: utf-8 -*-
# stub: puppet_forge 2.2.9 ruby lib

Gem::Specification.new do |s|
  s.name = "puppet_forge".freeze
  s.version = "2.2.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Puppet Labs".freeze]
  s.date = "2017-12-01"
  s.description = "Tools that can be used to access Forge API information on Modules, Users, and Releases. As well as download, unpack, and install Releases to a directory.".freeze
  s.email = ["forge-team+api@puppetlabs.com".freeze]
  s.homepage = "https://github.com/puppetlabs/forge-ruby".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Access the Puppet Forge API from Ruby for resource information and to download releases.".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday>.freeze, ["< 0.14.0", ">= 0.9.0"])
      s.add_runtime_dependency(%q<faraday_middleware>.freeze, ["< 0.13.0", ">= 0.9.0"])
      s.add_runtime_dependency(%q<semantic_puppet>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<minitar>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<gettext-setup>.freeze, ["~> 0.11"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<cane>.freeze, [">= 0"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0"])
      s.add_development_dependency(%q<redcarpet>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry-byebug>.freeze, [">= 0"])
    else
      s.add_dependency(%q<faraday>.freeze, ["< 0.14.0", ">= 0.9.0"])
      s.add_dependency(%q<faraday_middleware>.freeze, ["< 0.13.0", ">= 0.9.0"])
      s.add_dependency(%q<semantic_puppet>.freeze, ["~> 1.0"])
      s.add_dependency(%q<minitar>.freeze, [">= 0"])
      s.add_dependency(%q<gettext-setup>.freeze, ["~> 0.11"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<cane>.freeze, [">= 0"])
      s.add_dependency(%q<yard>.freeze, [">= 0"])
      s.add_dependency(%q<redcarpet>.freeze, [">= 0"])
      s.add_dependency(%q<pry-byebug>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<faraday>.freeze, ["< 0.14.0", ">= 0.9.0"])
    s.add_dependency(%q<faraday_middleware>.freeze, ["< 0.13.0", ">= 0.9.0"])
    s.add_dependency(%q<semantic_puppet>.freeze, ["~> 1.0"])
    s.add_dependency(%q<minitar>.freeze, [">= 0"])
    s.add_dependency(%q<gettext-setup>.freeze, ["~> 0.11"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<cane>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
    s.add_dependency(%q<redcarpet>.freeze, [">= 0"])
    s.add_dependency(%q<pry-byebug>.freeze, [">= 0"])
  end
end
