# frozen_string_literal: true

module Jekyll
  module NotionImport
    class Database
      def initialize(config: {})
        @notion = Notion::Client.new
        @config = config
      end

      def id
        config["id"]
      end

      # Returns an empty array or a NotionToMd:Page array
      def fetch
        return [] unless id?

        @fetch ||= notion.database_query(query)[:results].map do |page|
          page = NotionToMd::Page.new(:page => page, :blocks => build_blocks(page.id))
        end
      end

      def filter
        config["filter"]
      end

      def sorts
        if config["sort"]
          Jekyll.logger.warn("Jekyll Notion:", "sort property is deprecated, use sorts instead")
        end
        config["sorts"]
      end

      def collection_name
        config["collection"] || "posts"
      end

      def data_name
        config["data"]
      end

      private

      attr_reader :config, :notion

      def query
        { :database_id => id, :filter => filter, :sorts => sorts }.compact
      end

      def id?
        if id.nil? || id.empty?
          Jekyll.logger.warn("Jekyll Notion:",
                             "Database or page id is not provided. Cannot read from Notion.")
          return false
        end
        true
      end

      def build_blocks(block_id)
        NotionToMd::Blocks.build(block_id: block_id) do |nested_id|
          @notion.block_children({ :block_id => nested_id })
        end
      end
    end
  end
end