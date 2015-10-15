require 'rake/testtask'
require 'bundler'
Bundler.require

task :test do
  Dir.glob('./test/**/*_test.rb') { |file| require file } # two asterisks say any folder under test
end
