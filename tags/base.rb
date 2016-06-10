# Base Tag
# This writes the {{ base }} tag as the relative location of current page

module Jekyll
  class RenderRelativeBaseTag < Liquid::Tag

    def initialize(tag_name, append, tokens)
      super
      @append = append
    end

    def render(context)
      url = context.registers[:page]['url'].chomp('/').reverse.chomp('/').reverse.split('/')

      if url.length > 0 and File.extname(url[url.length-1]) != ""
        url.pop
      end

      if url.length < 1
        '.' + @append
      else
        url.map! { |i| '..' }.join('/') + @append
      end
    end
  end
end

Liquid::Template.register_tag('base', Jekyll::RenderRelativeBaseTag)