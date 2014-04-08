class CreateRetwets < ActiveRecord::Migration
  def change
    create_table :retwets do |t|

      t.timestamps
    end
  end
end
