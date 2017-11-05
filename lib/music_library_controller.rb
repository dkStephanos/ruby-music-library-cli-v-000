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
    Song.all.each_with_index do |song, index|
      puts "#{index + 1}. #{song.description}"
    end
  end

  def list_artists
    Artist.all.sort! {|artist1, artist2| artist1.name <=> artist2.name}
    Artist.all.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort! {|genre1, genre2| genre1.name <=> genre2.name}
    Genre.all.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets
    selected_artist = Artist.all.detect { |artist| artist.name == artist_name }
    selected_artist.songs.sort! {|song1, song2| song1.name <=> song2.name}
    selected_artist.songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.description}"
    end
  end  

end
