# -*- encoding: utf-8 -*-
# stub: syck 1.3.0 ruby lib
# stub: ext/syck/extconf.rb

Gem::Specification.new do |s|
  s.name = "syck".freeze
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0.9.5".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Hiroshi SHIBATA".freeze, "Aaron Patterson".freeze, "Mat Brown".freeze]
  s.date = "2017-05-02"
  s.description = "A gemified version of Syck from Ruby's stdlib.  Syck has been removed from\nRuby's stdlib, and this gem is meant to bridge the gap for people that haven't\nupdated their YAML yet.".freeze
  s.email = ["hsbt@ruby-lang.org".freeze, "aaron@tenderlovemaking.com".freeze]
  s.extensions = ["ext/syck/extconf.rb".freeze]
  s.extra_rdoc_files = ["CHANGELOG.rdoc".freeze, "README.rdoc".freeze]
  s.files = ["CHANGELOG.rdoc".freeze, "README.rdoc".freeze, "ext/syck/extconf.rb".freeze]
  s.homepage = "https://github.com/ruby/syck".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "2.5.2".freeze
  s.summary = "A gemified version of Syck from Ruby's stdlib".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake-compiler>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<test-unit>.freeze, [">= 0"])
      s.add_dependency(%q<rake-compiler>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 0"])
    s.add_dependency(%q<rake-compiler>.freeze, [">= 0"])
  end
end
