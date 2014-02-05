require 'action_view/test_case'

class MarkdownTest < ActionView::TestCase
  def test_inline_rendering
    template = '# A Heading'
    result = '<h1>A Heading</h1>'

    render inline: template, type: :md

    assert_equal(result, rendered)
  end
end
