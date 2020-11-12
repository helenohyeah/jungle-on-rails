class User < ActiveRecord::Base

  has_secure_password
  has_many :order
  
  REGEX_PATTERN = /\z(.+)@(.+)\z/

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    presence: true,
    format: { with: REGEX_PATTERN, message: "Email invalid" },
      uniqueness: { case_sensitive: false },
      length: { minimum: 4, maximum: 254 }
  validates :password_digest, presence: true

end
