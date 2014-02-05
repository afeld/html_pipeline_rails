require 'minitest/spec'
require 'action_view'

require_relative '../lib/html_pipeline_rails'

def setup_view_instance
  @view = ActionView::Base.new
  @view.view_paths << File.join(File.dirname(__FILE__), 'templates')
end
