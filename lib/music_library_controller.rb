class MusicLibraryController

  attr_accessor :importer
  
  def initialize(file_path)
    @importer = MusicImporter.new(file_path)
    
  end


end
