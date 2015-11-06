class Guest < ActiveRecord::Base
  validates(:full_name, presence: true, length: { maximum: 50 })

  before_save :titleize_case

  private
  def titleize_case
    self.full_name = full_name.titleize
  end
end
