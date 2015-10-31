class Guest < ActiveRecord::Base
  validates(:first_name, presence: true, length: { maximum: 50 })
  validates(:last_name, presence: true, length: { maximum: 50 })

  before_save :titleize_case

  private
  def titleize_case
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize
  end
end
