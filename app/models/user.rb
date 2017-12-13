class User < ApplicationRecord
  before_save {email.downcase!}
  validates :name, presence: true, length: { Settings.user.name_maximum }
  validates :password, presence: true, length: { Settings.user.password_minimum }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: Settings.user.email_maximum },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: true,
    uniqueness: { case_sensitive: false }
  has_secure_password
end
