require "pry"

class MusicLibraryController

  attr_accessor :importer

  def initialize(file_path = "./db/mp3s")
    @importer = MusicImporter.new(file_path)
    @importer.import
  end

  def call
    puts("To list all of your songs, enter 'list songs'.")
    puts("Welcome to your music library!")
    puts("To list all of the artists in your library, enter 'list artists'.")
    puts("To list all of the genres in your library, enter 'list genres'.")
    puts("To list all of the songs by a particular artist, enter 'list artist'.")
    puts("To list all of the songs of a particular genre, enter 'list genre'.")
    puts("To play a song, enter 'play song'.")
    puts("To quit, type 'exit'.")
    puts("What would you like to do?")
    input = gets
    while input != "exit"
      puts("To list all of your songs, enter 'list songs'.")
      puts("Welcome to your music library!")
      puts("To list all of the artists in your library, enter 'list artists'.")
      puts("To list all of the genres in your library, enter 'list genres'.")
      puts("To list all of the songs by a particular artist, enter 'list artist'.")
      puts("To list all of the songs of a particular genre, enter 'list genre'.")
      puts("To play a song, enter 'play song'.")
      puts("To quit, type 'exit'.")
      puts("What would you like to do?")
      input = gets
    end
  end

  def list_songs
    Song.all.sort! {|song1, song2| song1.name <=> song2.name}
    binding.pry
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.description}"
    end
  end



end
