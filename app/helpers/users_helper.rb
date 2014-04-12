module UsersHelper

  def can_retwet(twet)
    if twet.user_id == current_user.id
      return false
    elsif has_retweted(twet)
      return false
    else
      return true
    end
  end

  def has_retweted(twet)
    retwet(twet).present? ? true : false
  end

  def retwet(twet)
    current_user.retwets.where(:twet_id => twet.id).first
  end

  def can_follow(user)
    if get_user == User.where(id: get_follows)
      return false
    elsif get_user == current_user
      return false
    else
      return true
    end
  end

  def get_user
    User.where(username: params[:username]).first
  end

  def get_follows
    get_user.follows.map{|f| f.following_id}
  end

end
