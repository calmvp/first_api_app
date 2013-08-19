class TwitterUser < ActiveRecord::Base
  has_many :tweets
  validates :username, uniqueness: true 

  def fetch_tweets(username)
    @tweets = CLIENT.user_timeline(username)
      @tweets.each do |tweet|
        self.tweets << Tweet.create(body: tweet.text)
      end
  end

  def 
    
  end

end
