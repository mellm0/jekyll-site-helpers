# BaseFilter
# Makes the passed in url relative

module Jekyll
  module BaseFilter
    def relativity(input)
      # It can either replace the {{ base }} variable
      if input.start_with?('{{ base }}/')
        url = @context.registers[:page]['url'].chomp('/').reverse.chomp('/').reverse.split('/')

        if url.length > 0 and File.extname(url[url.length-1]) != ""
          url.pop
        end

        if url.length < 1
          input.gsub('{{ base }}', '.')
        else
          input.gsub('{{ base }}', url.map! { |i| '..' }.join('/'))
        end

       # Or prefix an absolute relative
      elsif input.start_with?('/')
        url = @context.registers[:page]['url'].chomp('/').reverse.chomp('/').reverse.split('/')

        if url.length > 0 and File.extname(url[url.length-1]) != ""
          url.pop
        end

        if url.length < 1
          ".#{input}"
        else
          url.map! { |i| '..' }.join('/') + "#{input}"
        end

      # Anything else will just return the original input
      else
        input
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::BaseFilter)