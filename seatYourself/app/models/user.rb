class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password_digest, :phone_number

  has_many :reservations
  has_many :restaurants
end
