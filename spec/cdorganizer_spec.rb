require('rspec')
require('pry')
require('cdorganizer')

describe(CD) do

  describe('#new') do
    it("initializes the instance variables") do
      who = Artist.new("The Who")
      cd = CD.new({:album => "Tommy", :artist => who, :user => "Jay"})
      expect(cd.album).to(eq("Tommy"))
      who = Artist.new("The Who")
      cd2 = CD.new({:album => "Who's Next", :user => "Jay"})
      expect(cd2.album).to(eq("Who's Next"))
    end
  end

  describe('.search_for_cds') do
    it("returns a list of cds that match input artist and/or input album") do
      CD.clear()
      tommy = CD.new({:album => "Tommy", :artist => Artist.new("The Who"), :user => "Jay"})
      wall = CD.new({:album => "The Wall", :artist => Artist.new("Pink Floyd"), :user => "Jay"})
      help = CD.new({:album => "H.E.L.P.", :artist => Artist.new("The Beatles"), :user => "Gabe"})
      whos_next = CD.new({:album => "Who's Next", :artist => Artist.new("The Who"), :user => "Gabe"})
      expect(CD.search_for_cds({:artist => "The Who", :album => "Tommy"})).to(eq([tommy]))
      expect(CD.search_for_cds({:artist => "The Who"})).to(eq([tommy, whos_next]))
      expect(CD.search_for_cds({:album => "Tommy"})).to(eq([tommy]))
      expect(CD.search_for_cds({})).to(eq([tommy, wall, help, whos_next]))
    end
  end


  describe('.search_with_id') do
    it("returns the unique cd related to the id arguement") do
      CD.clear()
      tommy = CD.new({:album => "Tommy", :artist => Artist.new("The Who"), :user => "Jay"})
      wall = CD.new({:album => "The Wall", :artist => Artist.new("Pink Floyd"), :user => "Jay"})
      help = CD.new({:album => "H.E.L.P.", :artist => Artist.new("The Beatles"), :user => "Gabe"})
      whos_next = CD.new({:album => "Who's Next", :artist => Artist.new("The Who"), :user => "Gabe"})
      expect(CD.search_with_id(1)).to(eq(tommy))
      expect(CD.search_for_cds({:artist => "The Who"})).to(eq([tommy, whos_next]))
      expect(CD.search_for_cds({:album => "Tommy"})).to(eq([tommy]))
      expect(CD.search_for_cds({})).to(eq([tommy, wall, help, whos_next]))
    end
  end

end

describe(Artist) do
  describe('#new') do
    it("creates instance, sets @name correctly") do
      who = Artist.new("The Who")
      expect(who.name).to(eq("The Who"))
    end
  end
end
