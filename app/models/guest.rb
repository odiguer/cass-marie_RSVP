class Guest < ActiveRecord::Base
  validates(:full_name, presence: true, length: { maximum: 50 })
  validates(:foodstuff_id, :presence => true, :if => "attending_ind?")
  belongs_to :foodstuff

  before_save :update_attending_ind!
  private
  def update_attending_ind!
    if !self.attending_ind
      self.foodstuff_id = nil
      self.additional_comment = nil
    end
  end

end
