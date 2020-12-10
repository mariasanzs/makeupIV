require 'rspec/core/rake_task'

desc " Para instalar las dependencias con Bundler"

task :installdeps do
  exec "bundle install"
end

desc "Para ejecutar el test"

RSpec::Core::RakeTask.new(:test) do |t|
  t.pattern = "./spec/testMakeUpIV.rb"
end

RSpec::Core::RakeTask.new(:test_app) do |t|
  t.pattern = "./spec/testMyapp.rb"
end
