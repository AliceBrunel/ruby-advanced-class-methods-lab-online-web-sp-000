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
    self.all.sort_by {|song| song.name}
  end
  
 def self.new_from_filename(song_title)
    # Split the data into an array of individual rows.
    rows = song_title.split("\n")
    
    # For each row, let's collect a Song instance based on the data
    song_file = rows.collect do |row|
      
      # Split the row into 2 parts, artist name and title at the " - "
      data = row.split(" - ")
      artist_name = data[0]
      name = data[1]
 
      # Make a new instance
    song = self.new # self refers to the Song class. This is Song.new
      # Set the properties on the song.
      song.artist_name = artist_name
      song.name = name
    end
    song_file.join.delete_suffix!(".mp3")
  end 
  
  def self.create_from_filename
    
  end 
  
  def self.destroy_all
    all.clear
  end 
  

end
