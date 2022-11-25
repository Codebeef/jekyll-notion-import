# frozen_string_literal: true

require "notion"
require "notion_to_md"

require "jekyll-notion-import/version"
require "jekyll-notion-import/database"
require "jekyll-notion-import/post"
require "jekyll-notion-import/import"
require "jekyll/commands/notion_import.rb"

Notion.configure do |config|
  config.token = ENV["NOTION_TOKEN"]
end

module Jekyll
  module NotionImport
  end
end