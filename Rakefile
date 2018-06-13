require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'

PuppetLint.configuration.send('disable_relative_classname_inclusion')

desc "Run puppet in noop mode and check for syntax errors."
task :validate do
  Dir['manifests/**/*.pp'].each do |manifest|
    sh "puppet parser validate --noop #{manifest}"
  end
  Dir['spec/**/*.rb','lib/**/*.rb'].each do |ruby_file|
    sh "ruby -c #{ruby_file}" unless ruby_file =~ /spec\/fixtures/
  end
  Dir['templates/**/*.erb'].each do |template|
    sh "erb -P -x -T '-' #{template} | ruby -c"
  end
  :lint
end
