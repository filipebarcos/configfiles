task :sublime do
  current_folder = File.expand_path(File.dirname(__FILE__))
  sublime_packages_folder = File.expand_path('~/Library/Application Support/Sublime Text 2/Packages')
  user_settings = Dir.glob(File.join(current_folder,"**/*"))

  user_settings.each do |filename|
    next if filename.match(/install.rake/) || File.directory?(filename)
    filename_to_be_used = filename.gsub(/.*SublimeText2\//, '')

    sym_link = File.join(sublime_packages_folder, filename_to_be_used)
    dir = sym_link.split("/")[0..-2].join("/")

    makedirs(dir) unless File.exist?(dir)

    rm_rf(sym_link) if File.symlink?(sym_link) || File.exist?(sym_link)
    ln_sf filename, sym_link
  end
end
