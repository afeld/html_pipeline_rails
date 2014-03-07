require 'spec_helper'

describe "markdown views" do
  before do
    setup_view_instance
  end

  def render_md(template)
    @view.render(inline: template, type: :md)
  end

  def expect_rendered(template)
    result = render_md(template)
    expect(result)
  end

  it "inline rendering" do
    expect_rendered('# A Heading').to eq('<h1>A Heading</h1>')
  end

  it "doesn't affect normal HTML rendering" do
    template = '# A Heading'
    result = @view.render(inline: template)
    expect(result).to eq(template)
  end

  it "renders external templates" do
    result = @view.render('simple_md')
    expect(result).to eq("<h1>A Heading</h1>")
  end

  it "doesn't affect normal external HTML templates" do
    result = @view.render('fake_md')
    expect(result).to eq("# Fake Heading\n")
  end

  it "interprets ERB" do
    # not sure why it gets wrapped...
    expect_rendered('<%= 1 + 1 %>').to eq('<p>2</p>')
  end

  it "interprets Markdown passed through ERB tags" do
    expect_rendered('<%= "# The Title" %>').to eq('<h1>The Title</h1>')
  end

  it "uses the configured pipeline" do
    HtmlPipelineRails.config do |c|
      c.pipeline = HTML::Pipeline.new([
        HTML::Pipeline::MarkdownFilter,
        HTML::Pipeline::MentionFilter
      ])
    end

    expect_rendered('@afeld').to eq('<p><a href="/afeld" class="user-mention">@afeld</a></p>')
  end

  it "inline rendering with mdown extension" do
    template = '# A Heading'
    result = @view.render(inline: template, type: :mdown)
    expect(result).to eq('<h1>A Heading</h1>')
  end

  it "inline rendering with markdown extension" do
    template = '# A Heading'
    result = @view.render(inline: template, type: :markdown)
    expect(result).to eq('<h1>A Heading</h1>')
  end
end
