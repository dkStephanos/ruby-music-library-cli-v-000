require_relative "concerns/findable.rb"

class Song

  attr_accessor :name, :artist, :data, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def self.create(name)
    Song.new(name).tap do |song|
      song.save
    end
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self) unless @genre.songs.include?(self)
  end

  def artist_name
    if @artist
      self.artist.name
    else
      nil
    end
  end

  def save
    if !@@all.include?(self)
      @@all << self
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end





  def self.new_from_filename(file_name)
    @data = file_name.rpartition(".")
    @data = @data[0].split(" - ")
    find_or_create_by_name(@data[1]).tap do |song|
      song.artist = Artist.find_or_create_by_name(@data[0])
      song.artist.add_song(song)
      song.genre = Genre.find_or_create_by_name(@data[2])
    end
  end

  def self.create_from_filename(file_name)
    @data = file_name.rpartition(".")
    @data = @data[0].split(" - ")
    song = self.find_by_name(@data[0])
    if song != nil
      Song.new_from_filename(file_name)
    end
    song
  end
end
