class Tweet < ActiveRecord::Base
  belongs_to :twitter_user
  validates :body, uniqueness: true 

  scope :sidebar, lambda { order('created_at DESC').limit(5) }
  scope :for_user_id, lambda{ |user_id| where(:twitter_user_id: user_id) }
end

