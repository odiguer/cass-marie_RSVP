class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, presence: true, length: { maximum: 255 },  format: { with: VALID_EMAIL_REGEX },  uniqueness: true)
  validates(:first_name, presence: true, length: { maximum: 50 })
  validates(:last_name, presence: true, length: { maximum: 50 })
  has_secure_password()
  validates(:password, presence:true, length: { minimum: 6 })

  before_save { self.email = email.downcase }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
