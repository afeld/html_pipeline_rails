require 'html_pipeline_rails/handler'
require 'html_pipeline_rails/version'

ActionView::Template.register_template_handler(:md, HtmlPipelineRails::Handler.new)
ActionView::Template.register_template_handler(:mdown, HtmlPipelineRails::Handler.new)
ActionView::Template.register_template_handler(:markdown, HtmlPipelineRails::Handler.new)
