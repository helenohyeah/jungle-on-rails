class User < ActiveRecord::Base

  has_secure_password
  has_many :order
  
  REGEX_PATTERN = /(.+)@(.+)/

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    format: { with: REGEX_PATTERN, message: "invalid" },
      uniqueness: { case_sensitive: false }
  # validates :password, presence: true
  # validates :password_confirmation, presence: true

end
