class RetwetsController < ApplicationController

  before_filter :authenticate_user!

  def create
    @twet = current_user.twets.create(twet_params)
    if @twet.valid?
      flash[:success] = "Your twet was shared"
      redirect_to user_profile_path(current_user.username)
    else
      get_twets
      flash[:error] = "Your twet could not be saved"
      render :action => :index and return
    end
  end

end
