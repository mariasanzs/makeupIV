require 'rspec/core/rake_task'

desc " Para realizar la construcción del proyecto"

task :build do

end

desc " Para instalar las dependencias con Bundler"

task :install do
  exec "bundle install"
end

desc "Para ejecutar el test"

RSpec::Core::RakeTask.new(:test) do |t|
  t.pattern = "./spec/test*.rb"
end
