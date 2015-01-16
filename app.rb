require('sinatra')
require('./lib/cdorganizer')
require('sinatra/reloader')
also_reload('lib/**/*.rb')

get('/') do
  CD.logout()
  erb(:index)
end

get('/home') do
  if params['user'] == nil
    @user = CD.get_user()
  else
    @user = params['user']
  end
  CD.set_user(@user)
  @list = CD.search_for_cds({:user => @user})
  erb(:home)
end


post('/album_add') do
  @album = params['album']
  @artist = params['artist']
  @user = CD.get_user()
  CD.new({:album => @album, :artist => Artist.new(@artist), :user => @user})
  redirect('/home')
end

get('/detail/:id') do
  @id = params["id"]
  @cd_info = CD.search_with_id(@id)
  erb(:detail)
end

post('/search_for_CD') do
  @album = params['album']
  @artist = params['artist']
  if params['album'].==("")
    @album = nil
  end
  if params['artist'].==("")
    @artist = nil
  end
  @list = CD.search_for_cds({:album => @album, :artist => @artist})
  erb(:results)
end
