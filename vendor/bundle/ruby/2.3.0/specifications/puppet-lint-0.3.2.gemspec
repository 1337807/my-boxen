# -*- encoding: utf-8 -*-
# stub: puppet-lint 0.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "puppet-lint".freeze
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tim Sharpe".freeze]
  s.date = "2012-10-19"
  s.description = "Checks your Puppet manifests against the Puppetlabs\n  style guide and alerts you to any discrepancies.".freeze
  s.email = "tim@sharpe.id.au".freeze
  s.executables = ["puppet-lint".freeze]
  s.files = ["bin/puppet-lint".freeze]
  s.homepage = "https://github.com/rodjek/puppet-lint/".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Ensure your Puppet manifests conform with the Puppetlabs style guide".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_development_dependency(%q<rcov>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<rdoc>.freeze, [">= 0"])
      s.add_dependency(%q<rcov>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_dependency(%q<rcov>.freeze, [">= 0"])
  end
end
