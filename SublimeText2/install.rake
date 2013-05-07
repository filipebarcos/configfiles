task :activate_sublime do
  current_folder = File.expand_path(File.dirname(__FILE__))
  #sublime_settings_folder = File.expand_path("~")
  sublime_settings_folder = File.expand_path('~/Library/Application Support/Sublime Text 2/Packages/User')
  user_settings = Dir.glob(File.join(current_folder,"*"))


  user_settings.each do |filename|
    next if filename.match(/install.rake/)

    sym_link = File.join(sublime_settings_folder, File.basename(filename))

    rm_rf(sym_link) if File.symlink?(sym_link) || File.exist?(sym_link)
    ln_sf filename, sym_link
  end
end
