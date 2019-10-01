# encoding: utf-8

$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'cassandra/version'

Gem::Specification.new do |s|
  s.name          = 'yugabyte-ycql-driver'
  s.version       = Cassandra::VERSION.dup
  s.authors       = ['Theo Hultberg', 'Bulat Shakirzyanov', 'Sandeep Tamhankar', 'YugaByte Development Team']
  s.email         = ['theo@iconara.net', 'bulat.shakirzyanov@datastax.com', 'sandeep.tamhankar@datastax.com', 'info@yugabyte.com']
  s.homepage      = 'https://github.com/YugaByte/cassandra-ruby-driver'
  s.summary       = 'Ruby Driver for YugaByte DB'
  s.description   = 'YugaByte Ruby Driver for YugaByte DB\'s Cassandra compatible YCQL API; derived from Datastax Ruby Driver for Apache Cassandra'
  s.license       = 'Apache-2.0'
  s.files         = Dir['lib/**/*.rb', 'README.md', '.yardopts']
  s.require_paths = %w[lib]

  s.extra_rdoc_files = ['README.md']
  s.rdoc_options << '--title' << 'Ruby Driver for YugaByte DB' << '--main' << 'README.md' << '--line-numbers'

  s.required_ruby_version = '>= 2.2.0'

  if defined?(JRUBY_VERSION)
    s.platform = 'java'
    s.files << 'lib/cassandra_murmur3.jar'
  else
    s.platform = Gem::Platform::RUBY
    s.extensions = 'ext/cassandra_murmur3/extconf.rb'
    s.files << 'ext/cassandra_murmur3/cassandra_murmur3.c'
  end

  s.add_runtime_dependency 'ione', '~> 1.2'

  s.add_development_dependency 'bundler', '~> 1.6'
  s.add_development_dependency 'rake', '~> 10.0'
end
