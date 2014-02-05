require 'minitest/spec'

require 'action_view'
require_relative '../lib/html_pipeline_rails'

describe "markdown views" do
  def setup
    @view = ActionView::Base.new
    @view.view_paths << File.join(File.dirname(__FILE__), 'templates')
  end

  it "inline rendering" do
    template = '# A Heading'
    result = @view.render(inline: template, type: :md)
    result.must_equal('<h1>A Heading</h1>')
  end

  it "doesn't affect normal HTML rendering" do
    template = '# A Heading'
    result = @view.render(inline: template)
    result.must_equal(template)
  end

  it "renders external templates" do
    result = @view.render('simple_md')
    result.must_equal("<h1>A Heading</h1>")
  end

  it "doesn't affect normal external HTML templates" do
    result = @view.render('fake_md')
    result.must_equal("# Fake Heading\n")
  end

  it "interprets ERB" do
    template = '<%= 1 + 1 %>'
    result = @view.render(inline: template, type: :md)
    # not sure why it gets wrapped...
    result.must_equal('<p>2</p>')
  end
end
