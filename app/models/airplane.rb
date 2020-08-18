class Airplane < ApplicationRecord
  belongs_to :user
  # validates :address, :model, :category, :seat_capacity, :range, :daily_price
end
