# -*- encoding: utf-8 -*-
# stub: jquery-timepicker-rails 1.4.3 ruby lib

Gem::Specification.new do |s|
  s.name = "jquery-timepicker-rails"
  s.version = "1.4.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Tanguy Krotoff (jQuery plugin by Jon Thornton)", "Fabio Cantoni"]
  s.date = "2014-07-19"
  s.description = "A jQuery timepicker plugin inspired by Google Calendar"
  s.email = ["tkrotoff@gmail.com"]
  s.homepage = "https://github.com/cover/jquery-timepicker-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "jquery-timepicker packaged for the Rails 3.1+ asset pipeline"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<railties>, [">= 3.1.0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1.0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
