require "bcrypt"

class User < ApplicationRecord
  validates :email, :password_digest, presence: true
  validates :password, length: { minimum: 6 }

  attr_reader :password

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    if user && user.is_password?(password)
      user
    else
      nil
    end
  end

  def is_password?(password)
    password_object = BCrypt::Password.new(password_digest)
    password_object.is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


end