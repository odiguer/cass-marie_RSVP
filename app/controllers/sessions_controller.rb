class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user.id
      redirect_back_or root_url
    else
      flash.now[:danger] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
