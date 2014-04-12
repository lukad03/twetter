class RetwetsController < ApplicationController

  before_filter :authenticate_user!

  def create
    retwet = current_user.retwets.create(retwet_params)
    if retwet.valid? and retwet.persisted?
      flash[:success] = "You retwetted!"
      redirect_to user_profile_path(current_user.username)
    else
      flash[:error] = "Your retwet could not be saved"
      render :action => :index and return
    end
  end

  def destroy
    if resource.exists?
      resource.destroy_all
      redirect_to user_profile_path(current_user.username)
    else
      flash[:error] = "We can't find the retwet to delete. Sorry!"
      redirect_to user_profile_path(current_user.username)
    end
  end

  private

  def resource
    @resource ||= current_user.retwets.where(:id => params[:id])
  end

  def retwet_params
    params.require(:retwet).permit(:twet_id)
  end

end
