require 'minitest/spec'

require 'action_view/test_case'
require_relative '../lib/html_pipeline_rails'

class MarkdownTest < ActionView::TestCase
  test "inline rendering" do
    template = '# A Heading'
    result = '<h1>A Heading</h1>'

    render inline: template, type: :md

    result.must_equal(rendered)
  end
end
