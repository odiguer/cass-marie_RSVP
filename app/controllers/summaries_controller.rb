class SummariesController < ApplicationController
  before_action :logged_in_user

  def index
    @guests = Guest.includes(:foodstuff).all.order('full_name ASC')
    @foodstuffs = Foodstuff.all
  end
end
