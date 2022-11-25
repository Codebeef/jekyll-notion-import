# frozen_string_literal: true

module Jekyll
  module NotionImport
    class Post
      def initialize(collection_name:, page:)
        @page = page
        @collection_name = collection_name
      end

      def import
        unless Dir.exist?(collection_directory)
          Jekyll.logger.info("Jekyll Notion Import:", "Create #{collection_directory}")
          FileUtils.mkdir_p(collection_directory)
        end


        if file_exists?
          file_last_updated = DateTime.parse(YAML.load(File.read(path))["last_edited_time"])

          return if file_last_updated >= page.last_edited_time
        end
            
        Jekyll.logger.info("Jekyll Notion Import:", "Import #{file_name}")

        write_file
      end

      def write_file
        File.open(path, "w") do |f|
          f.puts(front_matter)
          f.puts(page.body)
        end
      end

      def file_exists?
        File.exists?(path)
      end

      def file_name
        @filename ||= "#{publish_date.strftime("%Y-%m-%d")}-#{Jekyll::Utils.slugify(page.title)}.md"
      end

      def publish_date
        @publish_date ||= Date.parse(page.props["published"])
      end

      def path
        @path ||= File.join(collection_directory, file_name)
      end

      def collection_directory
        @collection_directory ||= "_#{collection_name}"        
      end

      def front_matter
        @front_matter ||= YAML.dump(
          page.props.transform_values {|v| v.is_a?(DateTime) ? v.iso8601 : v}
        ) + "---\n\n"
      end

      private

      attr_reader :page, :collection_name
    end
  end
end