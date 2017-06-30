class Song
    attr_accessor :name, :artist, :title
    
    @@all = []

    def initialize(name)
        @name = name
        @title = get_title_from_name(name)
        artist_name = get_artist_from_name(name)
        @artist = Artist.find_or_create_by_name(artist_name)
        @artist.add_song(self)
        @@all << self
        self
    end

    def get_artist_from_name(name)
        name.split(" - ")[0]
    end

    def get_title_from_name(name)
        name.split(" - ")[1]
    end

    def self.new_by_filename(name)
        new_instance = self.new(name)
        new_instance.name = new_instance.title
        new_instance
    end
end