get '/' do
  erb :index
end

post '/1' do
    @user = TwitterUser.find_or_create_by_username(params[:username])
  if @user.tweets.empty?
    username = @user.username
    @user.fetch_tweets(username)
  end
  if @user.tweets_stale2?
     @user.fetch_tweets(username)
  end
  @tweets = @user.tweets.limit(10)
  if request.xhr? 
    erb :_display, layout: false
  else 
    erb :_display
  end
end