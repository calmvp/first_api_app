class TwitterUser < ActiveRecord::Base
  has_many :tweets
  validates :username, uniqueness: true 

  def tweets_stale?
    minutes = (self.tweets.last.created_at - Time.now) / 60.to_f
    minutes <= 15
  end

  def fetch_tweets(username)
    puts "running"
    @tweets = CLIENT.user_timeline(username)
      @tweets.each do |tweet|
        self.tweets << Tweet.find_or_create_by_body(body: tweet.text)
      end
  end

end
