require 'rubygems'
require 'rake'

require 'rake/gempackagetask'
spec = Gem::Specification.new do |s|
  s.name             = 'fancy_errors'
  s.version          = '1.1.0'
  s.has_rdoc         = false
  s.extra_rdoc_files = %w(README.rdoc)
  s.rdoc_options     = %w(--main README.rdoc)
  s.summary          = "Make your ActiveRecord::Errors fancy"
  s.author           = 'Dean Strelau'
  s.email            = 'dean@mintdigital.com'
  s.homepage         = 'http://mintdigital.github.com/fancy_errors'
  s.files            = %w(README.rdoc Rakefile) + Dir.glob("{lib,test,rails}/**/*")
  
  s.add_development_dependency('jeremymcanally-context', '> 0.5.0')
  s.add_development_dependency('mhennemeyer-matchy', '> 0.3.0')
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = false
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |t|
    t.libs << "test"
    t.test_files = FileList['test/*_test.rb']
    t.verbose = true
    end
  rescue
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

desc 'Generate the gemspec to serve this Gem from Github'
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, 'w') {|f| f << spec.to_ruby }
  puts "Created gemspec: #{file}"
end


task :default => :test
