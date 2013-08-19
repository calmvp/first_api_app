get '/' do
  erb :index
end

get '/:username' do
  @user = TwitterUser.find_or_create_by_username(params[:username])
  if @user.tweets.empty?
    username = @user.username
    @user.fetch_tweets(username)
  end
  if @user.tweets_stale?
     @user.fetch_tweets(username)
  end
  @tweets = @user.tweets.limit(10)
  erb :display
end


post '/' do
  redirect "/#{params[:username]}"
end