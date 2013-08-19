get '/' do
  erb :index
end

get '/:username' do
  @screen_name = params[:username]
  @tweets = CLIENT.user_timeline(@screen_name, count: 10)
  erb :display
end

post '/' do
  redirect "/#{params[:username]}"
end