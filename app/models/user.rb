class User < ActiveRecord::Base

  has_secure_password
  has_many :order
  
  REGEX_PATTERN = /(.+)@(.+)/

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    format: { with: REGEX_PATTERN, message: "invalid" },
      uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    end
  end

end
