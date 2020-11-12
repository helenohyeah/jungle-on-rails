class User < ActiveRecord::Base

  REGEX_PATTERN = /\z(.+)@(.+)\z/

  has_many :order

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    presence: true,
    format: { with: REGEX_PATTERN, message: "Email invalid" },
      uniqueness: { case_sensitive: false },
      length: { minimum: 4, maximum: 254 }
  validates :password_digest, presence: true

end
