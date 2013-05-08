import 'home/install.rake'
import 'SublimeText2/install.rake'
task :default => :activate

desc 'symlink files into home directory'
task :activate do
  Rake::Task[:activate_home].invoke
  #Rake::Task[:activate_sublime].invoke
end
