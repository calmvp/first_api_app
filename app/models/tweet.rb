class Tweet < ActiveRecord::Base
  belongs_to :twitter_user
  validates :body, uniqueness: true 
end
