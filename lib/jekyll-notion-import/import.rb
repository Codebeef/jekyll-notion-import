# frozen_string_literal: true

module Jekyll
  module NotionImport
    class Import
      def self.perform(...)
        new(...).tap(&:perform)
      end

      def initialize(config:)
        @config = config["notion"] || {}
      end

      def perform
        return unless notion_token? && config?

        config["databases"].each do |database_config|
          database = Database.new(config: database_config)

          database.fetch.each do |page|
            Post.new(
              collection_name: database.collection_name,
              page: page
            ).import
          end
        end
      end

      private

      attr_reader :config
  
      def notion_token?
        return true unless ENV["NOTION_TOKEN"].blank?
  
        Jekyll.logger.warn("Jekyll Notion Import:",
                           "NOTION_TOKEN not provided. Cannot read from Notion.")
        false
      end
  
      def config?
        return true unless config.empty?
  
        Jekyll.logger.warn("Jekyll Notion:", "No config provided.")
        false
      end
    end
  end
end