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
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
    gem.name = "cpr_adressematch"
    gem.summary = %Q{Interface for generating and parsing the Danish CPR Registry data files}
    gem.description = %Q{Interface for generating and parsing the Danish CPR Registry data files.
    Support the 'adressematch' protocol, which can be used to query by name and adress as well as
    by the personal identifical number (CPR)
    }
    gem.email = "anders@johannsen.com"
    gem.homepage = "http://github.com/andersjo/cpr_adressematch"
    gem.authors = ["Anders Johannsen"]
    gem.files = FileList['lib/**/*.rb', 'bin/*', '[A-Z]*', 'test/**/*'].to_a
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new



require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

desc "Generate classes from XML definition"
task :generate do
  $: << "./lib"
  require 'cpr_adressematch'
  require 'cpr/class_generator'
  g = Cpr::ClassGenerator.new("adressematch", "data/adressematch.xml")
  g.generate
end

task :test => :check_dependencies

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "cpr_adressematch2 #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
