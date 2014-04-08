class RetwetsController < ApplicationController

  before_filter :authenticate_user!

  def create
    retwet = current_user.retwets.create(retwet_params)
    if retwet.valid?
      flash[:success] = "You retwetted!"
      redirect_to user_profile_path(current_user.username)
    else
      flash[:error] = "Your retwet could not be saved"
      render :action => :index and return
    end
  end

end
