class UsersController < Devise::SessionsController
  def profile
    @twets = get_user.twets.order(created_at: :desc)
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
      @user = User.where(username: params[:username]).first
    end
  end

end
