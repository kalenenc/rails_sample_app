class User < ApplicationRecord
  before_save { self.email = email.downcase } #you could have technically wrote self.email.downcase, but in the model object, self is optional on the right-hand side
  # or
  # before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } #the only caveat is that this doesn't guarantee uniqueness at the db level, only the model level
                                                          #aka, if you clicked submit twice for an email address, could be saved in the db twice!
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
