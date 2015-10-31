class GuestFoodstuff < ActiveRecord::Base
  belongs_to :guest
  belongs_to :foodstuff
end
