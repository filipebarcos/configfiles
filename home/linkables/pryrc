Pry.config.editor = "vim"

Pry.config.prompt do |obj, level, _|
	prompt = ""
	prompt << "#{Rails.version}@" if defined?(Rails)
	prompt << "#{RUBY_VERSION}"
	"#{prompt} (#{obj})>"
end