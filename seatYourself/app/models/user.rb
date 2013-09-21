class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :phone_number

  has_secure_password

  ROLES = %w[owner customer]

  has_many :reservations
  has_many :restaurants





end
