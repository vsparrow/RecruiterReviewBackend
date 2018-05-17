require 'bcrypt'
class User < ApplicationRecord
  # users.password_hash in the database is a :string
  include BCrypt
  has_secure_password
  has_many :reviews

  # def password
  #   @password ||= Password.new(password_hash)
  # end
  #
  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end
end

#https://github.com/codahale/bcrypt-ruby
