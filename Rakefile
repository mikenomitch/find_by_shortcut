# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "find_by_shortcut"
  gem.homepage = "http://github.com/mikenomitch/find_by_shortcut"
  gem.license = "MIT"
  gem.summary = %Q{Faster Active Record queries in the ruby console.}
  gem.description = %Q{Allows for quick 'find_by_' calls on classes that inherit from ActiveRecord::Base. Instead of typing "find_by_attribute()" after a Class name, you can type "fb" followed by 
the first character(s) of the attribute you want to search by. If multiple attributes begin with those the characters following fb, the first will be selected. Do not add any spaces or underscores after "fb".}
  gem.email = "mikenomitch@gmail.com"
  gem.authors = ["Mike Nomitch"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
  test.rcov_opts << '--exclude "gems/*"'
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "find_by_shortcut #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
