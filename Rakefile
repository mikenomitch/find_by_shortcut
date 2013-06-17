#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'
require 'rails'
 
Rake::TestTask.new do |t|
  t.libs << 'lib/find_by_shortcut'
  t.test_files = FileList['test/lib/find_by_shortcut/*_test.rb']
  t.verbose = true
end
 
task :default => :test