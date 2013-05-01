import 'home/install.rake'
task :default => :activate

desc 'symlink files into home directory'
task :activate do
  Rake::Task[:activate_home].invoke
end
