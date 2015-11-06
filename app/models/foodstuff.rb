class Foodstuff < ActiveRecord::Base
  validates(:foodstuff_name, presence: true, length: { maximum: 50 })
  validates(:foodstuff_description, length: { maximum: 250 })

  has_many :guests
end
