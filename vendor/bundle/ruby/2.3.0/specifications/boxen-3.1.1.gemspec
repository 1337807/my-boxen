# -*- encoding: utf-8 -*-
# stub: boxen 3.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "boxen".freeze
  s.version = "3.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jacob Bednarz".freeze]
  s.date = "2017-12-08"
  s.description = "Manage Mac development boxes with love (and Puppet).".freeze
  s.email = ["jacob.bednarz@gmail.com".freeze]
  s.homepage = "https://github.com/boxen/boxen".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "You know, for laptops and stuff.".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ansi>.freeze, ["~> 1.4"])
      s.add_runtime_dependency(%q<hiera>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<highline>.freeze, ["~> 1.6.0"])
      s.add_runtime_dependency(%q<json_pure>.freeze, ["< 2.0", ">= 1.7.7"])
      s.add_runtime_dependency(%q<librarian-puppet>.freeze, ["~> 2.2"])
      s.add_runtime_dependency(%q<octokit>.freeze, [">= 2.7.1", "~> 2.7"])
      s.add_runtime_dependency(%q<puppet>.freeze, ["~> 3.7"])
      s.add_development_dependency(%q<minitest>.freeze, ["= 4.4.0"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 0.13"])
    else
      s.add_dependency(%q<ansi>.freeze, ["~> 1.4"])
      s.add_dependency(%q<hiera>.freeze, ["~> 1.0"])
      s.add_dependency(%q<highline>.freeze, ["~> 1.6.0"])
      s.add_dependency(%q<json_pure>.freeze, ["< 2.0", ">= 1.7.7"])
      s.add_dependency(%q<librarian-puppet>.freeze, ["~> 2.2"])
      s.add_dependency(%q<octokit>.freeze, [">= 2.7.1", "~> 2.7"])
      s.add_dependency(%q<puppet>.freeze, ["~> 3.7"])
      s.add_dependency(%q<minitest>.freeze, ["= 4.4.0"])
      s.add_dependency(%q<mocha>.freeze, ["~> 0.13"])
    end
  else
    s.add_dependency(%q<ansi>.freeze, ["~> 1.4"])
    s.add_dependency(%q<hiera>.freeze, ["~> 1.0"])
    s.add_dependency(%q<highline>.freeze, ["~> 1.6.0"])
    s.add_dependency(%q<json_pure>.freeze, ["< 2.0", ">= 1.7.7"])
    s.add_dependency(%q<librarian-puppet>.freeze, ["~> 2.2"])
    s.add_dependency(%q<octokit>.freeze, [">= 2.7.1", "~> 2.7"])
    s.add_dependency(%q<puppet>.freeze, ["~> 3.7"])
    s.add_dependency(%q<minitest>.freeze, ["= 4.4.0"])
    s.add_dependency(%q<mocha>.freeze, ["~> 0.13"])
  end
end
