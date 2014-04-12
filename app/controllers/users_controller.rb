class UsersController < Devise::SessionsController
  def profile
    @twets = get_user.twets
    @retwets = Retwet.where(:user_id => get_user)
    @retwets_twet_id = @retwets.map do |r|
      r.twet_id
    end
    @retwet_twets = Twet.where(id: @retwets_twet_id)
    @mashed_twets = @twets + @retwet_twets
    @all_twets = @mashed_twets.sort_by(&:created_at).reverse!
  end

  def following
    @users = get_user.follows.map do |f|
      f.following
    end
  end

  def followers
    @followers = Follow.where(following_id: get_user)
    @follows = @followers.map do |f|
      f.user_id
    end
    @users = User.where(id: @follows)
    #Go through each follow record with get_user's follow_id in it and return user_ids
  end

  private

  def get_user
    if params[:username]
      #need to make this if params valid
      @user = User.where(username: params[:username]).first
    else
      flash[:error] = "Oh no! That user doesn't exist."
      redirect_to user_profile_path(current_user.username)
    end
  end

  def get_twet
    @twet = Twet.where(id: params[:username])
  end

end
