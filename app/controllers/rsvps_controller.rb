class RsvpsController < ApplicationController

  def find
    render 'find'
  end

  def locate
    if params[:rsvp_name_query].blank? || params[:rsvp_name_query].length < 4
      flash.now[:warning] = "Veuillez entrer un nom"
      return render 'find'
    end

    @guests = Guest.where("full_name LIKE ?", "%#{params[:rsvp_name_query]}%")
    if @guests.length > 0
      redirect_to action: :edit, id: @guests[0].id
    else
      flash.now[:danger] = "Aucun RSVP n'a été trouvé pour ce nom; veuillez vérifier votre saisie et réessayer."
      render 'find'
    end
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(user_params)
      flash[:success] = "Votre RSVP a été mis à jour. Merci"
      redirect_to action: :find
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:guest)
    .permit(:foodstuff_id, :additional_comment, :attending_ind)
  end
end
