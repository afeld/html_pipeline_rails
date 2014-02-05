# HTML::Pipeline for Rails [![Build Status](https://travis-ci.org/afeld/html_pipeline_rails.png?branch=master)](https://travis-ci.org/afeld/html_pipeline_rails)

Adds support for rendering views via [HTML::Pipeline](https://github.com/jch/html-pipeline) in Rails.  [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown) in your Rails app!

## Installation

Add this line to your Gemfile:

```ruby
gem 'html_pipeline_rails'
```

and then run:

    $ bundle

All views ending in `.md` will then be rendered as HTML.  Otherwise, they act the same as normal `.html.erb` files.  Cool, eh?

## Customization

By default, `.md` views will run through ERB, and then the `MarkdownFilter` pipeline.  You can customize the render pipeline like so:

```ruby
# config/initializers/html_pipeline.rb
HtmlPipelineRails.config do |c|
  c.pipeline = HTML::Pipeline.new([
    HTML::Pipeline::MarkdownFilter,
    HTML::Pipeline::MentionFilter
  ])
end
```

In this case, `@mention`s will now be converted to links.  See [the HTML::Pipeline documentation](https://github.com/jch/html-pipeline#usage) to learn about the different options.

## Contributing

Run tests with:

```bash
bundle
# then
bundle exec rspec
# or
bundle exec guard
```
