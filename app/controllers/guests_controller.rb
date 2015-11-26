class GuestsController < ApplicationController
  before_action :logged_in_user

  def index
    @guests = Guest.includes(:foodstuff).all.order('full_name ASC')
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

  private
  def user_params
    params.require(:guest)
    .permit(:full_name, :foodstuff_id, :additional_comment, :attending_ind)
  end
end
