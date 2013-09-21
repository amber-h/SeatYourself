class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :phone_number, :role

  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :name

  ROLES = %w[owner customer]

  has_many :reservations
  has_many :restaurants





end
