class Album
  attr_reader :id, :year, :genre, :artist
  attr_accessor :name
  @@albums = {} #hash
  @@total_rows = 0

  def initialize(name, id, year, genre, artist)
    @name = name.downcase()
    @id = id || @@total_rows += 1
    @year = year.to_i
    @genre = genre
    @artist = artist
  end

  def self.all
    @@albums.values() #array
  end

  def self.search(name)
    self.all.select{| album | album.name.include?(name.downcase)}
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.year, self.genre, self.artist)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name)
    self.name = name
    @@albums[self.id] = Album.new(self.name, self.id, self.year, self.genre, self.artist)
  end

  def delete()
    @@albums.delete(self.id)
  end
end