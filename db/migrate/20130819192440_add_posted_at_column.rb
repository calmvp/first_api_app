class AddPostedAtColumn < ActiveRecord::Migration
  def change
  	add_column :tweets, :posted_time, :string
  end
end
