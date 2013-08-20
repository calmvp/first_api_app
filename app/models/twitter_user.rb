class TwitterUser < ActiveRecord::Base
  has_many :tweets
  validates :username, uniqueness: true 

  def tweets_stale?
    minutes = (Time.now - self.tweets.last.created_at) / 60.to_f
    minutes <= 15
  end

  def get_date_time_objects
    @datetime_objects = []
    @tweets = self.tweets.order("posted_time").limit(10)
    @tweets.each do |tweet|
      @datetime_objects << Time.parse(tweet.posted_time)
    end
  end

  def tweets_stale2?
    get_date_time_objects
    days_gone_by = @datetime_objects.first - @datetime_objects.last
    average_time = days_gone_by / @datetime_objects.length
    time_since_last_post = (Time.now - self.tweets.last.created_at)
    time_since_last_post >= average_time
  end 

  def fetch_tweets(username)
    @tweets = CLIENT.user_timeline(username)
      @tweets.each do |tweet|
        created_at
        self.tweets << Tweet.find_or_create_by_body(body: tweet.text, posted_time: tweet.created_at)
      end
  end

  #Result of datetime addition is in seconds.

end
