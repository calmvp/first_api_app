get '/' do
  erb :index
end

get '/:username' do
  @user = TwitterUser.find_or_create_by_username(params[:username])
#   if @user.tweets.empty?
#     # User#fetch_tweets! should make an API call
#     # and populate the tweets table
#     #
#     # Future requests should read from the tweets table 
#     # instead of making an API call
#     username = @user.username
#     @user.fetch_tweets(username)
#   end
#   @tweets = @user.tweets.limit(10)
#   erb :display
# end
 if @user.tweets_stale?
    # User#fetch_tweets! should make an API call
    # and populate the tweets table
    #
    # Future requests should read from the tweets table 
    # instead of making an API call
    @user.fetch_tweets(username)
  end

  @tweets = @user.tweets.limit(10)
  erb :display
end


post '/' do
  redirect "/#{params[:username]}"
end