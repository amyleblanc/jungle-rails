class User < ActiveRecord::Base
  has_secure_password

  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false

  attr_reader :user_authenticated

  def authenticate_with_credentials(email, password)
    if authenticated = User.find_by_email(email.downcase.strip)&.authenticate(password)
      @user_authenticated = authenticated
    else
      @user_authenticated = nil
    end
  end
end
