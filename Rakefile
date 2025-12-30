require "bundler/gem_tasks"
require "rake/extensiontask"
require "rspec/core/rake_task"

task :default => :spec

Rake::ExtensionTask.new('enumerable/statistics/extension')

directory 'lib/enumerable/statistics'

desc "Run test"
task :test do
  ruby("test/run-test.rb")
end
task :test => :compile

RSpec::Core::RakeTask.new(:spec)
task :spec => :compile

task :bench do
  puts "# sum\n"
  system('benchmark-driver bench/sum.yml')

  puts "# mean\n"
  system('benchmark-driver bench/mean.yml')

  puts "# variance\n"
  system('benchmark-driver bench/variance.yml')
end

task default: [:test, :spec]

release_task = Rake.application["release"]
# We use Trusted Publishing.
release_task.prerequisites.delete("build")
release_task.prerequisites.delete("release:rubygem_push")
release_task_comment = release_task.comment
if release_task_comment
  release_task.clear_comments
  release_task.comment = release_task_comment.gsub(/ and build.*$/, "")
end
