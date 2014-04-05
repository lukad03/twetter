class UsersController < Devise::SessionsController
  def profile
    if params[:username]
      @user = User.where(username: params[:username]).first
    end
    @twets = @user.twets.order(created_at: :desc)
  end
end
