class RsvpsController < ApplicationController

  def find
    render 'find'
  end

  def locate
    if params[:rsvp_name_query].blank?
      flash[:danger] = "Please enter a name."
      return render 'find'
    end

    @guests = Guest.where("lower(first_name || ' ' || last_name) LIKE ?", "%#{params[:rsvp_name_query]}%")
    if @guests.length > 0
      redirect_to action: :edit, id: @guests[0].id
    else
      flash[:danger] = "RSVP not found"
      render 'find'
    end
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(user_params)
      flash[:success] = "Thank you"
      redirect_to action: :find
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:guest)
    .permit(:foodstuff_id, :additional_comment)
  end
end
