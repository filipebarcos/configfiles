import 'home/home.rake'
import 'SublimeText2/sublimetext.rake'
task :default => :activate

desc 'symlink files into home directory'
task :link do
  Rake::Task[:linkable].invoke
  Rake::Task[:sublime].invoke
end

task :install do
  Rake::Task[:runnable].invoke
end

task :activate do
  Rake::Task[:install].invoke
  Rake::Task[:link].invoke
end
