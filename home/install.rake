task :activate_home do
  current_folder = File.expand_path("#{File.dirname(__FILE__)}")
  home = File.expand_path("~")
  dot_files = Dir.glob(File.join(current_folder,"*"))

  dot_files.each do |filename|
    next if filename.match(/install.rake/)

    sym_link = File.join(home,".#{File.basename(filename)}")

    rm_rf(sym_link) if File.symlink?(sym_link) || File.exist?(sym_link)
    ln_s filename, sym_link
  end
end
