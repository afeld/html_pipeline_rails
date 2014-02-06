require 'html_pipeline_rails/configuration'
require 'html_pipeline_rails/handler'
require 'html_pipeline_rails/version'

require 'active_support/core_ext/module/attribute_accessors'

module HtmlPipelineRails
  mattr_accessor :configuration
  self.configuration = Configuration.new

  def self.config
    yield self.configuration
  end
end

ActionView::Template.register_template_handler(:md, :mdown, :markdown, HtmlPipelineRails::Handler.new)
