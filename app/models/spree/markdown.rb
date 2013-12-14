module Spree
  module Markdown
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    def self.renderer
      @renderer ||= ::Redcarpet::Markdown.new(::Redcarpet::Render::HTML, 
        :autolink => true, 
        :space_after_headers => true,
        :fenced_code_blocks => true)
    end
    
    module ClassMethods
      def render_as_markdown(*args)
        args.each do |arg|
          define_method("rendered_#{arg}") do
            Markdown.renderer.render(self.send(arg)).html_safe
          end
        end
      end
    end
  end
end
