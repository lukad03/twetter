class AddUserIdAndTwetIdtoRetwets < ActiveRecord::Migration

  def change
      add_column :retwets, :twet_id, :integer
      add_column :retwets, :user_id, :integer
  end
end
