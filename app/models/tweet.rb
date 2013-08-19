class Tweet < ActiveRecord::Base
  belongs_to :twitter_user
  validates :username, uniqueness: true
end
