class Twet < ActiveRecord::Base
  belongs_to :user
  has_many :retwets
  before_save :mention

  validates :content, :presence => true, :length => { :minimum => 2, :maximum => 140 }
  validates :user, :presence => true

  # Gets all twets made by the users referenced by the ids passed, starting with the
  # most recent twet made.
  #
  def self.by_user_ids(*ids)
    where(:user_id => ids.flatten.compact.uniq).order('created_at DESC')
  end

  def mention
    self.content = mentionify(self.content)
  end

  def mentionify(content)
    content = content.gsub(/(?<!\w)@\w+/) do |u|
      username = u.gsub(/@/, '')
      if User.where(:username => username).blank?
        "@#{username}"
      else
        "<a href='/#{username}'>@#{username}</a>"
      end
    end
  end

end
