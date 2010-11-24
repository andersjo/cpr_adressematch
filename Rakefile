require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
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
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

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

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "cpr_adressematch #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
