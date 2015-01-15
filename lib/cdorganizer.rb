class CD
  attr_reader(:album, :artist, :user, :id)
  @@all = []
  define_method(:initialize) do |attributes|
    @album = attributes[:album]
    @artist = attributes[:artist]
    @user = attributes[:user]
    @id = @@all.length() + 1
    @@all.push(self)
  end
  define_singleton_method(:clear) do
    @@all = []
  end


  define_singleton_method(:search_for_cds) do |attributes|
    found_cds = []
    search_album = attributes[:album]
    search_artist = attributes[:artist]
    search_user = attributes[:user]

    @@all.each do |cd|
      if(cd.artist().name() == search_artist) || nil == search_artist
        if(cd.album() == search_album) || nil == search_album
          if(cd.user() == search_user) || nil == search_user
            found_cds.push(cd)
          end
        end
      end
    end
    found_cds
  end


  define_singleton_method(:all) do
    @@all
  end
end

class Artist
  attr_reader(:name)
  @@all_artists = []
  define_method(:initialize) do |name|
    @name = name
  end
end
