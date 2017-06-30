class MP3Importer
    attr_accessor :path
    attr_reader :files

    def initialize(filepath)
        @path = filepath
        @files = []
        Dir[@path + "/*"].each do |file|
            normalized_name = file.gsub(@path + "/", "")
            @files << normalized_name
        end
    end

    def import
        @files.each do |file|
            Song.new(file)
        end        
    end


end
