require('sinatra')
require('./lib/cdorganizer')
require('sinatra/reloader')
also_reload('lib/**/*.rb')

list = []
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
  @album = params.fetch('album')
  @artist = params.fetch('artist')
  @user = CD.get_user()
  CD.new({:album => @album, :artist => Artist.new(@artist), :user => @user})
  redirect('/home')
end

post('/search_for_CD') do
  @album = params.fetch('album')
  @artist = params.fetch('artist')
  list = CD.search_for_cds(@album, @artist.name())
  redirect('/home')
end

post('/results') do
  erb(:results)
end
