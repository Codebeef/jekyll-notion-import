# frozen_string_literal: true

RSpec.describe(Jekyll::Commands::NotionImportCommand) do
  let(:posts_dir) { Pathname.new source_dir("_posts") }

  before(:all) do
    FileUtils.mkdir_p source_dir unless File.directory? source_dir
    Dir.chdir source_dir
  end

  context "importing posts" do
  end
end
