# -*- encoding: utf-8 -*-
# stub: sequent 8.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sequent".freeze
  s.version = "8.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Lars Vonk".freeze, "Bob Forma".freeze, "Erik Rozendaal".freeze, "Mike van Diepen".freeze, "Stephan van Diepen".freeze]
  s.date = "1980-01-01"
  s.description = "Sequent is a CQRS and event sourcing framework for Ruby.".freeze
  s.email = ["lars.vonk@gmail.com".freeze, "bforma@zilverline.com".freeze, "erozendaal@zilverline.com".freeze, "mvdiepen@zilverline.com".freeze, "stephan@vandiepen.info".freeze]
  s.executables = ["sequent".freeze]
  s.files = ["bin/sequent".freeze]
  s.homepage = "https://github.com/zilverline/sequent".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.2".freeze)
  s.rubygems_version = "3.4.19".freeze
  s.summary = "Event sourcing framework for Ruby".freeze

  s.installed_by_version = "3.4.19" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<activemodel>.freeze, [">= 7.1.3"])
  s.add_runtime_dependency(%q<activerecord>.freeze, [">= 7.1.3"])
  s.add_runtime_dependency(%q<bcrypt>.freeze, ["~> 3.1"])
  s.add_runtime_dependency(%q<csv>.freeze, ["~> 3.3"])
  s.add_runtime_dependency(%q<gli>.freeze, ["~> 2.22"])
  s.add_runtime_dependency(%q<i18n>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<logger>.freeze, ["~> 1.6"])
  s.add_runtime_dependency(%q<oj>.freeze, ["~> 3.3"])
  s.add_runtime_dependency(%q<parallel>.freeze, ["~> 1.20"])
  s.add_runtime_dependency(%q<parser>.freeze, [">= 2.6.5", "< 3.4"])
  s.add_runtime_dependency(%q<pg>.freeze, ["~> 1.2"])
  s.add_runtime_dependency(%q<postgresql_cursor>.freeze, ["~> 0.6"])
  s.add_runtime_dependency(%q<thread_safe>.freeze, ["~> 0.3.6"])
  s.add_runtime_dependency(%q<tty-prompt>.freeze, ["~> 0.23.1"])
  s.add_runtime_dependency(%q<tzinfo>.freeze, [">= 1.1"])
  s.add_development_dependency(%q<prop_check>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<pry>.freeze, ["~> 0.13"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.10"])
  s.add_development_dependency(%q<rspec-collection_matchers>.freeze, ["~> 1.2"])
  s.add_development_dependency(%q<rspec-mocks>.freeze, ["~> 3.10"])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.68.0"])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.21"])
  s.add_development_dependency(%q<timecop>.freeze, ["~> 0.9"])
end
