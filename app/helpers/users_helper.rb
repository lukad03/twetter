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

end
