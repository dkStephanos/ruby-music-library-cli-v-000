class MusicLibraryController

  attr_accessor :importer

  def initialize(file_path = "./db/mp3s")
    @importer = MusicImporter.new(file_path)
    @importer.import
  end


end
