class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
    
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end 
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.each do |song|
      puts song
    end
  end 
  
  def self.new_from_filename(song_title)
    # Split the data into an array of individual rows.
    rows = song_title.split("\n")
    # For each row, let's collect a Person instance based on the data
    song = rows.collect do |row|
      # Split the row into 2 parts, artist name, title at the " - "
      data = row.split(" - ")
      artist = data[0]
      title = data[1]
 
      # Make a new instance
      song_file = self.new # self refers to the Person class. This is Person.new
      # Set the properties on the person.
      song_file.artist = artist
      song_file.title = title
      #return the song
      person
    end
  end 
  
  def self.create_from_filename
  end 
  
  def self.destroy_all
    all.clear
  end 
  

end
