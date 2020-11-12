class User < ActiveRecord::Base

  REGEX_PATTERN = /^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$/

  has_many :order

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: REGEX_PATTERN, message: "Email invalid" } 
  validates :password_digest, presence: true

end
