require 'spec_helper'

describe HtmlPipelineRails::Configuration do
  describe '#reset' do
    let(:config) { HtmlPipelineRails::Configuration.new }

    it "sets the pipeline to the default" do
      config.pipeline = HTML::Pipeline.new([
        HTML::Pipeline::MarkdownFilter,
        HTML::Pipeline::MentionFilter
      ])
      config.reset!
      expect(config.pipeline.filters).to eq([HTML::Pipeline::MarkdownFilter])
    end
  end
end
