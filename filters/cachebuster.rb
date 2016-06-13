# Cachebuster filter
# This will add the modified time of a file to the input
# In order for it to work with apache/nginx server config
# See html5-boilerplate for the server configs

module Jekyll
  module CacheBusterFilter
    def cachebuster(input)
      config = @context.registers[:site].config

      # It will only run in production, so it wont offend offline development
      if ENV['JEKYLL_ENV'] and ENV['JEKYLL_ENV'] == "production" and config.key?('enable_cache_busting') and config['enable_cache_busting']
        # this filter assumes it is located in _plugins/common/filters
        # (or something with three levels until the source directory)
        dir = File.dirname(File.dirname(File.dirname(__dir__)))

        # This will search up the source, it expects the source to be a
        # sub directory where the _config.yml file is kept
        if config.key?('source') and config['source']
          config['source'].split('/').map { |x| dir = File.dirname(dir) }
        end

        # This will search the destination folder for the input
        # So we clean the variable for later use
        if config.key?('destination') and config['destination']
          dir = dir.chomp('/') + '/' + config['destination'].reverse.chomp('/').reverse.chomp('/')
        end

        has_dir_separator = input.start_with?('/')

        input = input.reverse.chomp('/').reverse.chomp('/')

        # check the file exists so we can actually get the modified time
        if File.file?(dir + '/' + input)
          file = input.split('.')
          ext = file.pop
          time = File.mtime(dir + '/' + input).to_i
          input = file.join('.') + '.' + time.to_s + ".#{ext}"
          has_dir_separator ? '/' + input : input
        else
          input
        end
      else
        input
      end
    end

    # This will use a global cachebuster from config and add it to files
    # so they don't have to really exist yet
    def filebuster(input)
      config = @context.registers[:site].config

      # It will only run in production, so it wont offend offline development
      if ENV['JEKYLL_ENV'] and ENV['JEKYLL_ENV'] == "production" and config.key?('file_buster') and config['file_buster']
        file = input.split('.')
        ext = file.pop
        file.join('.') + '.' + config['file_buster'].to_s + ".#{ext}"
      else
        input
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::CacheBusterFilter)