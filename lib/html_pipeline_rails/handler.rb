require 'html/pipeline'

module HtmlPipelineRails
  class Handler
    def default_format
      :html
    end

    def call(template)
      compiled_source = self.class.erb.call(template)

      <<-END
        pipeline = HTML::Pipeline.new([
          HTML::Pipeline::MarkdownFilter
        ])
        result = pipeline.call(begin;#{compiled_source};end)
        result[:output].to_s
      END
    end

    def self.erb
      @erb ||= ActionView::Template.registered_template_handler(:erb)
    end
  end
end
