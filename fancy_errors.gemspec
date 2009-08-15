# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fancy_errors}
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dean Strelau"]
  s.date = %q{2009-08-15}
  s.email = %q{dean@mintdigital.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "lib/fancy_errors.rb", "test/fancy_errors_helper_test.rb", "test/fancy_errors_test.rb", "test/helper.rb", "rails/init.rb"]
  s.homepage = %q{http://mintdigital.github.com/fancy_errors}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Make your ActiveRecord::Errors fancy}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<jeremymcanally-context>, ["> 0.5.0"])
      s.add_development_dependency(%q<mhennemeyer-matchy>, ["> 0.3.0"])
    else
      s.add_dependency(%q<jeremymcanally-context>, ["> 0.5.0"])
      s.add_dependency(%q<mhennemeyer-matchy>, ["> 0.3.0"])
    end
  else
    s.add_dependency(%q<jeremymcanally-context>, ["> 0.5.0"])
    s.add_dependency(%q<mhennemeyer-matchy>, ["> 0.3.0"])
  end
end
