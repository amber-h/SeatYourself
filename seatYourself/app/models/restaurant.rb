class Restaurant < ActiveRecord::Base
  attr_accessible :addr, :close_hour, :name, :open_hour, :phone, :picture, :seats
end
