require 'minitest/spec'

require 'action_view'
require_relative '../lib/html_pipeline_rails'

describe "markdown views" do
  def setup
    @view = ActionView::Base.new
  end

  it "inline rendering" do
    template = '# A Heading'
    result = @view.render inline: template, type: :md
    result.must_equal('<h1>A Heading</h1>')
  end

  it "doesn't affect normal HTML rendering" do
    template = '# A Heading'
    result = @view.render inline: template
    result.must_equal(template)
  end
end
