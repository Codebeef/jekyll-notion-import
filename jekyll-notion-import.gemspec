# frozen_string_literal: true

require_relative "lib/jekyll-notion-import/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-notion-import"
  spec.version       = Jekyll::NotionImport::VERSION
  spec.authors       = ["Matt Hall"]
  spec.email         = ["matt@codebeef.com"]
  spec.summary       = "Import posts from notion"
  spec.description   = "Import posts from notion"
  spec.homepage      = "https://github.com/codebeef/jekyll-notion-import"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").grep(%r!^lib/!)
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.4.0"

  spec.add_dependency "jekyll", ">= 3.7", "< 5.0"
  spec.add_dependency "notion_to_md"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop-jekyll", "~> 0.5"
  spec.add_development_dependency "webmock", "~> 3.18.1"
end
