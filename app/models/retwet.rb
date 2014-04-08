class Retwet < ActiveRecord::Base
  belongs_to :user
  belongs_to :twet

  validates :user, :presence => true
  validates :twet, :presence => true
end
