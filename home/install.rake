task :linkables do
  linkables_dir = File.expand_path("#{File.dirname(__FILE__)}/linkables/")
  home = File.expand_path("~")
  dot_files = Dir.glob(File.join(linkables_dir,"*"))

  dot_files.each do |filename|
    sym_link = File.join(home,".#{File.basename(filename)}")
    rm_rf(sym_link) if File.symlink?(sym_link) || File.exist?(sym_link)
    ln_sf filename, sym_link
  end
end

task :runnables do
  runnables_files = Dir.glob(File.join(File.expand_path("#{File.dirname(__FILE__)}/runnables"), "*"))
  runnables_files.each do |filename|
    system "#{filename}"
  end
end

task :activate_home do
  Rake::Task[:linkables].invoke
  Rake::Task[:runnables].invoke
end
