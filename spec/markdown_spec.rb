require 'spec_helper'

describe "markdown views" do
  before do
    setup_view_instance
  end

  it "inline rendering" do
    template = '# A Heading'
    result = @view.render(inline: template, type: :md)
    expect(result).to eq('<h1>A Heading</h1>')
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
    template = '<%= 1 + 1 %>'
    result = @view.render(inline: template, type: :md)
    # not sure why it gets wrapped...
    expect(result).to eq('<p>2</p>')
  end
end
