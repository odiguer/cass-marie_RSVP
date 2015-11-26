class Guest < ActiveRecord::Base
  validates(:full_name, presence: true, length: { maximum: 50 })
  validates(:foodstuff_id, :presence => true, :if => "attending_ind?")
  belongs_to :foodstuff

  # @todo: get back to this shit. titleize replaces hyphens with spaces...
  # before_save :titleize_case
  # private
  # def titleize_case
  #   self.full_name = full_name.titleize
  # end
end
