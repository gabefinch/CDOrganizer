class CD
  attr_reader(:album, :artist, :user, :id)
  @@all = []
  @@current_user = ""
  @@search_results = []

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

  define_singleton_method(:set_user) do |login|
    @@current_user = login
  end
  define_singleton_method(:logout) do
    @@current_user = ""
  end

  define_singleton_method(:get_user) do
    @@current_user
  end

  define_singleton_method(:get_results) do
    @@search_results
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
    search_results = found_cds
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
