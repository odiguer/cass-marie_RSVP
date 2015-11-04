class FoodstuffsController < ApplicationController
  before_action :logged_in_user
  def index
    @foodstuffs = Foodstuff.all.order('foodstuff_name ASC')
  end

  def new
    @foodstuff = Foodstuff.new
  end

  def create
    @foodstuff = Foodstuff.new(user_params)
    if @foodstuff.save
      flash[:success] = "Foodstuff succesfully added."
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def edit
    @foodstuff = Foodstuff.find(params[:id])
  end

  def update
    @foodstuff = Foodstuff.find(params[:id])
    if @foodstuff.update_attributes(user_params)
      flash[:success] = "Foodstuff updated."
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:foodstuff)
    .permit(:foodstuff_name, :foodstuff_description)
  end
end
