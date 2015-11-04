class GuestsController < ApplicationController
  before_action :logged_in_user

  def index
    @guests = Guest.all.order('first_name ASC')
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(user_params)
    if @guest.save
      flash[:success] = "Guest successfully created."
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(user_params)
      flash[:success] = "Guest successfully updated."
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:guest)
    .permit(:first_name, :last_name)
  end
end
