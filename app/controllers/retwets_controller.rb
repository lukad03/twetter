class RetwetController < ApplicationController

  before_filter :authenticate_user!

  def create
    retwet = current_user.retwets.create(retwet_params)
    if retwet.valid? and retwet.persisted?
      flash[:success] = "You retwetted!"
    else
      flash[:error] = "Your retwet could not be saved"
    end
    redirect_to user_profile_path(current_user.username)
  end

  private

  def retwet_params
    params.require(:retwet).permit(:twet_id)
  end

end
