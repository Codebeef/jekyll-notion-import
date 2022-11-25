# frozen_string_literal: true

module Jekyll
  module Commands
    class NotionImportCommand < Command
      def self.init_with_program(prog)
        prog.command(:notion_import) do |c|
          c.syntax "notion_import"
          c.description "Imports posts from notion"

          options.each { |opt| c.option(*opt) }

          c.action { |args, options| process(args, options) }
        end
      end

      def self.options
        []
      end

      def self.process(args = [], options = {})
        config = Jekyll.configuration(options)

        Jekyll::NotionImport::Import.perform(config:)
      end
    end
  end
end
