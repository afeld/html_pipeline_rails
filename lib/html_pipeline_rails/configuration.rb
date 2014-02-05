module HtmlPipelineRails
  class Configuration
    attr_accessor :pipeline

    def initialize
      self.reset!
    end

    def reset!
      self.pipeline = HTML::Pipeline.new([
        HTML::Pipeline::MarkdownFilter
      ])
    end
  end
end
