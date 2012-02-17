# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{capistrano-git-plugins}
  s.version = "0.0.15"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Moran"]
  s.date = %q{2012-02-16}
  s.description = %q{Plugins to support capistrano-git deployments}
  s.email = %q{ryan.moran@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".idea/encodings.xml",
    ".idea/misc.xml",
    ".idea/modules.xml",
    ".idea/vcs.xml",
    ".rvmrc",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "capistrano-git-plugins.gemspec",
    "lib/capistrano/git/plugins/airbrake.rb",
    "lib/capistrano/git/plugins/bundler.rb",
    "lib/capistrano/git/plugins/deploy_reporter.rb",
    "lib/capistrano/git/plugins/hoptoad.rb",
    "lib/capistrano/git/plugins/kill_resque_workers.rb",
    "lib/capistrano/git/plugins/new_relic.rb",
    "test/helper.rb",
    "test/test_capistrano-git-plugins.rb"
  ]
  s.homepage = %q{https://github.com/RevolutionPrep/capistrano-git-plugins}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{Plugins to support capistrano-git deployments}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
    else
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    end
  else
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
  end
end

