class SummariesController < ApplicationController
  before_action :logged_in_user

  def index
  end


  # private
  # def user_params
  #   params.require(:foodstuff)
  #   .permit(:password_digest, :foodstuff_description)
  # end
end
